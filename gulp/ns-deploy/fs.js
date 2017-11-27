/* jshint node: true */
'use strict';

var fs = require('fs')
,	gutil = require('gulp-util')
,	_ = require('underscore')
,	mime = require('mime')
,	path = require('path')
,	archiver = require('../library/archiver');

var binary_types = [
	'application/x-autocad'
,	'image/x-xbitmap'
,	'application/vnd.ms-excel'
,	'application/x-shockwave-flash'
,	'image/gif'
,	'application/x-gzip-compressed'
,	'image/ico'
,	'image/jpeg'
,	'message/rfc822'
,	'audio/mpeg'
,	'video/mpeg'
,	'application/vnd.ms-project'
,	'application/pdf'
,	'image/pjpeg'
,	'image/x-png'
,	'image/png'
,	'application/postscript'
,	'application/vnd.ms-powerpoint'
,	'video/quicktime'
,	'application/rtf'
,	'application/sms'
,	'image/tiff'
,	'application/vnd.visio'
,	'application/msword'
,	'application/zip'
,	'image/svg+xml'
,	'application/x-font-ttf'
,	'application/font-woff'
,	'application/vnd.ms-fontobject'
,	'image/x-icon'
];


module.exports = {

	read: function (deploy, cb)
	{
		fs.readFile(deploy.options.file, {encoding: 'utf8'}, function(err, file)
		{
			if (err && err.code !== 'ENOENT')
			{
				// unknown error
				return cb(err);
			}
			else if (err && err.code === 'ENOENT')
			{
				// File does not exists
				return cb(null, deploy);
			}
			else
			{
				// file is present
				if(!deploy.options.newDeploy)
				{
					var saved_info = JSON.parse(file);
					deploy.info = _.extend(deploy.info, saved_info);
				}
				return cb(null, deploy);
			}
		});
	}

,	write: function(deploy, cb)
	{
		var saving_info = _.extend({}, deploy.info);
		delete saving_info.password;
		delete saving_info.script;
		delete saving_info.deploy;

		fs.writeFile(deploy.options.file, JSON.stringify(saving_info, '\t', 4), function()
		{
			return cb(null, deploy);
		});
	}

,	processFiles: function(deploy, cb)
	{
		var files = deploy.files.map(function(file)
		{
			var type = mime.getType(file.path);

			var file_info = {
				path: file.path.replace(file.base, '')
			,	type: type
			,	contents: file.contents.toString(~binary_types.indexOf(type) ? 'base64' : 'utf8')
			};

			var dirname = path.dirname(file.relative);
			dirname = dirname.replace(/\\/g,'/'); //Fix Windows paths
			if(deploy.publicList && deploy.publicList.indexOf(dirname)>=0)
			{
				file_info.setIsOnline = true;
			}
			return file_info;
		});

		var data = JSON.stringify({
				target_folder: deploy.info.target_folder
			,	backup_info: deploy.backup_info
			,	files: files
		});

		var payload_path = path.join(process.gulp_init_cwd,'payload.json');
		fs.writeFile(payload_path, data, function(error)
		{
			cb(error, deploy);
		});
	}

,	processBackup: function(deploy, cb)
	{
		gutil.log('Starting', gutil.colors.cyan('Backup sources'));
		console.log('Press control + c to cancel');

		var sourceFolder = '_Sources'
		,	archiveName = deploy.info.distroName + '-' + new Date().toISOString() + '.zip'
		,	archiveOptions = {
				target: path.join(process.gulp_dest, sourceFolder, archiveName)
			,	isMultiVolume: true
			,	maxVolumeLength: 1024 * 1024 * 9.8 // suitetalk limit is 10mb
			,	archiveType: 'zip'
			,	sources: [
						{ expand: true, src: ['Modules/**/*']}
					,	{ expand: true, src: ['gulp/**/*'] }
					,	{ expand: false, src: ['*.*', '!payload*']}
				]
		};

		archiver(archiveOptions, function(error)
		{
			if (error)
			{
				return cb(error);
			}

			var files = fs.readdirSync(path.join(process.gulp_dest, sourceFolder));
			files = files.map(function(file_name)
			{
				var file_path = path.join(process.gulp_dest, sourceFolder, file_name);
				var file_info = {
						path: sourceFolder + '/' + file_name
					,	type: 'application/zip'
					,	setIsOnline: false
					,	contents: fs.readFileSync(file_path).toString('base64')
				};

				return file_info;
			});

			var context = {
				target_folder: deploy.info.target_folder
			,	files: files
			}
			cb(null, deploy);
		});
	}
};