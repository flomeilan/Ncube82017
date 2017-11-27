'use strict';

var nconf = require('nconf')
,	_ = require('underscore')
;

var RequestHelper = require('../client-script/RequestHelper')
,	ResourcePromisesHelper = require('./resource-promises-helper')
,	WebsiteService = require('../website-service')
;

var DownloadResourcesHelper = {

	getManifestFilePromises: function getManifestFilePromises(manifest)
	{
		var file_promises = this.downloadFiles(manifest);
		return Promise.resolve(file_promises);
	}

,	downloadFiles: function downloadFiles(manifest)
	{
		var credentials = nconf.get('credentials');
		RequestHelper.setCredentials(credentials);

		var allowed_resources = nconf.get('application:application_manifest').extensible_resources
		,	file_promises = [];

		_.each(manifest, function(resource_data, resource)
		{
			if(_.contains(allowed_resources, resource))
			{
				var message_finished = 'Finished downloading ' + resource + ' of ' + manifest.type + ': ' +  manifest.name + '...'
				,	resource_promises;
				
				var file_service_url = WebsiteService.formatUrl(
						nconf.get('credentials')
					,	{ 
						 	script: nconf.get('script:file_service')
						 ,	method: 'POST'
						}
					);

				switch(resource)
				{
					case 'templates':

						resource_promises = ResourcePromisesHelper.getFilesPromisesForAppResource({
								file_service_url: file_service_url
							,	manifest: manifest
							,	resource: resource
							,	message_finished: message_finished
							});

						file_promises = file_promises.concat(resource_promises);
						break;

					case 'sass':

						resource_promises = ResourcePromisesHelper.getFilesPromisesForResource({
								file_service_url: file_service_url
							,	manifest: manifest
							,	resource: resource
							,	message_finished: message_finished
							});

						file_promises.push(resource_promises);
						break;

					case 'assets':

						resource_promises = ResourcePromisesHelper.getAssetFilesPromises({
								file_service_url: file_service_url
							,	manifest: manifest
							,	resource: resource
							,	message_finished: message_finished
							});

						file_promises.push(resource_promises);
						break;
				}
			}
		});

		return file_promises;
	}
};

module.exports = DownloadResourcesHelper;