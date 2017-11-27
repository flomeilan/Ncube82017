var path = require('path')
,	fs = require('fs')
,	gutil = require('gulp-util')
,	nconf = require('nconf')
,	_ = require('underscore')
;
	
'use strict';

module.exports = function()
{

	//set up the manifest manager
	var manifest_manager = require('./manifest-manager')
	,	source_path = nconf.get('folders:source:source_path');

	if(!nconf.get('folders:theme_path'))
	{
		var task_name = nconf.get('extensionMode') ? 'gulp extension:fetch' : 'gulp theme:fetch';

		gutil.log(gutil.colors.red('No local theme found. You need to run ' + task_name + ' before. Aborting. '));
		process.exit(1);
	}

	var theme_path = path.join(nconf.get('folders:theme_path'))
	,	app_manifest_path = path.join(nconf.get('folders:application_manifest'), 'application_manifest.json')
	,	extensions_path
	;

	if(nconf.get('extensionMode'))
	{
		extensions_path = source_path;
	}
	else
	{
		extensions_path = nconf.get('folders:source:extras_path');
	}

	if(fs.existsSync(app_manifest_path))
	{
		nconf.set('application:application_manifest', JSON.parse(fs.readFileSync(app_manifest_path).toString()));
	}

	var src_folders = nconf.get('folders:source');

	_.each(src_folders, function(src_folder)
	{
		if(!fs.existsSync(src_folder))
		{
			if(!nconf.get('extensionMode'))
			{
				throw new Error('The source path "' + src_folder + '" does not exist. You need to execute "gulp theme:fetch" first.');
			}
			else
			{
				throw new Error('The source path "' + src_folder + '" does not exist. You need to execute "gulp extension:fetch" first.');
			}

		}
	});

	//add all extension manfiests
	var manifest_path
	,	new_extensions_path = []
	,	workspace_ext_path
	;

	if(fs.statSync(theme_path).isDirectory())
	{

		manifest_path = path.join(theme_path, 'manifest.json');
		manifest_manager.addManifest(manifest_path);
	}

	_.each(fs.readdirSync(extensions_path), function(folder)
	{
		var manifest_path = path.join(extensions_path, folder);

		if(fs.statSync(manifest_path).isDirectory())
		{
			var isExtraFolder = nconf.get('folders:source:extras_path') &&
									nconf.get('folders:source:extras_path').includes(folder);

			//if in extension mode do not add the extras folder, the manifest of the theme
			//has already been added
			if(!nconf.get('extensionMode') || !isExtraFolder)
			{

				workspace_ext_path = manifest_path;
				manifest_path = path.join(manifest_path, 'manifest.json');
				manifest_manager.addManifest(manifest_path);

				if(nconf.get('extensionMode'))
				{
					new_extensions_path.push(workspace_ext_path);
				}
			}
		}
	});

	//do not register new overrides if working in the extension tools
	if(!nconf.get('extensionMode'))
	{
		var overrides = require('./overrides');
		overrides.updateOverrides();
	}
	else
	{
		//update extension paths
		new_extensions_path = new_extensions_path.map((path) => path.replace('\\', '/'));

		var config_content = JSON.parse(fs.readFileSync(nconf.get('config_path')).toString());
		nconf.set('folders:extensions_path', new_extensions_path);
		config_content.folders = nconf.get('folders');

		fs.writeFileSync(nconf.get('config_path'), JSON.stringify(config_content, null, 4));
	}

	return manifest_manager;
};