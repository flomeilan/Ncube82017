var gulp = require('gulp')
,	nconf = require('nconf')
,	path = require('path')
,	map = require('map-stream')
,	manifest_manager = require('../extension-mechanism/manifest-manager')
,	_ = require('underscore');

gulp.task('assets', function(cb)
{
	var local_folders = _.map(nconf.get('folders:source'), function(folder)
	{
		return path.join(folder, '*', 'assets', '**', '*.*');
	});
	
	gulp.src(local_folders)
		.pipe(map(function(file, cb)
		{
			var file_path = file.path.replace(file.base, '');
			file_path = file_path.split(path.sep);
		
			var manifest = manifest_manager.getManifestByName(file_path[0]);
		
			file.base = path.join(file.base, file_path[0], file_path[1]);
			
			file_path.splice(0, 2);
			file_path = path.join.apply(path, file_path);
		
			file.path = path.join(file.base, 'extensions', manifest.vendor, manifest.name, manifest.version, file_path);
		
			cb(null, file);
		}))
		.pipe(gulp.dest(path.join(nconf.get('folders:output')), {mode: '0777'}))
		.on('end', cb);
	
});
