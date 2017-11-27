'use strict';

var fs = require('fs')
,	nconf = require('nconf')
,	path = require('path')
,	gulp = require('gulp');

process.gulp_init_cwd = process.env.INIT_CWD || process.cwd();

//
// Setup nconf to use (in-order):
//   1. Command-line arguments
//   2. Environment variables
//   3. A file located at 'path/to/config.json'
//
nconf.argv()
	.env()
	.file('config', 'gulp/config/config.json');

nconf.set('config_path', 'gulp/config/config.json');

if (!nconf.get('to'))
{
	nconf.file('credentials', '.nsdeploy');
}

if(nconf.get('extensionMode'))
{
	if (['update-manifest', 'extension:update-manifest', 'extension:local', 'extension:deploy'].indexOf(process.argv[2]) !== -1)
	{
		require('./gulp/extension-mechanism/init')();
	}
}
else
{
	if (['update-manifest', 'theme:update-manifest', 'theme:local', 'theme:deploy'].indexOf(process.argv[2]) !== -1)
	{
		require('./gulp/extension-mechanism/init')();
	}
}

// evaluate all gulp tasks files
var baseTaskDir = path.resolve(__dirname, './gulp/tasks');
fs.readdirSync(baseTaskDir).forEach(function(task_name)
{
	if (/\.js/.test(task_name))
	{
		require(path.join(baseTaskDir, task_name.replace('.js', '')));
	}
});

gulp.task('default', ['help']);
