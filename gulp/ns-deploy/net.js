/* jshint node: true */
'use strict';

var request = require('request')
,	through = require('through2')
,	Progress = require('progress')
,	path = require('path')
,	Spinner = require('cli-spinner').Spinner
,	fs = require('fs')
,	url = require('url')
,	args = require('yargs').argv
,	package_manager = require('../package-manager')
,	Uploader = require('ns-uploader')
,	inquirer = require('inquirer')
,	gutil = require('gulp-util');


function getAuthorizationHeader(deploy)
{
	return	'NLAuth nlauth_account=' + deploy.info.account + ', ' +
			'nlauth_email=' + deploy.info.email + ', ' +
			'nlauth_signature=' + deploy.info.password + ', ' +
			'nlauth_role=' + deploy.info.role;
}

var net_module = {

	getConfigurationForDomain: function(deploy, cb)
	{
		var requestUrl = url.format({
			protocol: 'https'
		,	hostname: deploy.info.hostname
		,	pathname: '/app/site/hosting/restlet.nl'
		,	query: {
				script: deploy.info.script
			,	deploy: deploy.info.deploy
			,	t: Date.now()
			,	get: 'domain-configuration'
			,	website: deploy.info.website
			,	domain: deploy.info.domain
			,	folderId: deploy.info.target_folder
			}
		});

		request.get(
			requestUrl
		,	{
				headers: {
					'Content-Type': 'application/json'
				,	'Authorization': getAuthorizationHeader(deploy)
				}
			,	rejectUnauthorized: false
			}
		,	function(err, request, response_body)
			{
				if (err)
				{
					err.message = 'Error in GET ' + requestUrl + ': ' + err.message;
					cb(err);
				}

				else
				{
					try
					{
						var response = JSON.parse(response_body);

						if (response.error)
						{
							if(typeof response.error != "object")
							{
								response.error = JSON.parse(response.error);
							}
							console.log('Error', response.error.code, response.error.message ? response.error.message : response.error.details);
							cb(new Error(response.error.message));
						}
						else
						{
							if(!response.domainUnmanagedFolder)
							{
								deploy.domainUnmanagedFolderConfigDontExists = true; //so then we know we need to save the folder in the config
								inquirer.prompt([
									{
										type: 'input'
									,	name: 'domainUnmanagedFolder'
									,	message: 'Please, give a name to the folder to deploy your files'
									,	default: (deploy.info.domain+'').replace(/\./g, '_')
									,	validate: function(input)
										{
											if((input+'').match(/^[\w\d_]+$/i))
											{
												return true;
											}
											else
											{
												return 'Invalid folder name - can only contain ';
											}
										}
									}
								])
								.then(function(answers)
								{
									deploy.info.domainUnmanagedFolder = answers.domainUnmanagedFolder;
									cb(null, deploy);
								})

								//TODO: save deploy.info.domainUnmanagedFolder in back in config record
							}
							else
							{
								deploy.info.domainUnmanagedFolder = response.domainUnmanagedFolder;
								cb(null, deploy);
							}
						}
					}
					catch (e)
					{
						cb(new Error('Error parsing response:\n' + response_body + ' - ' + JSON.stringify(e) + ' - ' + e.stack));
					}
				}
			}
		);
	}


,	writeConfig: function(deploy, cb)
	{
		if (!deploy.domainUnmanagedFolderConfigDontExists)
		{
			cb(null, deploy);
		}
		else
		{
			var requestUrl = url.format({
			protocol: 'https'
		,	hostname: deploy.info.hostname
		,	pathname: '/app/site/hosting/restlet.nl'
		,	query: {
				script: deploy.info.script
			,	deploy: deploy.info.deploy
			,	t: Date.now()
			}
		});

		request.put(
			requestUrl
		,	{
				headers: {
					'Content-Type': 'application/json'
				,	'Authorization': getAuthorizationHeader(deploy)
				}
			,	rejectUnauthorized: false
			,	body: JSON.stringify({
					saveConfiguration: true
				,	unmanagedResourcesFolderName: deploy.info.domainUnmanagedFolder
				,	website: deploy.info.website
				,	domain: deploy.info.domain
				,	folderId: deploy.info.target_folder
				})
			}
		,	function(err, request, response_body)
			{
				if (err)
				{
					err.message = 'Error in GET ' + requestUrl + ': ' + err.message;
					cb(err);
				}
				else
				{
					try
					{
						var response = JSON.parse(response_body) || {};

						if (response.error)
						{
							console.log('Error', response.error.code, response.error.message);
							cb(new Error(response.error.message));
						}
						else
						{
							cb(null, deploy);
						}
					}
					catch (e)
					{
						var errorMsg = 'Error parsing response:\n' + response_body + ' - ' + JSON.stringify(e) + ' - ' + e.stack;
						cb(new Error(errorMsg));
					}
				}
			}
		);
		}
	}

,	getWebsitesAndDomains: function (deploy, cb)
	{
		var requestUrl = url.format({
			protocol: 'https'
		,	hostname: deploy.info.hostname
		,	pathname: '/app/site/hosting/restlet.nl'
		,	query: {
				script: deploy.info.script
			,	deploy: deploy.info.deploy
			,	t: Date.now()
			,	get: 'list-websites'
			}
		});

		request.get(
			requestUrl
		,	{
				headers: {
					'Content-Type': 'application/json'
				,	'Authorization': getAuthorizationHeader(deploy)
				}
			,	rejectUnauthorized: false
			}
		,	function(err, request, response_body)
			{
				if (err)
				{
					err.message = 'Error in GET ' + requestUrl + ': ' + err.message;
					cb(err);
				}

				else
				{
					try
					{
						var response = JSON.parse(response_body);

						if (response.error)
						{
							console.log('Error', response.error.code, response.error.message);
							cb(new Error(response.error.message));
						}
						else
						{
							deploy.websitesAndDomains = response;
							cb(null, deploy);
						}
					}
					catch (e)
					{
						cb(new Error('Error parsing response:\n' + response_body));
					}
				}
			}
		);
	}

,	rollback: function(deploy, cb)
	{
		if (!deploy.rollback_revision)
		{
			cb(new Error('No backup selected'));
		}
		else
		{
			request.put(
				url.format({
					protocol: 'https'
				,	hostname: deploy.info.hostname
				,	pathname: '/app/site/hosting/restlet.nl'
				,	query: {
						script: deploy.info.script
					,	deploy: deploy.info.deploy
					,	t: Date.now()
					}
				})
			,	{
					headers: {
						'Content-Type': 'application/json'
					,	'Authorization': getAuthorizationHeader(deploy)
					}
				,	rejectUnauthorized: false
				,	body: JSON.stringify({ rollback_to: deploy.rollback_revision.file_id })
				}
			,	function()
				{
					cb(null, deploy);
				}
			);
		}
	}

,	getVersions: function (deploy, cb)
	{
		if (deploy.revisions)
		{
			cb(null, deploy);
		}
		else
		{
			var requestUrl = url.format({
					protocol: 'https'
				,	hostname: deploy.info.hostname
				,	pathname: '/app/site/hosting/restlet.nl'
				,	query: {
						script: deploy.info.script
					,	deploy: deploy.info.deploy
					,	t: Date.now()
					,	get: 'revisions'
					,	target_folder: deploy.info.target_folder
					}
				});

			request.get(
				requestUrl
			,	{
					headers: {
						'Content-Type': 'application/json'
					,	'Authorization': getAuthorizationHeader(deploy)
					}
				,	rejectUnauthorized: false
				}
			,	function(err, request, response_body)
				{
					if (err)
					{
						err.message = 'Error in GET ' + requestUrl + ': ' + err.message;
						cb(err);
					}
					else
					{
						var response = JSON.parse(response_body);
						if (response.error)
						{
							cb(new Error(response.error.message));
						}
						else
						{
							deploy.revisions = response;
							cb(null, deploy);
						}
					}
				}
			);
		}
	}

,	roles: function (deploy, cb)
	{
		if (deploy.info.email && deploy.info.password)
		{
			var requestUrl = deploy.options.molecule ?
							'https://rest.'+ deploy.options.molecule + '.netsuite.com/rest/roles' :
							'https://rest.netsuite.com/rest/roles';

			request.get(
				requestUrl
			,	{
					headers: {
						'Accept': '*/*'
					,	'Accept-Language': 'en-us'
					,	'Authorization': 'NLAuth nlauth_email=' + deploy.info.email + ', nlauth_signature=' + deploy.info.password
					}
				,	rejectUnauthorized: false
				}
			,	function(err, request, response_body)
				{
					if (err)
					{
						err.message = 'Error in GET ' + requestUrl + ': ' + err.message;
						return cb(err);
					}
					else
					{
						var response = JSON.parse(response_body);

						if (response.error)
						{
							var error = new Error(response.error.message);
							error.type = 'NETWORK_ROLES_ERROR';
							cb(error);
						}
						else
						{
							deploy.roles = response;
							cb(null, deploy);
						}
					}
				}
			);
		}
		else
		{
			var error = new Error('Missing email and password');
			error.type = 'MISSING_EMAIL_OR_PASSWORD';
			cb(error);
		}
	}

,	targetFolder: function (deploy, cb)
	{
		if (deploy.target_folders)
		{
			cb(null, deploy);
		}
		else
		{
			var requestUrl = url.format({
					protocol: 'https'
				,	hostname: deploy.info.hostname
				,	pathname: '/app/site/hosting/restlet.nl'
				,	query: {
						script: deploy.info.script
					,	deploy: deploy.info.deploy
					,	t: Date.now()
					,	get: 'target-folders'
					}
				});

			request.get(
				requestUrl
			,	{
					headers: {
						'Content-Type': 'application/json'
					,	'Authorization': getAuthorizationHeader(deploy)
					}
				,	rejectUnauthorized: false
				}
			,	function(err, request, response_body)
				{
					if (err)
					{
						err.message = 'Error in GET ' + requestUrl + ': ' + err.message;
						cb(err);
					}

					else
					{
						var invalid_scriptlet_id_msg = 'Please make sure the selected account/molecule have the "' + deploy.options.distroName + '" bundle installed.';
						try
						{
							var response = JSON.parse(response_body);

							if (response.error)
							{
								if (response.error.code === 'SSS_INVALID_SCRIPTLET_ID')
								{
									console.log('Error: Deployment scriptlet not found, aborting. \n' +
										invalid_scriptlet_id_msg);
									process.exit(1);
								}
								else
								{
									console.log('Error', response.error.code, response.error.message);
									if(response.error.code==='USER_ERROR')
									{
										console.log('Please check you are pointing to the right molecule/datacenter using the -m argument.');
									}
									cb(new Error(response.error.message));
								}
							}
							else
							{
								deploy.target_folders = response;
								cb(null, deploy);
							}
						}
						catch (e)
						{
							cb(new Error('Error parsing response:\n' +
								response_body + '\n\n' + invalid_scriptlet_id_msg ));
						}
					}
				}
			);
		}
	}

,	postFiles: function(deploy, cb)
	{
		net_module.ensureTargetFolder(deploy, function(error)
		{
			if(error)
			{
				cb(error);
			}
			if (args.useOldDeploy)
			{
				net_module._postFilesOld(deploy, function(){cb(null, deploy); /*cb.apply(null, arguments);*/});
			}
			else
			{
				net_module._postFilesNew(deploy, function(){cb(null, deploy); /* cb.apply(null, arguments);*/});
			}
		});
	}

	// @method ensureTargetFolder for sclite we only upload the contents of the /tmp folder into the target site folder (info.target_folder). we need to:
	// 1) see if it exists 2) if not, create it. 3) assign info.target_folder to the target folder id.
,	ensureTargetFolder: function(deploy, cb)
	{
		if(!package_manager.distro.isSCLite)
		{
			cb(null, deploy);
			return;
		}
		var Q = require('q');
		var uploader = net_module.getUploader(deploy);
		var siteFolderInternalId;

		// we get or create the 'site' folder
		uploader.getFolderNamed(deploy.info.target_folder, 'site')
		.then(function(siteFolder)
		{
			var deferred = Q.defer();
			if(!siteFolder)
			{
				deferred.resolve(uploader.mkdir(deploy.info.target_folder, 'site'));
			}
			else
			{
				deferred.resolve(siteFolder.$);
			}
			return deferred.promise;
		})
		//we get or create the site/something folder
		.then(function(siteFolderRef)
		{
			siteFolderInternalId = siteFolderRef.internalId;
			return uploader.getFolderNamed(siteFolderInternalId, deploy.info.domainUnmanagedFolder, false);
		})
		.then(function(folder)
		{
			if(!folder)
			{
				uploader.mkdir(siteFolderInternalId, deploy.info.domainUnmanagedFolder)
				.then(function(folderRef)
				{
					deploy.info.target_folder = folderRef.internalId;
					cb(null, deploy);
				})
				.catch(function(ex)
				{
					cb(ex);
				});
			}
			else
			{
				deploy.info.target_folder = folder.$.internalId;
				cb(null, deploy);
			}
		})
		.then(function()
		{

		})
		.catch(function(ex)
		{
			cb(ex);
		});
	}

,	uploadBackup: function(deploy, cb)
	{
		var spinner = new Spinner('Uploading backup');
		spinner.start();
		net_module.uploader.mkdir(deploy.info.target_folder, 'backup')
		.then(function (recordRef)
		{
			net_module.uploader.main({
				targetFolderId: recordRef.internalId
			,	sourceFolderPath: path.join(package_manager.distro.folders.deploy, '_Sources')
			})
			.then(function ()
			{
				spinner.stop();
				cb(null, deploy);
			})
			.catch(function (err)
			{
				console.log(err, err.stack);
				cb(err);
			});
		})
		.catch(function (err)
		{
			console.log(err, err.stack);
			cb(err);
		});
	}

,	getUploader: function(deploy)
	{
		if(!net_module.uploader)
		{
			var credentials = {
				email: deploy.info.email
			,	password: deploy.info.password
			,	roleId: deploy.info.role
			,	account: deploy.info.account
			,	molecule: args.m || undefined
			,	nsVersion: args.nsVersion || undefined
			,	applicationId: args.applicationId || undefined
			};
			var uploader = new Uploader(credentials);
			net_module.uploader = uploader;
		}
		return net_module.uploader;
	}

,	_postFilesNew: function (deploy, cb)
	{
		var uploader = net_module.getUploader(deploy);

		var sourceFolderPath = package_manager.distro.isSCLite ? path.join(package_manager.distro.folders.deploy, 'tmp') : package_manager.distro.folders.deploy;

		var config = {
			targetFolderId: deploy.info.target_folder
		,	sourceFolderPath: sourceFolderPath
		,	cleanManifest: args.cleanManifest
		};

		// progress bar and listener
		var bar;
		uploader.addProgressListener(function(actual, total)
		{
			if(!bar)
			{
				bar = new Progress('Uploading [:bar] :percent', {
					complete: '='
				,	incomplete: ' '
				,	width: 50
				,	total: total
				});
			}
			bar.tick(1);
		});

		var t0 = new Date().getTime();
		uploader
			.main(config)
			.then(function (manifest)
			{
				var took = ((new Date().getTime() - t0)/1000/60) + '';
				took = took.substring(0, Math.min(4, took.length)) + ' minutes';
				gutil.log('Finished', gutil.colors.cyan('Deploy website' + (took ? ', took ' + took : '') ) );

				uploader.progressListeners = [];
				cb(null, deploy);
			})
			.catch(function(err)
			{
				console.log('ERROR in deploy', err, err.stack);
				cb(err);
			});
	}

,	_postFilesOld: function (deploy, cb)
	{
		var t0 = new Date().getTime();
		var payload_path = path.join(process.gulp_init_cwd, 'payload.json');
		fs.stat(payload_path, function(err, stat)
		{
			if (err)
			{
				return cb(err);
			}

			var spinner = new Spinner('Processing');
			var bar = new Progress('Uploading [:bar] :percent', {
				complete: '='
			,	incomplete: ' '
			,	width: 50
			,	total: stat.size
			,	callback: function()
				{
					spinner.start();
				}
			});

			fs.createReadStream(payload_path)
				.pipe(through(
					function(buff, type, cb2)
					{
						bar.tick(buff.length);
						this.push(buff);
						return cb2();
					}
				))
				.pipe(request.post(
					url.format({
						protocol: 'https'
					,	hostname: deploy.info.hostname
					,	pathname: '/app/site/hosting/restlet.nl'
					,	query: {
							script: deploy.info.script
						,	deploy: deploy.info.deploy
						}
					})
				,	{
						headers: {
							'Content-Type': 'application/json'
						,	'Authorization': getAuthorizationHeader(deploy)
						}
						,	rejectUnauthorized: false
					}
				,	function(err, request, response_body)
					{
						spinner.stop();
						process.stdout.clearLine();
						process.stdout.cursorTo(0);

						try{
							var result = JSON.parse(response_body);
							var took = ((new Date().getTime() - t0)/1000/60) + '';
							took = took.substring(0, Math.min(4, took.length)) + ' minutes';
							cb(null, deploy);
						}
						catch(e){
							cb(new Error('Error parsing response:\n'+
							response_body+'\n\n'+
							'Please make sure that:\n'+
							'- You uploaded all files in RestLet folder to a location in your account.\n'+
							'- You have a restlet script pointing to sca_deployer.js with id customscript_sca_deployer and deployment with id customdeploy_sca_deployer\n'+
							'- You have set the get, post, put, delete methods to _get, _post, _put, _delete respectively in the script.\n'+
							'- You have added the Deployment.js and FileCabinet.js scripts to the script libraries.'));
						}
					}
				)
			);
		});
	}
};


module.exports = net_module;