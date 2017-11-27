'use strict';

var gutil = require('gulp-util')
,	nconf = require('nconf')
,	path = require('path')
,	_ = require('underscore')
;

var RequestHelper = require('./client-script/RequestHelper')
,	ExtensionServiceClient = require('./extension-service-client')
,	WebsiteService = require('./website-service')
;

'use strict';

RequestHelper.reslet_mode = true;

var extension_record_helper = {

	searchExtensions: function searchExtensions(data)
	{
		var credentials = nconf.get('credentials');
		RequestHelper.setCredentials(credentials);

		var query_params = { 
				script: nconf.get('script:extension_service')
			,	name: data.manifest.name
			,	vendor: data.manifest.vendor
			,	version: data.manifest.version
			,	method: 'GET'
		};

		var extension_service_url = WebsiteService.formatUrl(credentials, query_params);
		
		return ExtensionServiceClient.searchExtensions(extension_service_url)
			.then(function(response)
			{
				var extensions = response.result.extensions;

				if(extensions.length < 0 || extensions.length > 1)
				{
					return Promise.reject('There are no extensions or several extensions for the filters given');
				}

				else if(extensions.length === 0)
				{
					data.create_new_record = true;
					data.extension_record = {
						name: data.manifest.name
					,	vendor: data.manifest.vendor
					,	type: data.manifest.type
					,	targets: data.manifest.target
					,	version: data.manifest.version
					,	description: data.manifest.description
					};
				}
				else
				{
					data.extension_record = extensions[0];
					data.has_bundle = !!extensions[0].bundle_id;
				}

				return data;
			});
	}

,	getTargets: function getTargets(data)
	{
		var credentials = nconf.get('credentials');
		RequestHelper.setCredentials(credentials);

		var query_params = { 
				script: nconf.get('script:extension_service')
			,	name: data.manifest.name
			,	vendor: data.manifest.vendor
			,	version: data.manifest.version
			,	method: 'GET'
		};

		var extension_service_url = WebsiteService.formatUrl(credentials, query_params);
		
		return ExtensionServiceClient.getTargets(extension_service_url)
				.then(function(response)
				{
					return response.result.available_targets;
				});
	}
	
,	checkExtensionBundle: function checkExtensionBundle(data, cb)
	{
		gutil.log(gutil.colors.green('Checking if ' + data.manifest.name + ' is a published ' + data.manifest.type + '...'));
		extension_record_helper.searchExtensions(data)
		.then(function(data)
		{
			if(data.create_new_record)
			{
				gutil.log(gutil.colors.green('No Extension record found for ' + 
						data.manifest.name + ' - ' + data.manifest.version + ' Vendor ' + data.manifest.vendor + 
						'. Preparing to create a new ' + data.manifest.type + '...'));
			}

			extension_record_helper.getTargets(data)
			.then(function(targets)
			{
				data.targets = targets;
				cb(null, data);
			});
		})
		.catch(function(error)
		{
			cb(error);
		});
	}

,	checkExistingExtension: function checkExistingExtension(data, cb)
	{
		if( data.new_extension &&
			((data.extension_record.name !== data.new_extension.name || 
			data.extension_record.version !== data.new_extension.version || 
			data.extension_record.vendor !== data.new_extension.vendor) ||
			data.create_new_record))
		{
			var query_params = { 
					script: nconf.get('script:extension_service')
				,	name: data.new_extension.name
				,	vendor: data.new_extension.vendor
				,	version: data.new_extension.version
				,	method: 'GET'
			};

			var credentials = nconf.get('credentials')
			,	extension_service_url = WebsiteService.formatUrl(credentials, query_params)
			;

			RequestHelper.setCredentials(credentials);

			ExtensionServiceClient.searchExtensions(extension_service_url)
			.then(function(response)
			{
				var extensions = response.result.extensions;
				if(extensions.length > 0)
				{
					var folder = path.join(nconf.get(''), data.new_extension.name, data.new_extension.vendor, data.new_extension.version);
					gutil.log(gutil.colors.yellow('Warning: This deploy will override the content of the extension folder ' + folder + ' and record ' + extensions[0].extension_id));
				}
				cb(null, data);
			})
			.catch(function(error)
			{
				cb(error);
			});
		}
		else
		{
			cb(null, data);
		}
	}

,	updateExtensionRecord: function updateExtensionRecord(data, cb)
	{
		var credentials = nconf.get('credentials');
		RequestHelper.setCredentials(credentials);

		var extension_create_url = WebsiteService.formatUrl(credentials,  { script: nconf.get('script:extension_service') , method: 'POST'})
		,	extension_update_url = WebsiteService.formatUrl(credentials,  { script: nconf.get('script:extension_service') , method: 'PUT'})
		;
		var promises = [];

		if(data.record_operation && extension_record_helper.extensionChanged(data))
		{
			switch(data.record_operation)
			{
				case 'create':

					var new_extension = {
						name: data.new_extension.name
					,	type: data.manifest.type
					,	targets: data.new_extension.targets
					,	description: data.new_extension.description
					,	vendor: data.new_extension.vendor
					,	version: data.new_extension.version
					,	manifest_id: data.manifest_file_id
					};

					gutil.log(gutil.colors.green('Creating new ' + data.manifest.type + ' record: ' + data.new_manifest.vendor + ' - ' + data.new_manifest.name + ' - ' + data.new_manifest.version));

					promises.push(ExtensionServiceClient.createExtension(extension_create_url, new_extension)
					.then(function(response)
					{
						data.deploy_result = response.header.status.code;
						gutil.log(gutil.colors.green('New ' + data.manifest.type + ' record created successfully with id ' + response.result.extension_id));
					}));
					break;

				case 'update':

					var update_extension = {
						extension_id: data.extension_record.extension_id
					,	name: data.new_extension.name
					,	targets: data.new_extension.targets
					,	description: data.new_extension.description
					,	vendor: data.new_extension.vendor
					,	version: data.new_extension.version
					,	manifest_id: data.manifest_file_id
					};

					gutil.log(gutil.colors.green('Updating ' + data.manifest.type + ' record: ' + data.new_manifest.vendor + ' - ' + data.new_manifest.name + ' - ' + data.new_manifest.version));

					promises.push(ExtensionServiceClient.updateExtension(extension_update_url, update_extension)
					.then(function(response)
					{
						data.deploy_result = response.header.status.code;
						gutil.log(gutil.colors.green(data.manifest.type + ' record updated successfully.'));
					}));
					break;
				default:
					cb(new Error('Invalid record  operation ' + data.record_operation));
					break;
			}

			Promise.all(promises)
			.then(function()
			{
				cb(null, data);
			})
			.catch(function(error)
			{
				error = (error.error && error.error.message) || error;

				cb(new Error('Error updating or creating Extension Record\n\n' + JSON.stringify(error)));
			});
		}
		else
		{
			cb(null, data);
		}
	}

,	extensionChanged: function extensionChanged(data)
	{
		return (data.new_extension && data.create_new_record) ||
			(data.new_extension &&
			(data.extension_record.vendor !== data.new_extension.vendor ||
			data.extension_record.name !== data.new_extension.name ||
			data.extension_record.version !== data.new_extension.version ||
			data.extension_record.manifest_id !== data.manifest_file_id ||
			data.extension_record.description !== data.new_extension.description ||
			!_.isEqual(_.pluck(data.extension_record.targets, 'target_id'), data.new_extension.targets)));
	}
};

module.exports = extension_record_helper;