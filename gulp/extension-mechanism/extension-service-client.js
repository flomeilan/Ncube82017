
'use strict';

var RequestHelper = require('./client-script/RequestHelper');

var extension_service_client = (function(){

	var extension_service_client =  {
		
		REQUEST_TIMEOUT: 120

	,	searchExtensions: function searchExtensions(url)
		{
			var self = this;

			var options = {
				url: url
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'GET'
			,	data: null
			};

			return RequestHelper.request(options);
		}

	,	getTargets: function getTargets(url)
		{
			var self = this;

			var options = {
				url: url + '&operation=get_targets'
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'GET'
			,	data: null
			};

			return RequestHelper.request(options);
		}
		
	,	createExtension: function createExtension(url, extension_data)
		{
			var self = this;
			var options = {
				url: url
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'POST'
			,	data: JSON.stringify({
					extension: extension_data
				,	operation: 'create_extension'
				})
			};

			return RequestHelper.request(options);
		}
		
	,	updateExtension: function updateExtension(url, extension_data)
		{
			var self = this;
			var options = {
				url: url
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'PUT'
			,	data: JSON.stringify({
					extension: extension_data
				,	operation: 'update_extension'
				})
			};

			return RequestHelper.request(options);
		}	
	};

	return extension_service_client;
})();

module.exports = extension_service_client;