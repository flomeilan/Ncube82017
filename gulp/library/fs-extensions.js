var path = require('path')
,	fs = require('fs');

// @method parsePath parses a file system path into an object
// @param {String} file path
// @return {Dictionary} with folder, baseName, and extension for the file
function parsePath(targetName)
{
	targetName = path.normalize(targetName);

	//sanitize path, take into consideration windows path
	var windowsPrefix = /^([A-Za-z]\:\\)/.exec(targetName);
	if (windowsPrefix)
	{
		windowsPrefix = windowsPrefix[0];
		targetName = targetName.substr(0, windowsPrefix.length) + targetName.substr(windowsPrefix.length).replace(/[\:\*\?\"<>\|]/g , '-');
	}
	else
	{
		targetName = targetName.replace(/[\:\*\?\"<>\|]/g , '-');	
	}

	var extension = path.extname(targetName);
	return {
			folder: path.dirname(targetName)
		,	baseName: path.basename(targetName, extension)
		,	extension: extension
	};
}


// @method createFolder recursively creates folders from a path
// @param {String} folder path
function createFolder(folderName)
{
	var nameSegments = folderName.split(path.sep);
	folderName = '';

	nameSegments.forEach(function(segment)
	{
		folderName = folderName + segment + path.sep;
		if (! fs.existsSync(folderName))
		{
			fs.mkdirSync(folderName);
		}
	});
}

module.exports = {
		parsePath: parsePath
	,	createFolder: createFolder
}