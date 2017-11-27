'use strict';

var gulp = require('gulp')
,	gutil = require('gulp-util')
,	nconf = require('nconf')
,	map = require('map-stream')
,	path = require('path')
,	shell = require('shelljs')
,	_ = require('underscore')
;

var ManifestManager = require('../manifest-manager');

var prepare_deploy_folder = {

	prepareDeployFolder: function prepareDeployFolder(data, cb)
	{
		try
		{
			gutil.log(gutil.colors.green('Preparing content to deploy in ' + nconf.get('folders:deploy') + '...'));

			var new_manifest = {
				name: data.manifest.name
			,	vendor: data.manifest.vendor
			,	type: data.manifest.type
			,	target: data.manifest.target
			,	version: data.manifest.version
			,	description: data.manifest.description
			,	override: data.manifest.override
			,	templates: data.manifest.templates
			,	sass: data.manifest.sass
			,	assets: data.manifest.assets
			};

			if(data.new_extension)
			{
				var new_targets = [];

				_.each(data.new_extension.targets, function(target_id)
				{
					var target_obj = _.find(data.targets, function(target)
						{
							return target.target_id === target_id;
						});

					if(target_obj)
					{
						new_targets.push(target_obj.name);
					}
				});

				new_manifest.name = data.new_extension.name;
				new_manifest.vendor = data.new_extension.vendor;
				new_manifest.version = data.new_extension.version;
				new_manifest.target = new_targets.join(',');
				new_manifest.description = data.new_extension.description;
			}

			var deploy_path = path.join(nconf.get('folders:deploy'), new_manifest.vendor, new_manifest.name, new_manifest.version)
			,	sources = nconf.get('deploy_config:source')
			,	src_folder = nconf.get('folders:theme_path')
			, 	src_paths = []
			;

			if(sources)
			{
				src_paths.push('manifest.json');

				_.each(sources, function(source)
				{
					switch(source)
					{
						case 'templates':
							src_paths.push(path.join('**', '*.tpl'));
							break;

						case 'sass':
							src_paths.push(path.join('**', '*.scss'));
							break;

						case 'assets':
							var asset_files = ManifestManager.getAssetFilesForManifest(data.manifest.name);
							src_paths = src_paths.concat(asset_files);
							break;
					}
				});
			}
			else
			{
				src_paths.push('*');
			}

			shell.rm('-rf', nconf.get('folders:deploy') + '/*');

			gulp.src(src_paths, {cwd: src_folder + '/**'})
			.pipe(map(function(file, done)
			{
				if(path.basename(file.path) === 'manifest.json')
				{
					file.contents = new Buffer(JSON.stringify(new_manifest, null, 4));
				}

				done(null, file);
			}))
			.pipe(gulp.dest(deploy_path, {mode: '0777'}))
			.on('end', function()
				{
					data.new_manifest = new_manifest;
					cb(null, data);
				}
			)
			.on('error', function(err)
				{
					cb(err);
				}
			);
		}
		catch(err)
		{
			cb(err);
		}
	}
};

module.exports = prepare_deploy_folder;