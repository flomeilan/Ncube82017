var env = require('yeoman-environment')
,   inquirer = require('inquirer')
,	nconf = require('nconf')
,	path = require('path')
,	yeoman = require('yeoman-environment')
,	_ =  require('underscore')
;

var env = yeoman.createEnv();
env.register(require.resolve('generator-extension/generators/service/index.js'), 'extension:service');

'use strict';

function _getEntryPoints(manifest)
{
	if(manifest.sass && manifest.sass.entry_points)
	{
		return _.keys(manifest.sass.entry_points);
	}
	else if(manifest.javascript && manifest.javascript.entry_points)
	{
		return _.keys(manifest.javascript.entry_points);
	}
	else if(manifest.templates && manifest.templates.application)
	{
		return _.keys(manifest.templates.application);
	}
	else
	{
		//TODO ask applications
	}
}

function _addJavaScript(manifest, file_path)
{
	if(manifest.javascript)
	{
		_.each(manifest.javascript.entry_points, function(files, application)
		{
			manifest.javascript.application[application].files.push(file_path);
		});
	}
	else
	{
		var entry_points = _getEntryPoints(manifest);

		manifest.javascript = {
			entry_points: {}
        ,	application: {}
		};

		_.each(entry_points, function(application)
		{
			manifest.javascript.entry_points[application] = file_path;
			
			manifest.javascript.application[application] = {
				files: [file_path]
			};
		});
	}
}

function _addSuiteScript(manifest, file_path, is_service)
{
	if(manifest['ssp-libraries'])
	{
		manifest['ssp-libraries'].files.push(file_path);
	}
	else
	{
		manifest.suitescript = {
			entry_point: file_path
        ,	files: [file_path]
		};
	}

	if(is_service)
	{
		generateService({
			vendor: manifest.vendor.replace(/[^\w\-\_@0-9]/gi, '')
		,	name: manifest.name.replace(/[^\w\-\_@0-9]/gi, '')
		,	service_name: path.basename(file_path).replace('.ServiceController.js', '')
		});
	}
}

function _removeJavaScript(manifest, file_path)
{
	if(manifest.javascript && manifest.javascript.application)
	{
		_.each(manifest.javascript.entry_points, function(files, application)
		{
			var index = _.indexOf(manifest.javascript.application[application].files, file_path);
			if(index >= 0)
			{
				manifest.javascript.application[application].files.splice(index, 1);
				if(manifest.javascript.entry_points[application] === file_path)
				{
					delete manifest.javascript.entry_points[application];
				}
			}
		});
	}
}

function _removeSuiteScript(manifest, file_path, is_service)
{
	if(manifest['ssp-libraries'] && manifest['ssp-libraries'].files)
	{
		var index = _.indexOf(manifest['ssp-libraries'].files, file_path);

		if(index >= 0)
		{
			manifest['ssp-libraries'].files.splice(index, 1);

			if(is_service)
			{
				//delete automatically generated service if the service controller is deleted
				var service_name = path.basename(file_path).replace('.ServiceController.js', '');
				shell.rm('-rf', path.join(manifest.local_folder, 'assets', 'services', service_name + '.Service.ss'));
			}
		}
	}
}

function generateService(extension_options)
{
	var options = { 
		gulp_context: 'gulp/generator-extension'
	,	work_folder: nconf.get('folders:source:source_path')
	,	extension_options: extension_options
	,	force: true
	};

	env.run('extension:service', options);
}

