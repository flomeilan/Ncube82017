/* jshint node: true */
'use strict';

var inquirer = require('inquirer')
,	_ = require('underscore')
,	package_manager = require('../package-manager');


function alphabeticSort(a, b)
{
	return a.name.localeCompare(b.name);
}

function folderInquirer(options)
{

	return function(deploy, cb)
	{
		//skip inquire if already got the information
		deploy.folder_inquirer = deploy.folder_inquirer || {};
		if (deploy.info.target_folder || deploy.folder_inquirer[options.targetName])
		{
			cb(null, deploy);
			return;
		}

		//build the goback options
		var go_back = [
			new inquirer.Separator(),
			{ name: 'Go back', value: 'go_back'},
			new inquirer.Separator()
		];

		//prompt
		inquirer.prompt([{
			type: 'list'
		,	name: options.name
		,	message: options.message
		,	choices: go_back.concat(options.choices(deploy))
		}])
		.then(function(answer)
		{
			//undo previous selection and apply error
			if(answer[options.name] === 'go_back')
			{
				options.goBackFx(deploy);
				cb(true, deploy);
			}
			//set current selection and go
			else
			{
				deploy.folder_inquirer[options.targetName] = answer;
				cb(null, deploy);
			}
		});
	};
}

module.exports = {

	getWebsitesAndDomains: function(deploy, cb)
	{
		if (deploy.info.website && deploy.info.domain)
		{
			cb(null, deploy);
		}
		else if(!deploy.websitesAndDomains.websites)
		{
			cb(new Error('Wrong response. Are you sure the selected account has SuiteCommerce Lite bundle installed ?'));
		}
		else
		{
			inquirer.prompt([{
				type: 'list'
			,	name: 'website'
			,	message: 'Choose your website'
			,	choices: deploy.websitesAndDomains.websites.map(function(ws){return {name: ws.displayname, value: ws.id}; }).sort(alphabeticSort)
			}])
			.then(function(answers)
			{
				deploy.info.website = answers.website;

				var domains = _.filter(deploy.websitesAndDomains.websiteDomainData, function(data){return data.ws===deploy.info.website})

				inquirer.prompt([{
					type: 'list'
				,	name: 'domain'
				,	message: 'Choose your domain'
				,	choices: domains.map(function(domain){return {name: domain.domain, value: domain.domain}; }).sort(alphabeticSort)
				}])
				.then(function(answers)
				{
					deploy.info.domain = answers.domain;
					var domainInfo = _.find(deploy.websitesAndDomains.websiteDomainData, function(data){return data.domain===deploy.info.domain && data.ws===deploy.info.website});
					deploy.info.webapp = domainInfo.webapp;
					deploy.info.target_folder = domainInfo.webappFolderId;
					cb(null, deploy);
				});
			});
		}
	}

,	rollback: function(deploy, cb)
	{
		if (deploy.rollback_revision)
		{
			cb(null, deploy);
		}
		else
		{
			var longest = 0;
			var choices = deploy.revisions
				.sort(function(a, b)
				{
					return b.deployment_time - a.deployment_time;
				})
				.map(function(revision)
				{
					var name = '' + new Date(revision.deployment_time).toISOString().slice(0, 19).replace('T', ' ');
					if (revision.backup_info && revision.backup_info.tag)
					{
						name += ' - ' + revision.backup_info.tag;
					}

					longest = (longest < name.length) ? name.length : longest;
					return {
						name: name
					,	value: revision
					};
				});

			choices.push(new inquirer.Separator(new Array( longest + 1 ).join('-')));

			inquirer.prompt([{
				type: 'list'
			,	name: 'revision'
			,	message: 'Choose the backup you want to rollback to'
			,	choices: choices
			}])
			.then(function(answers)
			{
				deploy.rollback_revision = answers.revision;
				cb(null, deploy);
			});
		}

	}

,	email: function(deploy, cb)
	{
		if (deploy.info.email)
		{
			cb(null, deploy);
		}
		else
		{
			var promp_config = {
				type: 'input'
			,	name: 'email'
			,	message: 'Netsuite\'s email'
			,	validate: function(input)
				{
					var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
					return re.test(input) || 'Please enter a valid email address';
				}
			};

			if (deploy.info.email_default)
			{
				promp_config['default'] = deploy.info.email_default;
			}

			inquirer.prompt([promp_config])
			.then(function(answers)
			{
				deploy.info.email = answers.email;
				cb(null, deploy);
			});
		}
	}

,	password: function(deploy, cb)
	{
		if(deploy.options.password)
		{
			deploy.info.password = deploy.options.password;
		}

		if (deploy.info.password)
		{
			cb(null, deploy);
		}
		else
		{
			inquirer.prompt([{
				type: 'password'
			,	name: 'password'
			,	message: 'Netsuite\'s password'
			,	validate: function(input)
				{
					return input.length > 0 || 'Please enter a password';
				}
			}])
			.then(function(answers)
			{
				deploy.info.password = answers.password;
				cb(null, deploy);
			});
		}
	}

,	roles: function(deploy, cb)
	{
		function setRole(role)
		{
			deploy.info.account = role.account.internalId;
			deploy.info.role = role.role.internalId;
			deploy.info.hostname = role.dataCenterURLs.restDomain.split('://')[1];

			cb(null, deploy);
		}

		if (deploy.info.role && deploy.info.account)
		{
			cb(null, deploy);
		}
		else if (deploy.roles.length === 1)
		{
			setRole(deploy.roles[0]);
		}
		else
		{
			inquirer.prompt([{
				type: 'list'
			,	name: 'role'
			,	message: 'Choose your target account and role'
			,	choices: deploy.roles.map(function(role) { return {name: role.account.name + ' - ' + role.role.name, value: role }; }).sort(alphabeticSort)
			}])
			.then(function(answers)
			{
				setRole(answers.role);
			});
		}

	}


,	targetHostingFolder: folderInquirer({
			name: 'hosting'
		,	message: 'Choose your Hosting Files folder'
		,	targetName: 'target_hosting_folder'
		,	goBackFx: function(deploy)
			{
				deploy.info.role = undefined;
				deploy.info.account = undefined;
				deploy.target_folders = undefined;
			}
		,	choices: function(deploy)
			{
				return deploy.target_folders.map(function(hosting) { return {name: hosting.name, value: hosting }; }).sort(alphabeticSort);
			}
	})

,	targetPublisherFolder: folderInquirer({
			name: 'publisher'
		,	message: 'Choose your Application Publisher'
		,	targetName: 'target_publisher_folder'
		,	goBackFx: function(deploy)
			{
				deploy.folder_inquirer.target_hosting_folder = undefined;
			}
		,	choices: function(deploy)
			{
				return deploy.folder_inquirer.target_hosting_folder.hosting.publishers.map(function(publisher) {
					return {name: publisher.name, value: publisher };
				}).sort(alphabeticSort);
			}
	})

,	targetSSPFolder: folderInquirer({
			name: 'application'
		,	message: 'Choose your SSP Application'
		,	targetName: 'target_folder'
		,	goBackFx: function(deploy)
			{
				deploy.folder_inquirer.target_publisher_folder = undefined;
			}
		,	choices: function(deploy)
			{
				return deploy.folder_inquirer.target_publisher_folder.publisher.application.map(function(application) {
					return {name: application.name, value: application.id };
				}).sort(alphabeticSort);
			}
	})

,	backup: function(deploy, cb)
	{
		if (deploy.options.interactive)
		{
			inquirer.prompt([
				{
					type: 'input'
				,	name: 'tag'
				,	message: 'Please, name this change'
				,	validate: function(input)
					{
						return !!input;
					}
				}
			,	{
					type: 'input'
				,	name: 'description'
				,	message: 'Please enter a description for this change'
				,	validate: function(input)
					{
						return !!input;
					}
				}
			])
			.then(function(answers)
			{
				deploy.backup_info = answers;
				cb(null, deploy);
			});
		}
		else if (deploy.options && deploy.options.tag)
		{
			deploy.backup_info = {
				tag: deploy.options.tag
			,	description: deploy.options.description
			};
			cb(null, deploy);
		}
		else
		{
			cb(null, deploy);
		}
	}

};

