var nconf = require('nconf')
,	request = require('request')
,	url = require('url')
,	_ = require('underscore')
;

'use strict';


var getAuthorizationHeader = function getAuthorizationHeader(credentials)
{
	return 'NLAuth nlauth_account=' + credentials.account + ', ' +
			'nlauth_email=' + credentials.email + ', ' +
			'nlauth_signature=' + credentials.password + ', ' +
			'nlauth_role=' + credentials.role;
};

var website_service = {

	formatUrl: function formatUrl(credentials, query, suitelet)
	{
		var molecule_rest_hostname;

		if(credentials.molecule && credentials.hostname)
		{
			molecule_rest_hostname = credentials.hostname.replace('netsuite.com', credentials.molecule + '.netsuite.com');
		}

		var options = {
			protocol: 'https'
		,	hostname: (credentials.molecule && molecule_rest_hostname ? molecule_rest_hostname : credentials.hostname ) || 'rest.netsuite.com'
		,	pathname: '/app/site/hosting/restlet.nl'
		,	query: {
				deploy: '1'
			,	t: Date.now()
			}
		};

		if(suitelet)
		{
			options.hostname = options.hostname.replace('rest', 'system');
			options.pathname = '/app/site/hosting/scriptlet.nl';
		}

		_.each(query || [], function(value, key)
		{
			options.query[key] = value;
		});

		return url.format(options);
	}

,	getWebsites: function getWebsites(fetch_data, cb)
	{
		var request_url = website_service.formatUrl(fetch_data.credentials, {script: nconf.get('script:web_service'), method: 'GET'});

		request.get( 
				request_url
			,	{
					headers: {
						'Content-Type': 'application/json'
					,	'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
					,	'Access-Control-Allow-Headers': 'Authorization'
					,	'Access-Control-Allow-Origin': 'rest.netsuite.com'
					,	'Authorization': getAuthorizationHeader(fetch_data.credentials)
					}
				,	rejectUnauthorized: false
				,	gzip: false
			  	,	encoding: null
				}
			,	function(err, response, body) 
				{
					if (err) 
					{ 
						cb(new Error(err));
						return;  
					}
					try
					{
						if(body instanceof Buffer)
						{
							body = body.toString();
						}
						
						var resultBody = JSON.parse(body)
						,	websites = resultBody.result;

						if(resultBody.error)
						{
							cb(resultBody.error);
							return;
						}
						else
						{
							fetch_data.websites = websites;
							cb(null, fetch_data);
							return;
						}
					}
					catch(e)
					{
						var body_match = body.match(/<body[^>]*>([\w|\W]*)<\/body>/im);
						
						if(body_match && body_match.length)
						{
							var body_tag = body_match[1]
							,	clean_error = body_match.length && body_tag.replace(/<[^>]+>/gi, '').trim()
							;

							clean_error = clean_error.replace(/&nbsp;/g, '').replace(/function page_init\(\)([\w|\W]*)/igm, '');
							cb(new Error(clean_error));
						}
						else
						{
							var error = 'FATAL ERROR. Cannot parse the response body. Check the ssp application logs.\n\n' + body;
							cb(new Error(error));
						}
					}
				}
			);
	}

,	getWebsiteDomains: function getWebsiteDomains(fetch_data, cb)
	{
		var promises = _.map(fetch_data.websites || [], function(website)
		{
			var url = website_service.formatUrl(fetch_data.credentials, { script: nconf.get('script:web_service'), website_id: website.website_id, method: 'GET' });
			var promise = new Promise((resolve, reject) => {
				
				request.get(
					url
				,	{
						headers: {
							'Content-Type': 'application/json'
						,	'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
						,	'Access-Control-Allow-Headers': 'Authorization'
						,	'Access-Control-Allow-Origin': 'rest.netsuite.com'
						,	'Authorization': getAuthorizationHeader(fetch_data.credentials)
						}
					,	rejectUnauthorized: false
					}
				,	function(err, response, body) 
					{
						if (err) 
						{ 
							reject(new Error(err));
							return; 
						}
						try
						{
							if(body instanceof Buffer)
							{
								body = body.toString();
							}
							
							var resultBody = JSON.parse(body)
							,	website = resultBody.result;

							if(resultBody.error)
							{
								reject(resultBody.error);
								return;
							}
							else
							{
								fetch_data.websites[website.website_id] = website;
								resolve(fetch_data);
							}
						}
						catch(e)
						{
							var body_match = body.match(/<body[^>]*>([\w|\W]*)<\/body>/im);
							
							if(body_match && body_match.length)
							{
								var body_tag = body_match[1]
								,	clean_error = body_match.length && body_tag.replace(/<[^>]+>/gi, '').trim()
								;

								clean_error = clean_error.replace(/&nbsp;/g, '').replace(/function page_init\(\)([\w|\W]*)/igm, '');
								reject(new Error(clean_error));
							}
							else
							{
								var error = 'FATAL ERROR. Cannot parse the response body. Check the ssp application logs.\n\n' + body;
								reject(new Error(error));
							}
						}
					}
				);
			});

			return promise;
		});

		Promise.all(promises)
		.then(function()
		{
			cb(null, fetch_data);
		})
		.catch(function (error) {
			cb(error);
		});
	}
};

module.exports = website_service;