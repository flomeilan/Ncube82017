'use strict';

var add = require('gulp-add')
,	amdOptimize = require('amd-optimize')
,	async = require('async')
,	concat = require('gulp-concat')
,	gif = require('gulp-if')
,	gulp = require('gulp')
,	gulp_handlebars = require('gulp-handlebars')
,	handlebars = require('handlebars')
,	path = require('path')
,	_ = require('underscore')
;

var connect = require('./connect')
,	manifest_manager = require('../extension-mechanism/manifest-manager')
,	watch_manager = require('../extension-mechanism/watch-manager')
,	nconf = require('nconf')
;

var local_folders = _.map(nconf.get('folders:source'), function(folder)
{
	return path.join(folder, '**/*.tpl');
});

gulp.task('pre-templates', [], function(cb)
{
	function getAMDIndexFile(requiredFiles)
	{
		var requiredModules = _.map(requiredFiles, function(f){return path.basename(f, '.js');});
		var indexName = 'index-javascript-lib';
		var counter = 0;

		var indexContent =
			'define(\''+indexName+'\', [' +
				_.map(requiredModules, function(m)
					{
						if(m.indexOf('handlebars.runtime') === 0)
						{
							return '\'Handlebars\'';
						}

						return '\'' + m + '\'';
					}).join(', ') +
				'], function(' +
				_.map(requiredModules, function()
					{
						counter++;
						return 'a' + counter;
					}).join(', ') +
				'){});';

		return {name: indexName, content: indexContent};
	}

	var	outputFile = 'javascript-libs.js'
	,	files = [
			'node_modules/almond/almond.js'
		,	'gulp/extension-mechanism/client-script/LoadTemplateSafe.js'
		,	'node_modules/handlebars/dist/handlebars.runtime.min.js'
		,	'gulp/extension-mechanism/client-script/Handlebars.CompilerNameLookup.js'
		]
	,	indexFile = getAMDIndexFile(files)
	,	amdOptimizeConfig = {paths: {'Handlebars': 'handlebars.runtime.min'}, preserveFiles:true, preserveComments:true};

	gulp.src(files)
		.pipe(add(indexFile.name + '.js', indexFile.content))
		.pipe(amdOptimize(indexFile.name, amdOptimizeConfig)).on('error', cb)
		.pipe(concat(outputFile))
		.pipe(gulp.dest(path.join('.'), { mode: '0777' }))
		.on('end', cb);
});

function findTemplateDependencies(content)
{
	var regex = /data-\w*\-{0,1}template=\\"([^"]+)\\"/gm
	,	result
	,	deps = ['\'Handlebars\'', '\'Handlebars.CompilerNameLookup\''];
	do
	{
		result = regex.exec(content);
		if(result && result.length > 1)
		{
			deps.push('\'' + result[1] + '.tpl\'');
		}
	}
	while(result);
	return deps;
}

var nameLookup = handlebars.JavaScriptCompiler.prototype.nameLookup;

var wrapTemplates = function()
{
	var lazypipe = require('lazypipe')
	,	map = require('map-stream');

	var handleOverrides = _.bind(manifest_manager.handleOverrides, manifest_manager);

	var theme_manifest = manifest_manager.getThemeManifest()
	,	theme_path = [
			'extensions'
		,	theme_manifest.vendor
		,	theme_manifest.name
		,	theme_manifest.version
		,	''].join('/');

	var compile_templates = function compile_templates()
	{
		handlebars.JavaScriptCompiler.prototype.nameLookup = function(parent, name)
		{
			return 'compilerNameLookup(' + parent + ',"' + name + '")';
		};
		return gulp_handlebars({handlebars: handlebars});
	};

	var handlebarsStream = lazypipe()
	.pipe(handleOverrides)
	.pipe(compile_templates)
	.pipe(map, function (file, cb)
	{
		var current_contents = file.contents.toString()
		,	module_name = path.basename(file.path, '.js');

		var deps = findTemplateDependencies(current_contents);

		var extension_path = manifest_manager.getTemplateExtensionPath(file.path);

		file.contents = new Buffer(
			'define(\'' + module_name + '.tpl\', [' + deps.join(',') + '], function (Handlebars, compilerNameLookup){ var t = ' + current_contents + '; var main = t.main; t.main = function(){ arguments[1] = arguments[1] || {}; var ctx = arguments[1]; ctx._extension_path = \'' + extension_path + '\'; ctx._theme_path = \'' + theme_path + '\'; return main.apply(this, arguments); }; var template = Handlebars.template(t); template.Name = \'' + module_name + '\'; return template;});'
		);

		cb(null, file);
	});

	return handlebarsStream;
};

gulp.task('templates', ['pre-templates'], (gulpDone)=>
{
	var condition = function(file)
	{
		return path.basename(file.path) !== 'javascript-libs.js';
	};

	async.each(manifest_manager.getTemplateApplications(), (application, cb)=>
	{
		var templates = manifest_manager.getApplicationTemplates(application, true);
		var stream = wrapTemplates();

		gulp.src(_.union(['javascript-libs.js'], templates))
			.pipe(gif(condition, stream())).on('error', gulpDone)
		    .pipe(concat(application + '-templates.js'))
		    .pipe(gulp.dest(nconf.get('folders:output')))
		    .on('end', cb);
	}, function()
	{
		handlebars.JavaScriptCompiler.prototype.nameLookup = nameLookup;
		
		connect.reload();
		gulpDone.apply(this, arguments);
	});

	// register templates file watch
	watch_manager.registerWatch(local_folders, ['templates']);
});
