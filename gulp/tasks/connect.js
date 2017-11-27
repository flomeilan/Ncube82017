var gulp = require('gulp')
,	nconf = require('nconf')
,	connect = require('gulp-connect')
,	cors = require('cors')
;

// gulp connect implements both http server for static files and livereload in the browser
gulp.task('connect', function() 
{
	var db_config = nconf.get('dbConfig');
	db_config.root = nconf.get('folders:local');
	db_config.middleware = function()
	{
		return [cors()];
	};
	connect.server(db_config);
});

module.exports = {
	reload: function()
	{
		gulp.src(nconf.get('folders:output') + '/**')
			.pipe(connect.reload());
	}
};
