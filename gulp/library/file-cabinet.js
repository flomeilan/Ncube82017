/* jshint node: true */
var	suitetalk = require('suitetalk');

var Helpers = require('./search-helper');

'use strict';

var FileCabinet = {

	credentials: {
		'email': 'email@email.com',
	    'account': '',
	    'role': 0,
	    'hostname': 'rest.netsuite.com',
	    'target_folder': '',
	    'webapp_id': 0,
	    'website': '',
	    'domain': 'mydomain.com'
	}

,	setCredentials: function setCredentials(credentials)
	{
		this.credentials = credentials;
	}

,	searchFile: function searchFile(params, cb)
	{
		suitetalk.setCredentials(this.credentials);

		params.name = params.fileName || params.name;

		var filters = Helpers.generateSearchFilters(
			{
				'availableWithoutLogin': 'boolean'
			,	'created'              : 'date'
			,	'dateViewed'           : 'date'
			,	'description'          : 'string'
			,	'documentSize'         : 'long'
			,	'externalId'           : 'recordRef'
			,	'externalIdString'     : 'string'
			,	'fileType'             : 'enum'
			,	'folder'               : 'recordRef'
			,	'internalId'           : 'recordRef'
			,	'internalIdNumber'     : 'long'
			,	'isAvailable'          : 'boolean'
			,	'isLink'               : 'boolean'
			,	'modified'             : 'date'
			,	'name'                 : 'string'
			,	'owner'                : 'recordRef'
			,	'url'                  : 'string'
			}
		,	params
		);

		suitetalk.searchBasic(
			{
				recordType: 'file'
			,	filters: filters
			}
		,	function(err, res)
			{
				if(err)
				{
					cb(err);
				}
				else
				{
					res = Helpers.formatSearchResponse(res);
					//console.log(JSON.stringify(res, null, 4));
					cb(null, res);
				}
						
			}
		);
	}


,	getFile: function getFile(internalId, cb)
	{
		var self = this;
		suitetalk.setCredentials(self.credentials);

		suitetalk.get(
			{
				recordType: 'file'
			,	internalId: internalId
			}
		,	function(err, res)
			{
				cb(err, res);
			}
		);
	}


,	getFileContents: function getFileContents(internalId, cb)
	{
		var self = this;

		self.getFile(internalId, function(err, res)
		{
			if (err)
			{
				cb(err);
			}
			else
			{
				if(err)
				{
					cb(err);
				}
				else
				{
					var base64Data = res.getResponse[0].readResponse[0].record[0].content[0];
					var decodedContent = self.base64decode(base64Data);

					cb(null, decodedContent);
				}
			}
		});
	}


,	base64decode: function base64decode(base64str)
	{
		return new Buffer(base64str, 'base64');
	}
};

module.exports = FileCabinet;