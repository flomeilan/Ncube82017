var gulp = require('gulp-help')(require('gulp'), { hideDepsMessage: true, hideEmpty: true })
,	nconf = require('nconf')
,	shell = require('shelljs');

gulp.task(
	'clean'
,	'Removes temporary files and folders.\n'
,	[]
,	() => shell.rm('-rf', '.nsdeploy tmp ' + nconf.get('folders:local') + ' ' + nconf.get('folders:deploy') + ' ' + require('../extension-mechanism/credentials-inquirer').nsdeploy_path)
);