function updateJS(manifest, file_path, action)
{
	var is_javascript = file_path.toLowerCase().includes('javascript')
	,	is_suitescript = file_path.toLowerCase().includes('suitescript')
	,	is_service = file_path.includes('.ServiceController')
	,	file_name = path.basename(file_path)
	;

	function changeJS()
	{
		switch(action)
		{
			case 'added':
			case 'renamed':

				if(is_javascript)
				{
					_addJavaScript(manifest, file_path);
				}
				else if(is_suitescript)
				{
					_addSuiteScript(manifest, file_path, is_service);
				}
				break;

			case 'deleted':

				if(is_javascript)
				{
					_removeJavaScript(manifest, file_path);
				}
				else if(is_suitescript)
				{
					_removeSuiteScript(manifest, file_path, is_service);
				}
				break;
		}
	}

	if(!(is_javascript || is_suitescript))
	{
		 inquirer.prompt([
            {
                type: 'list'
            ,   name: 'js_type'
            ,   message: 'Is the file ' + file_name + ' a JavaScript file or a SuiteScript file?'
            ,   default: 'JavaScript'
            ,   choices: ['JavaScript', 'SuiteScript']
            }
        ]
		,	function selectedJS(answer)
        {
            switch(answer.js_type)
            {
            	case 'JavaScript':
            		is_javascript = true;
            		break;
            	case 'SuiteScript':
            		is_suitescript = true;
            		break;
            }

           changeJS();
        });
	}
	else
	{
		changeJS();
	}
}

function updateSass(manifest, file_path, action)
{
	switch(action)
	{
		case 'renamed':
		case 'added':
			if(manifest.sass)
			{
				manifest.sass.files.push(file_path);
			}
			else
			{
				manifest.sass = {
					entry_points: {}
		        ,	files: [
		           		file_path
		        	]
				};

				var entry_points = _getEntryPoints(manifest);

				_.each(entry_points, function(application)
				{
					manifest.sass.entry_points[application] = file_path;
				});
			}
			break;
		case 'deleted':
			if(manifest.sass && manifest.sass.files)
			{
				var index = _.indexOf(manifest.sass.files, file_path);

				if(index >= 0)
				{
					manifest.sass.files.splice(index, 1);

					_.each(entry_points, function(application)
					{
						if(manifest.sass.entry_points[application] === file_path)
						{
							delete manifest.sass.entry_points[application];
						}
					});
				}
			}
			
			break;	
		}
}

function updateTemplates(manifest, file_path, action)
{
	switch(action)
	{
		case 'added':
		case 'renamed':
			if(manifest.templates && manifest.templates.application)
			{
				_.each(manifest.templates.application, function(files, application)
				{
					manifest.templates.application[application].files.push(file_path);
				});
			}
			else
			{
				manifest.templates = {
					application: {}
				};

				var entry_points = _getEntryPoints(manifest);

				_.each(entry_points, function(application)
				{
					manifest.templates.application[application] = {

						files: [file_path]
					};
				});
			}
			break;
		case 'deleted':
			if(manifest.templates)
			{
				_.each(manifest.templates.application, function(files, application)
				{
					var index = _.indexOf(manifest.templates.application[application].files, file_path);

					if(index >= 0)
					{
						manifest.templates.application[application].files.splice(index, 1);
					}
				});
			}
			break;
	}
	
}

function updateConfiguration(manifest, file_path, action)
{
	switch(action)
	{
		case 'added':
		case 'renamed':

			if(manifest.configuration)
			{
				manifest.configuration.files.push(file_path);
			}
			else
			{
				manifest.configuration = {
					files: [file_path]
				};
			}

			break;

		case 'deleted':

			if(manifest.configuration && manifest.configuration.files)
			{
				var index = _.indexOf(manifest.configuration.files, file_path);

				if(index >= 0)
				{
					manifest.configuration.files.splice(index, 1);
				}
			}
			break;
	}
}

function updateAssets(manifest, file_path, action)
{
	var asset_folder = path.dirname(file_path);

	switch(action)
	{
		case 'renamed':
		case 'added':
			manifest.assets = manifest.assets || {};
			manifest.assets[asset_folder] = manifest.assets[asset_folder] || { files: [] };
			manifest.assets[asset_folder].files.push(file_path);
			break;
		
		case 'deleted':
			if(manifest.assets && manifest.assets[asset_folder])
			{
				var index = _.indexOf(manifest.assets[asset_folder].files, file_path);

				if(index >= 0)
				{
					manifest.assets[asset_folder].files.splice(index, 1);
				}
			}
	}
}

module.exports = {
	generateService: generateService
,	updateAssets: updateAssets
,	updateConfiguration: updateConfiguration
,	updateJS: updateJS
,	updateSass: updateSass
,	updateTemplates: updateTemplates
};