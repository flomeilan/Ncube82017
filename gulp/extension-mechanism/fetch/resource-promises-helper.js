'use strict';

var gutil = require('gulp-util')
,	nconf = require('nconf')
,	_ = require('underscore')
;

var ConversionTool = require('../conversion-tool')
,	FileCabinet = require('../../library/file-cabinet')
,	ManifestHelper = require('../client-script/ManifestHelper').getInstance()
;

var resource_promises_helper = {

	getFilesPromisesForAppResource: function (options)
	{
		var application_promises =  ManifestHelper.getResourceFiles(options.file_service_url, [options.manifest], options.resource)
		,	file_promises = [];

		_.each(application_promises, function(promise)
		{
			file_promises.push(
				promise.then(function(result)
				{
					result.files = result.files.map(function(file)
					{
						if(options.resource === 'templates')
						{
							file.content = FileCabinet.base64decode(file.content);
						}

						file.resourceType = options.resource;
						return file;
					});

					ConversionTool.extensionToModules(options.manifest, result.files);
					gutil.log(gutil.colors.green('Finished downloading ' + options.resource + ' for ' + result.application + ' of '+ options.manifest.type + ': ' +  options.manifest.name + '...'));
				})
			);
		});

		return file_promises;
	}

,	getFilesPromisesForResource: function (options)
	{
		var promise = ManifestHelper.getResourceFiles(options.file_service_url, [options.manifest], options.resource);

		return promise.then(function(files)
			{
				files = files.map(function(file)
				{
					if(options.resource === 'sass')
					{
						file.content = FileCabinet.base64decode(file.content);
					}
					
					file.resourceType = options.resource;
					return file;
				});

				ConversionTool.extensionToModules(options.manifest, files);
				gutil.log(gutil.colors.green(options.message_finished));
			});
	}

,	getAssetFilesPromises: function (options)
	{
		var assets = { files: [] }
		,	promise
		,	manifest_assets_aux = options.manifest.assets;
						
		_.each(options.manifest.assets, function(assets_entry)
		{
			var files = _.map(assets_entry.files, function(file)
			{
				return 'assets/' + file;
			});
			assets.files = assets.files.concat(files);
		});

		options.manifest.assets = assets;
		
		promise = ManifestHelper.getResourceFiles(options.file_service_url, [options.manifest], options.resource);
		options.manifest.assets = manifest_assets_aux;

		return promise.then(function(files)
			{
				files = files.map(function(file)
				{
					if(!file.file.endsWith('.ss'))
					{
						file.content = FileCabinet.base64decode(file.content);
					}

					file.resourceType = options.resource;
					return file;
				});

				//do not download services if theme mode
				if(!nconf.get('extensionMode'))
				{
					files = _.reject(files, (file) => { return file.file.endsWith('.ss') });
				}
				
				ConversionTool.extensionToModules(options.manifest, files);
				gutil.log(gutil.colors.green(options.message_finished));
			});
	}
};

module.exports = resource_promises_helper;