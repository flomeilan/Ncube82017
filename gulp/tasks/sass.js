'use strict';

var add = require('gulp-add')
,	async = require('async')
,	gulp = require('gulp')
,	map = require('map-stream')
,	path = require('path')
,	sass = require('gulp-sass')
,	_ = require('underscore')
,	args = require('yargs').argv
,	shell = require('shelljs');

var connect = require('./connect')
,	manifest_manager = require('../extension-mechanism/manifest-manager')
,	watch_manager = require('../extension-mechanism/watch-manager')
,	nconf = require('nconf');

// It's needed add an extra Sass file as a dependency of MyAccount when 'styleguide' task is called.
// This action is required only to build the Styleguide site.
var styleguide = args._.indexOf('styleguide') !== -1;

var local_folders = _.map(nconf.get('folders:source'), function(folder)
{
	return path.join(folder, '**/*.scss');
});

gulp.task('sass-prepare', function (cb)
{
	var entryPoints = manifest_manager.getSassBasicEntryPoints();

	function isEntryPoint(file_path)
	{
		var entry_point = _.find(entryPoints, function(entry_point)
		{
			return file_path.indexOf(entry_point.replace(/\\/g, path.sep)) !== -1;
		});

		return entry_point;
	}

	var theme_manifest = manifest_manager.getThemeManifest()
	,	theme_path = [
			'..'
		,	'extensions'
		,	theme_manifest.vendor
		,	theme_manifest.name
		,	theme_manifest.version
		,	''].join('/');

	gulp.src(local_folders)
		.pipe(manifest_manager.handleOverrides())
		.pipe(map(function(file, cb)
		{
			var entry_point = isEntryPoint(file.path);
			if(entry_point)
			{
				var ext_name = entry_point.split(path.sep)[0]
				,	manifest = manifest_manager.getManifestByName(ext_name)
				,	assets_paths = [
						'..'
					,	'extensions'
					,	manifest.vendor
					,	manifest.name
					,	manifest.version
					,	''].join('/');

				var	content = '@function getExtensionAssetsPath($asset){\n';
    			content += '@return \'' + assets_paths + '\' + $asset;\n';
				content += '}\n\n';

				content += '@function getThemeAssetsPath($asset){\n';
    			content += '@return \'' + theme_path + '\' + $asset;\n';
				content += '}\n\n';

				var file_content = content + file.contents.toString();

				if (styleguide && path.basename(file.path) === 'myaccount.scss')
				{
					file_content += '@import "../../../../gulp/library/sc5-styleguide/lib/app/css-suitecommerce/_styleguide.scss"'
				}

				file.contents = new Buffer(file_content);
			}

			if(nconf.get('extensionMode'))
			{
				file.path = file.path.replace(path.normalize(nconf.get('folders:theme')), '');
			}
			else
			{
				file.path = file.path.replace(path.normalize(nconf.get('folders:extensions')), '');
			}

			cb(null, file);
		}))
		.pipe(gulp.dest('tmp', {mode: '0777'}))
		.on('end', cb)
		.on('error', cb);
});

gulp.task('clean-sass-tmp', ['compile-sass'], () => shell.rm('-rf', 'tmp'));

gulp.task('compile-sass', ['sass-prepare'], function (gulpDone)
{
	var entryPoints = manifest_manager.getSassEntryPoints();
	async.each(_.keys(entryPoints), (entryPoint, cb)=>
	{
		var entrypoint_value = entryPoints[entryPoint];

		gulp.src([])
			.pipe(add(entryPoint + '.scss', entrypoint_value))
			.pipe(sass.sync()).on('error', gulpDone)
			.pipe(map(function(file, cb)
			{
				var file_content = file.contents.toString();
				file_content = file_content.replace(/:\s*\"\\(\\f.*?)\"/ig, ':\"$1\"');

				file.contents = new Buffer(file_content);
				cb(null, file);
			}))
		    .pipe(gulp.dest(path.join(nconf.get('folders:output'), 'css')))
		    .on('end', cb);
	}, function()
	{
		connect.reload();
		gulpDone.apply(this, arguments);
	});

	// register sass file watch
	var to_execute = ['compile-sass'];

	// If styleguide task was called, 'styleguide:generate' and 'styleguide:applystyles' tasks will be added to the 'watch' task.
	if (styleguide) {
		to_execute = to_execute.concat(['styleguide:generate', 'styleguide:applystyles']);
	}

	watch_manager.registerWatch(local_folders, to_execute);
});

gulp.task('sass', ['clean-sass-tmp']);
