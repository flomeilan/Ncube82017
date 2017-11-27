/* jshint node: true */
/*
	@module ext-mechanism-inquirer

	Deals with all the details of getting the suitetalk credentials from the user
	and also websites that support extension mechanism along with its domains and application manifest.
*/

var async = require('async')
,	fs = require('fs')
,	gutil = require('gulp-util')
,	inquirer = require('inquirer')
,	path = require('path')
,	_ = require('underscore')
,	shell = require('shelljs')
;

var deploy_task = require('../ns-deploy/index')
,	ui = require('../ns-deploy/ui')
,	net = require('../ns-deploy/net')
,	WebsiteService = require('./website-service')
;

var nconf = require('nconf');

var application_manifest_path = path.join(nconf.get('folders:application_manifest'), 'application_manifest.json')
, 	nsdeploy_path = path.join('gulp', 'config', '.nsdeploy')
;

function alphabeticSort(a, b)
{
	return a.name.localeCompare(b.name);
}

var extension_mechanism_inquirer = {

	nsdeploy_path: nsdeploy_path

	/*
		@method writeCredentials writes the usual deploy credentials in the file .nsdeploy
		and the application manifest and other configuration data relevant to the extension mechanism
		inside the extension_mechanism folder.
	*/
,	writeCredentials: function writeCredentials(fetch_data, cb)
	{
		fetch_data.credentials.roleId = fetch_data.credentials.role;

		var credentials_to_save = _.extend({}, fetch_data.credentials);

		if(shell.test('-f', nsdeploy_path) && shell.cat(nsdeploy_path).toString().trim() !== '{}')
		{
			var saved_credentials = JSON.parse(shell.cat(nsdeploy_path).toString());
			if(!saved_credentials.credentials.password)
			{
				delete credentials_to_save.password;
			}
		}
		else
		{
			delete credentials_to_save.password;
		}

		if(credentials_to_save.email_default)
		{
			delete credentials_to_save.email_default;
		}


		fs.writeFileSync(nsdeploy_path, JSON.stringify({credentials: credentials_to_save }, null, 4));

		nconf.set('credentials', fetch_data.credentials);

		if(fetch_data.application_manifest)
		{
			nconf.set('application:application_manifest', fetch_data.application_manifest);
		}

		cb(null, fetch_data);
	}

,	writeApplicationManifest: function writeApplicationManifest()
	{
		fs.writeFileSync(application_manifest_path, JSON.stringify(nconf.get('application:application_manifest'), null, 4));
	}
	/*
		@method getCredentials gets all the credentials of the account, password, ssp application folder
		website, and domain and also the application manifest
	*/

,	getCredentials: function getCredentials(fetch_data, done)
	{
		if(fs.existsSync(application_manifest_path))
		{
			try
			{
				nconf.set('application:application_manifest', JSON.parse(fs.readFileSync(application_manifest_path).toString()));
			}
			catch(error)
			{
				nconf.set('application:application_manifest', null);
			}
		}

		var credentials = nconf.get('credentials')
		,	application_manifest = nconf.get('application').application_manifest
		;

		function handleResult(err, result)
		{
			if (err)
			{
				var error = (err.error && err.error.message) || err;

				if(error === 'ETIMEDOUT')
				{
					error = 'Network Error. Please check your Internet Connection.';
				}

				var task_name = nconf.get('extensionMode') ? 'extension:fetch' : 'theme:fetch';
				done(new gutil.PluginError('gulp ' + task_name + ' getCredentials', error));
				return;
			}

			done(null, result);
		}

		if (!nconf.get('ask_credentials') &&
			credentials && credentials.email && credentials.domain &&
			application_manifest)
		{
			if(!credentials.password)
	        {
	        	async.waterfall([
	        			function passInitialData(first_cb)
						{
							var initial_data = { options: { molecule: credentials.molecule}, info: { email: credentials.email }, credentials: credentials };
							if(fetch_data)
							{
								initial_data = _.extend(initial_data, fetch_data);
							}

							first_cb(null, initial_data);
						}
					,	extension_mechanism_inquirer.askPassword
					,	extension_mechanism_inquirer.validateCredentials
					,	extension_mechanism_inquirer.transformCredentials
					,	extension_mechanism_inquirer.writeCredentials
	        		]

	        	,	handleResult
				);
	        }
	        else
	        {
	        	async.waterfall([
						function passInitialData(first_cb)
						{
							var initial_data = { options: { molecule: credentials.molecule }, info: { email: credentials.email, password: credentials.password }, credentials: credentials };
							if(fetch_data)
							{
								initial_data = _.extend(initial_data, fetch_data);
							}

							first_cb(null, initial_data);
						}
					,	extension_mechanism_inquirer.validateCredentials
					,	extension_mechanism_inquirer.transformCredentials
					,	extension_mechanism_inquirer.writeCredentials
					]

	        	,	handleResult
				);
	        }
		}
		else
		{
			var waterfall = [
				function passInitialData(first_cb)
				{
					var initial_data =  {
						credentials: credentials || {}
					,	application_manifest: application_manifest || {}
					,	info: {}
					,	options: {}
					};

					if(fetch_data)
					{
						initial_data = _.extend(initial_data, fetch_data);
					}

					first_cb(null, initial_data);
				}
			,	deploy_task.doUntilGetRoles
			,	extension_mechanism_inquirer.doUntilGetWebsiteAndDomain
			,	extension_mechanism_inquirer.writeCredentials
			];

			//result contains the credentials and application_manifest
			async.waterfall(
				waterfall
			,	handleResult
			);
		}
	}

,	askPassword: function askPassword(fetch_data, cb)
	{
		inquirer.prompt([{
			type: 'password'
		,   name: 'password'
		,   message: 'Password'
		,   validate: (input) =>
			{
				return input.length > 0 || 'Please enter a password';
			}
		}])
		.then((answers) =>
		{
			fetch_data.info.password = answers.password;
			cb(null, fetch_data);
		});
	}

,	validateCredentials: function validateCredentials(fetch_data, cb)
	{
		net.roles(fetch_data, (err) =>
		{
			if(err)
			{
				cb(err);
			}
			else
			{
				nconf.set('credentials:password', fetch_data.info.password);
				cb(null, fetch_data);
			}
		});
	}

,	transformCredentials: function transformCredentials(fetch_data, cb)
	{
		if(fetch_data.credentials)
		{
			_.extend(fetch_data.credentials, fetch_data.info);
		}

		if(fetch_data.roles)
		{
			delete fetch_data.roles;
		}

		delete fetch_data.info;
		delete fetch_data.options;

		cb(null, fetch_data);
	}

,	doUntilGetWebsiteAndDomain: function doUntilGetWebsiteAndDomain(fetch_data, cb)
	{
		async.waterfall(
			[
				async.apply(ui.roles, fetch_data)
			,	extension_mechanism_inquirer.transformCredentials
			,	WebsiteService.getWebsites
			,	WebsiteService.getWebsiteDomains
			,	extension_mechanism_inquirer.selectWebsitesAndDomains
			]

		,	function(err)
			{
				if (err)
				{
					cb(err);
					return;
				}

				cb(null, fetch_data);
			}
		);

	}

,	selectWebsitesAndDomains: function selectWebsitesAndDomains(fetch_data, cb)
	{
		if(!fetch_data.websites)
		{
			cb(new Error('You must have installed in your account the Extension Mechanism Bundle.\nError trying to request available websites and domains.'));
		}
		else
		{
			inquirer.prompt([{
				type: 'list'
			,	name: 'website'
			,	message: 'Choose your website'
			,	choices: _.map(fetch_data.websites, (ws) =>
				{
					return {
						name: ws.name
					,	value: ws.website_id
					};

				}).sort(alphabeticSort)
			}])
			.then((answers) =>
			{
				fetch_data.credentials.website = answers.website;
				var domains = fetch_data.websites[fetch_data.credentials.website].domains;

				inquirer.prompt([{
					type: 'list'
				,	name: 'domain'
				,	message: 'Choose your domain'
				,	choices: domains.map(function(domain)
					{
						return {
							name: domain.domain
						,	value: domain.domain
						};
					}).sort(alphabeticSort)
				}])
				.then((answers) =>
				{
					fetch_data.credentials.domain = answers.domain;
					var domain_data = _.find(domains, function(data)
						{
							return data.domain === fetch_data.credentials.domain;
						});

					fetch_data.credentials.webapp_id = domain_data.app_id;
					fetch_data.credentials.target_folder = domain_data.folder_id;
					fetch_data.application_manifest = domain_data.manifest;
					cb(null, fetch_data);
				});
			});
		}
	}
};

module.exports  = extension_mechanism_inquirer;
