'use strict';

var gulp = require('gulp-help')(require('gulp'), { hideDepsMessage: true, hideEmpty: true })
,	fs = require('fs')
,	deploy_lib = require('../extension-mechanism/deploy/deploy')
,	gutil = require('gulp-util')
,	path = require('path')
,	nconf = require('nconf')
,	shell = require('shelljs')
,	_ = require('underscore')
;

var ConversionTool = require('../extension-mechanism/conversion-tool');
nconf.argv(
	{
		'deploy_config:create': {
			alias: 'create'
		,	describe: '--create Automatically will upload the local extension to a new folder and create a new extension record.'
		,	demand: false
		}

	,	'deploy_config:update': {
			alias: 'update'
		,	describe: '--update Automatically will deploy the folders, and update the version of the extension record if necessary.'
		,	demand: false
		,	default: true
		}

	,	'deploy_config:advanced': {
			alias: 'advanced'
		,	describe: '--advanced The deploy will give the option to update the extension version, description and targets.'
		,	demand: false
		,	default: false
		}

	,	'deploy_config:skip_compilation': {
	      alias: 'skip-compilation',
	      describe: '--skip-compilation Skip extra compilation of the sass and templates to check for syntax errors, and upload directly the source code and manifest',
	      demand: false,
	      default: false
	    }

	,	'deploy_config:source': {
	      alias: 'source',
	      describe: '--source <source> Deploy only sass or templates files',
	      demand: false,
	      default: false
	    }

	,	'credentials:vm': {
	      alias: 'vm',
	      describe: 'Virtual Machine',
	      demand: false
	    }

	,	'credentials:molecule': {
	      alias: 'm',
	      describe: 'Molecule',
	      demand: false
	    }

	,	'credentials:nsVersion': {
	      alias: 'nsVersion',
	      describe: 'Version',
	      demand: false
	    }

	,	'deploy_config:debug_mode': {
			alias: 'debug'
		,	describe: '--debug will upload javascript without minifying.'
		,	demand: false
		,	default: false
		}
	}
);

var deploy_config = nconf.get('deploy_config');
nconf.set('deploy_config', deploy_config);

var compilation_tasks = ['update-validate', 'templates', 'sass']
,	application_manifest = nconf.get('application:application_manifest')
;

if(nconf.get('extensionMode'))
{
	compilation_tasks.push('javascript');
}

if(application_manifest && deploy_config.source)
{
	var sources = deploy_config.source.split(',')
	,	valid_sources = nconf.get('application:application_manifest').extensible_resources
	;

	sources = _.filter(sources, function(source)
	{
		if(!nconf.get('extensionMode'))
		{
			return _.contains(['templates', 'sass', 'assets'], source);
		}

		return _.contains(valid_sources, source);
	});

	var sources_tasks = _.filter(sources, function(source)
	{
		return _.contains(compilation_tasks, source);
	});

	nconf.set('deploy_config:source', sources);
	compilation_tasks = ['update-validate'].concat(sources_tasks);
	gutil.log(gutil.colors.green('Deploying only ' + sources.join(',') + '...'));
}

// In case the developer has updated the theme name in the manifest, it needs to rename the folder
// and update config paths
if(_.indexOf(['theme:deploy', 'theme:local'], process.argv[2]) !== -1)
{
	if(nconf.get('folders:theme_path') && fs.existsSync(nconf.get('folders:theme_path')) && 
		fs.existsSync(path.join(nconf.get('folders:theme_path'), 'manifest.json')))
	{
		var manifest_path = path.join(nconf.get('folders:theme_path'), 'manifest.json')
		,	manifest = JSON.parse(fs.readFileSync(manifest_path).toString());

		var config_theme_path = nconf.get('folders:theme_path')
		,	manifest_theme_path = path.join(nconf.get('folders:source:source_path'), manifest.name);

		if(path.sep !== '/')
		{
			config_theme_path = config_theme_path.replace('/', '\\');
		}

		if(config_theme_path !== manifest_theme_path)
		{
			shell.mv(config_theme_path, manifest_theme_path);
			ConversionTool.updateConfigPaths(manifest);
		}
	}
}

if(_.indexOf(['extension:deploy', 'extension:local'], process.argv[2]) !== -1)
{
	if(nconf.get('folders:extensions_path'))
	{
		var extensions = nconf.get('folders:extensions_path');
		_.each(extensions, function(ext_folder)
		{
			var manifest_path = path.join(ext_folder, 'manifest.json')
			,	manifest = JSON.parse(fs.readFileSync(manifest_path).toString());

			var configured_ext_path = ext_folder
			,	manifest_ext_path = path.join(nconf.get('folders:source:source_path'), manifest.name);

			if(path.sep !== '/')
			{
				configured_ext_path = configured_ext_path.replace('/', '\\');
			}

			if(configured_ext_path !== manifest_ext_path)
			{
				shell.mv(configured_ext_path, manifest_ext_path);
				ConversionTool.updateConfigPaths(manifest, {replace: true, replace_path: ext_folder});
			}
		});
	}
}

compilation_tasks = deploy_config.skip_compilation ? [] : compilation_tasks;

if(nconf.get('extensionMode'))
{
	gulp.task('extension:deploy'
		,	'Uploads an extension to the File Cabinet and creates or updates necessary records.'
		,	compilation_tasks
		, deploy_lib.deploy
		, {
			options: {
				'advanced': 'Updates the extension metadata: vendor, name, version, and description.'
			,	'create': 'Creates a new extension, instead of updating the current one.'
			,	'skip-compilation': 'Skips all the compilation tasks and uploads the extension directly.'
			,	'source': 'Comma separated list of resources to deploy. - i.e. templates,sass,ssp-libraries,services,assets,configuration -.'
			,	'm <arg>': 'Deploys to molecule named <arg>. i.e. "gulp extension:deploy --m f" deploys to system.f.netsuite.com.'
			,	'to': 'Asks for credentials, ignoring .nsdeploy file.\n'
			}
		});
}
else
{
	gulp.task('theme:deploy'
		,	'Uploads the theme to the File Cabinet and creates or updates necessary records.'
		,	compilation_tasks
		, deploy_lib.deploy
		, {
			options: {
				'advanced': 'Updates the theme metadata: vendor, name, version, and description. Available for custom themes.'
			,	'create': 'Creates a new theme, instead of updating the current one.'
			,	'skip-compilation': 'Skips all the compilation tasks and uploads the theme directly.'
			,	'source': 'Comma separated list of resources to deploy. - i.e. templates,sass,assets -.'
			,	'm <arg>': 'Deploys to molecule named <arg>. i.e. "gulp theme:deploy --m f" deploys to system.f.netsuite.com.'
			,	'to': 'Asks for credentials, ignoring .nsdeploy file.\n'
			}
		});
}
