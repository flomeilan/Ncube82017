// it install watchers registered in watch-manager

// Note: In linux, if NOENT error, please run:
// echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

'use strict';

var gulp = require('gulp')
,	watch_manager = require('../extension-mechanism/watch-manager')
,	nconf = require('nconf');

function getWatchTaskList()
{
	var task_list = ['templates', 'sass', 'assets', 'connect'];

	if (nconf.get('extensionMode'))
	{
		task_list = ['templates', 'sass', 'javascript', 'assets', 'connect'];
	}
	return task_list;
}

gulp.task('watch', getWatchTaskList(), ()=>
{
	watch_manager.getWatch().map((w)=>
	{
		gulp.watch(w.files, w.tasks, 1000);
	});
});
