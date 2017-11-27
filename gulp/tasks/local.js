var gulp = require('gulp-help')(require('gulp'), { hideDepsMessage: true, hideEmpty: true })
,	nconf = require('nconf')
;

if(nconf.get('extensionMode'))
{
	gulp.task('extension:local'
	,	'Compiles the code locally -javascript, templates and sass- and watch for changes to work in -local.ssp urls.' +
		'\n\t\t\t\t Updates the manifest automatically before compiling.\n'
	,	['update-validate', 'watch']);
}
else
{
	gulp.task('theme:local'
	,	'Compiles the code locally -templates and sass- and watch for changes to work in the -local.ssp urls.' +
		'\n\t\t\t\t It recognizes overrides made in the Overrides folder.' +
		'\n\t\t\t\t To add new override files execute theme:local again.' + 
		'\n\t\t\t\t Updates the manifest automatically before compiling.\n'
	,	['update-validate', 'watch']);
}
