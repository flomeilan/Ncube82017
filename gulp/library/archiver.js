'use strict';

var fs = require('fs')
,	fsExtensions = require('./fs-extensions')
,	path = require('path')
,	archiver = require('archiver');

function pad(num, size, padding) {
	var s = num + '';
	while (s.length < size)
	{
		s = padding + s;
	} 
	return s;
}

function getVolumeName(options, target)
{
	var name = target.baseName + target.extension;
	if (options.isMultiVolume)
	{
		name = name + '.' + pad(options.currentVolumeIndex, 3, '0');
	}

	return path.join(target.folder, name);
}


function Writer(isMultiVolume, maxVolumeLength)
{
	var current_file
	,	current_file_length = 0;

	function isFull(chunkLength)
	{
		return isMultiVolume && (current_file_length + chunkLength > maxVolumeLength);
	}

	function start(path)
	{
		current_file = fs.openSync(path, 'w');
		current_file_length = 0;
	}

	function close()
	{
		fs.closeSync(current_file);
	}

	function write(chunk)
	{
		fs.writeSync(current_file, chunk, 0, chunk.length);
		current_file_length += chunk.length;
	}

	return{
			isFull: isFull
		,	start: start
		,	close: close
		,	write: write
	};
}


function generateArchive(options, cb)
{
	//defaults
	options.sources = options.sources || [];
	options.target = options.target || 'archive.zip';
	options.archiveType = options.archiveType || 'zip';
	options.isMultiVolume = options.isMultiVolume || false;
	options.currentVolumeIndex = options.currentVolumeIndex || 1;


	var target = fsExtensions.parsePath(options.target)
	,	writer = Writer(options.isMultiVolume, options.maxVolumeLength);

	fsExtensions.createFolder(target.folder);
	writer.start(getVolumeName(options, target));

	var archive = archiver(options.archiveType).on('error', function(error) 
	{
		cb(error);
	})
	.on('data', function(chunk)
	{
		if (writer.isFull(chunk.length))
		{
			writer.close();

			options.currentVolumeIndex ++;
			writer.start(getVolumeName(options, target));
		}

		writer.write(chunk);
	})
	.on('end', function()
	{
		writer.close();
		cb(null);
	});

	archive.bulk(options.sources);
	archive.finalize();
}

/* 
 * Example usage

	generateArchive({
			target: '../folder/me.tar'
		,	isMultiVolume: true
		,	archiveType: 'tar'
		,	maxVolumeLength: 1024 * 1024 * 5
		,	sources: [{expand: true, src: ['C:\\next-gen\\Modules\\**\\*']}]
	}, function(){
		console.log('end callback');
	});

*/
module.exports = generateArchive;