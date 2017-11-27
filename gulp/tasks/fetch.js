
var gulp = require('gulp-help')(require('gulp'), { hideDepsMessage: true, hideEmpty: true })
,	nconf = require('nconf')
,	validate = require('./validate')
,	fetch_lib = require('../extension-mechanism/fetch/fetch');

nconf.argv(
	{
	    'ask_credentials': {
	      alias: 'to',
	      describe: 'Retrieve credentials (email, role, account, domain and password) and application data again ignoring .nsdeploy file and application downloaded files',
	      demand: false,
	      default: false
	    }

	,	'credentials:vm': {
	      alias: 'vm',
	      describe: 'Virtual Machine',
	      demand: false
	    }

	,	'credentials:molecule': {
	      alias: 'm',
	      describe: 'Molecule',
	      demand: false
	    }

	,	'credentials:nsVersion': {
	      alias: 'nsVersion',
	      describe: 'Version',
	      demand: false
	    }

	,	'credentials:roleId': {
	      alias: 'role',
	      describe: 'Role Id',
	      demand: false
	    }

	,	'credentials:website': {
	      alias: 'website',
	      describe: 'Website',
	      demand: false
	    }

	,	'credentials:applicationId': {
	      alias: 'applicationId',
	      describe: 'Application Id',
	      demand: false
	    }

	,	'credentials:domain': {
	      alias: 'domain',
	      describe: 'Domain name (www.name.com)',
	      demand: false
	    }

	,	'script:web_service': {
			alias: 'web-script',
			describe: 'Reslet Script Id of the Extension Mechanism web service',
			demand: false
		}

	,	'script:file_service': {
			alias: 'file-script',
			describe: 'Reslet Script Id of the Extension Mechanism file service',
			demand: false
    	}

    ,	'deploy:web_service': {
			alias: 'web-deploy',
			describe: 'Reslet Script Deploy of the Extension Mechanism web service',
			demand: false
    	}

    ,	'fetchConfig:extension': {
    		alias: 'fetch'
    	,	describe: 'If you want to start working on an extension you had previously in the file cabinet. Format: '
		,	demand: false
    	}
	}
);

function executeFetch(cb)
{
	fetch_lib.fetch(function(error)
	{
		if(!error)
		{
			validate.validate(cb);
		}
		else
		{
			cb(error);
		}	
	});
}

if(nconf.get('extensionMode'))
{
	gulp.task('extension:fetch'
		, 'Downloads the active theme and active extensions code (optional).'
		, executeFetch
		, {
			options: {
				'fetch': 'Comma separated list of extension names to download. Use "" (double quotes) if the name contain spaces.'
			,	'm <arg>': 'Idem as extension:deploy parameter.'
			,	'to': 'Idem as extension:deploy parameter.\n'
			}
		});
}
else
{
	gulp.task('theme:fetch'
	, 'Downloads active theme and extensions code.'
	, executeFetch
	, {
		options: {
			'm <arg>': 'Idem as theme:deploy parameter'
		,	'to': 'Idem as theme:deploy parameter.\n'
		}
	});
}
