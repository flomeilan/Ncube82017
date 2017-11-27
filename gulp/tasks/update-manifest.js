/*jshint esversion: 6 */

var gulp = require('gulp')
,	gutil = require('gulp-util')
,	nconf = require('nconf')
,	path = require('path')
,	shell = require('shelljs')
,	_ =  require('underscore')
;

var update_helper = require('../extension-mechanism/update-manifest/update-manifest-resources')
,	compute_differences = require('../extension-mechanism/update-manifest/compute-differences')
;

'use strict';

function impactChanges(manifest)
{
	var new_manifest = {
		name: manifest.name
	,	vendor: manifest.vendor
	,	version: manifest.version
	,	type: manifest.type
	,	target: manifest.target
	,	description: manifest.description
	,	cct: manifest.cct
	,	assets: manifest.assets
	,	configuration: manifest.configuration
	,	sass: manifest.sass
	,	templates: manifest.templates
	,	javascript: manifest.javascript
	,	'ssp-libraries': manifest['ssp-libraries']
	,	local_folder: manifest.local_folder
	};

	shell.ShellString(JSON.stringify(new_manifest, null, 4)).to(path.join(new_manifest.local_folder, 'manifest.json'));
}

function updateManfiest(manifest, file_path, action)
{
	var mod_regex = new RegExp('\/' + manifest.name + '\/(.*)')
	,	module_path = file_path.match(mod_regex) && file_path.match(mod_regex)[1]
	,	asset_path = file_path.match(/\/assets\/(.*)/) && file_path.match(/\/assets\/(.*)/)[1]
	;

	var update_data = {
		manifest: manifest
	,	file_path: module_path
	,	action: action
	,	cb: impactChanges
	};

	var update_asset_data = {
		manifest: manifest
	,	file_path: asset_path
	,	action: action
	};
	
	var file_promise;

	switch(path.extname(file_path))
	{
		case '.scss':
			file_promise = update_helper.updateSass(update_data);
			break;
		case '.tpl':
			file_promise = update_helper.updateTemplates(update_data);
			break;
		case '.json':
			file_promise = update_helper.updateConfiguration(update_data);
			break;
		case '.js':
			file_promise = update_helper.updateJavascript(update_data);
			break;
		default:
			if(asset_path)
			{
				file_promise = update_helper.updateAssets(update_asset_data);
			}
			else
			{
				gutil.log(gutil.colors.yellow('Sorry. Could not update the manifest for the file ' + file_path));
				file_promise = Promise.resolve();
			}
			break;
	}

	return file_promise;
}

function getFilesPromises(manif_update_data)
{
	var manifest_files_promises = [];

	_.each(manif_update_data.differences.add, function(file)
	{
		manifest_files_promises.push(
			updateManfiest(manif_update_data.manifest, file, 'added')
		);
	});

	_.each(manif_update_data.differences.delete, function(file)
	{
		manifest_files_promises.push(
			updateManfiest(manif_update_data.manifest, file, 'deleted')
		);
	});

	return manifest_files_promises;
}


//compute all the differences from all the  manifests in the workspace folder
//for each manifest, get all the promises to change each file
//after all the files have updated the manifest, impact the changes (write the manifest)
//after all the manifests have finished, the task is completed

gulp.task('update-manifest', [], (cb) => {

	if(nconf.get('folders:extensions_path') || nconf.get('folders:theme_path'))
	{
		var maninfest_diff_promises = compute_differences.computeDifferences()
		,	update_manifest_promises = []
		;


		Promise.all(maninfest_diff_promises)
		.then(function(differences_data)
		{
			_.each(differences_data, function(manif_diff_data)
			{
				update_manifest_promises.push(
					
					Promise.all(getFilesPromises(manif_diff_data))
					.then(function()
					{
						impactChanges(manif_diff_data.manifest);
					})
				);
			});

			return Promise.all(update_manifest_promises);
		})
		.then(function()
		{
			cb();
		})
		.catch(function(error)
		{
			cb(error);
		});
	}
	else
	{
		gutil.log(gutil.colors.red('No extensions or themes in your workspace were found. Aborting. '));
		cb();
	}
	
});


if(nconf.get('extensionMode'))
{
	gulp.task('extension:update-manifest'
	,	'Updates the manifest removing and adding entries to match your files and folders.\n' 
	,	['update-manifest']);
}
else
{
	gulp.task('theme:update-manifest'
	,	'Updates the manifest removing and adding entries to match your files and folders.\n' 
	,	['update-manifest']);
}



// gulp.task('watch-manifest', [], ()=>
// {
// 	initWatchManifest();

// 	var file_manifest
// 	,	manifest_path;

// 	return gulp.watch(watched_files, function(event) {

// 	  if (event.type === 'added' ) {
// 	  	file_manifest = findManifest(manifests, event.path);
// 	  	manifest_path = path.join(file_manifest.local_folder, 'manifest.json');

// 	  	//update the last version in the manifest manager of the manifest
// 	  	file_manifest = manifest_manager.updateManifest(manifest_path);
// 	    updateManfiest(file_manifest, event.path.replace(/\\/g, '/'), event.type);
// 	  }
// 	  else if(event.type === 'deleted') {
// 	  	file_manifest = findManifest(manifests, event.path);
// 	  	manifest_path = path.join(file_manifest.local_folder, 'manifest.json');

// 	  	//update the last version in the manifest manager of the manifest
// 	  	file_manifest = manifest_manager.updateManifest(manifest_path);
// 	    updateManfiest(file_manifest, event.path.replace(/\\/g, '/'), event.type);
// 	  }
// 	  else if(event.type === 'renamed')
// 	  {
// 	  	file_manifest = findManifest(manifests, event.path);
// 	  	manifest_path = path.join(file_manifest.local_folder, 'manifest.json');

// 	  	//update the last version in the manifest manager of the manifest
// 	  	file_manifest = manifest_manager.updateManifest(manifest_path);
// 	    updateManfiest(file_manifest, event.path.replace(/\\/g, '/'), event.type);
// 	  }
// 	});
// });
