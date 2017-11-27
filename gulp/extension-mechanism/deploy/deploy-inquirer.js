
var fs = require('fs')
,   gutil = require('gulp-util')
,   inquirer = require('inquirer')
,   PromptCheckbox = require('prompt-checkbox')
,	nconf = require('nconf')
,   path = require('path')
,	_ = require('underscore')
;

'use strict';

function prepareQuestions(manifest)
{
    var optional_questions = [
        {
            type: 'input'
        ,   name: 'vendor'
        ,   message: 'Vendor:'
        ,   default: manifest.vendor
        }
    ,   {
                type: 'input'
            ,   name: 'name'
            ,   message: 'Name:'
            ,   default: manifest.name
        }
    ,   {
            type: 'input'
        ,   name: 'version'
        ,   message: 'Version:'
        ,   default: manifest.version
        ,   validate: function(input)
            {
                var message;

                if(input.length > 0)
                {
                    var values = input.split('.')
                    ,   i = 0;

                    if(values.length > 3)
                    {
                        return 'Please enter a valid version number (ie. 1.1.1)';
                    }

                    while(!message && i < values.length)
                    {
                        var value = values[i];

                        if(_.isNaN(parseInt(value)))
                        {
                            message = 'Please enter a valid version number (ie. 1.1.1)';
                        }

                        i++;
                    }

                    return message || true;             
                }
                else
                {
                    return true;
                }
                
            }
        }
    ,   {
                type: 'input'
            ,   name: 'description'
            ,   message: 'Description:'
            ,   default: manifest.description
        }
    ];

    return optional_questions;
}

var extension_deploy_inquirer = {

    inquireDeployExtension: function inquireDeployExtension(first_cb)
    {
        var extensions_path = nconf.get('folders:extensions_path');
        
        if(extensions_path.length)
        {
            var manifest_path
            ,   manifest;

            if(extensions_path.length === 1)
            {
                manifest_path = path.join(extensions_path[0], 'manifest.json');
                manifest = JSON.parse(fs.readFileSync(manifest_path).toString());
                first_cb(null, {
                    manifest: manifest
                ,   manifest_path: manifest_path
                ,   ext_folder: extensions_path[0]
                });
            }
            else
            {
                var extensions = _.map(extensions_path, function(path)
                {
                    return path.replace(nconf.get('folders:source:source_path') + '/', '');
                });


                inquirer.prompt([
                    {
                        type: 'list'
                    ,   name: 'extension'
                    ,   message: 'Select extension:'
                    ,   default: extensions[0]
                    ,   choices: extensions
                    }
                ])
				.then(
					function selectedExt(ext_answer)
					{
						ext_answer = ext_answer.extension;
						manifest_path = path.join(nconf.get('folders:source:source_path'), ext_answer, 'manifest.json');
						manifest = JSON.parse(fs.readFileSync(manifest_path).toString());
						first_cb(null, {
								manifest: manifest
							,   manifest_path: manifest_path
							,   ext_folder: path.join(nconf.get('folders:source:source_path'), ext_answer)
							}
						);
					}
				);
            }
        }
        else
        {
            first_cb(new Error('There is no extension to deploy, sorry.\n' +
                'Check if it\'s correctly setted in your configuration file the keys folders -> extensions_path.'));
        }
    }
	
,   inquireNewExtensionData: function inquireNewExtensionData(data, cb)
	{
		var questions = prepareQuestions(data.manifest);
       
		if(data.has_bundle || data.create_new_record)
		{
			inquirer.prompt(
                questions
			)
			.then(
				function(answers)
                {
                    if(data.has_bundle)
                    {
                        gutil.log(gutil.colors.green('Deploying from a published ' + data.manifest.type + '. Preparing to create a new one...'));
                    }
                	
                    if(!data.create_new_record &&
                        answers.name === data.extension_record.name &&
                        answers.vendor === data.extension_record.vendor &&
                        answers.version === data.extension_record.version)
                    {
                        cb(new Error('There is already a ' + data.manifest.type +
                                    ' called: ' + data.extension_record.name + ' - ' + data.extension_record.version + 
                                    '. Vendor: ' + data.extension_record.vendor + '. You need to deploy a new ' + data.manifest.type + '.'));
                        return;
                    }
                   
                    extension_deploy_inquirer.askTarget(data).run()
                    .then(function(target_answers)
                    {
                        var new_extension = {
                            vendor: answers.vendor
                        ,   name: answers.name
                        ,   version: answers.version
                        ,   targets: target_answers
                        ,   description: answers.description
                        };

                        data.new_extension = new_extension;
                        data.record_operation = 'create';
                        data.folder_changed = true;
                        gutil.log(gutil.colors.green('Preparing to ' + data.record_operation + ' the ' + data.manifest.type + ' metadata...'));
                        cb(null, data);
                    })
                    .catch(function(err)
                    {
                        cb(err);
                    });
                }
	        );
		}
		else
		{
            //create case ask all the questions except operation
            //or update advanced, cutomize all metadata and update the record
            if(nconf.get('deploy_config:create') ||
               nconf.get('deploy_config:update') && nconf.get('deploy_config:advanced'))
            {
                inquirer.prompt(
                    questions
                )
				.then(
					function(answers)
                    {
                        if(nconf.get('deploy_config:create'))
                        {
                            if(answers.name === data.extension_record.name &&
                                answers.vendor === data.extension_record.vendor &&
                                answers.version === data.extension_record.version)
                            {
                                cb(new Error('There is already a ' + data.manifest.type +
                                    ' called: ' + data.extension_record.name + ' - ' + data.extension_record.version + 
                                    '. Vendor: ' + data.extension_record.vendor + '.'));
                                return;
                            }

                            data.record_operation = 'create';
                        }
                        else
                        {
                            data.record_operation = 'update';
                        }
                      
                        extension_deploy_inquirer.askTarget(data).run()
                        .then(function(target_answers)
                        {
                            var new_extension = {
                                vendor: answers.vendor
                            ,   name: answers.name
                            ,   version: answers.version
                            ,   targets: target_answers
                            ,   description: answers.description
                            };

                            data.new_extension = new_extension;
                            data.folder_changed = extension_deploy_inquirer.folderChanged(data, new_extension);

                            gutil.log(gutil.colors.green('Preparing to ' + data.record_operation + ' the ' + data.manifest.type + ' metadata...'));
                            cb(null, data);
                        })
                        .catch(function(err)
                        {
                            cb(err);
                        });
                    }
                );
            }
            else
            {
                //update simple case
                data.folder_changed = false;

                gutil.log(gutil.colors.green('No ' + data.manifest.type + ' metadata has changed. Preparing to upload files...'));
                data.record_operation = 'update';
                cb(null, data);
            }
		}
	}

,	askTarget: function askTarget(data)
	{
        var parsed_targets = {};

        _.each(data.targets, function(target)
        {
            parsed_targets[target.name] = target.target_id;
        });

        var targets_promise = new PromptCheckbox({
                name: 'targets'
            ,   message: 'Select supported products (use <space bar>):'
            ,   choices: _.keys(parsed_targets)
            ,   default: data.create_new_record ? data.extension_record.targets.split(',') : _.pluck(data.extension_record.targets, 'name')
            ,   validate: function(input)
                {
                    return input.length > 0 || 'Please enter an application';
                }
            ,   transform: function(answer)
                {
                    return _.map(answer, function(target_name)
                    { 
                        return parsed_targets[target_name];
                    });
                }
            }
        );

        return targets_promise;
	}

,   folderChanged: function folderChanged(data, new_extension)
    {  
        return data.extension_record.name !== data.new_extension.name ||
            data.extension_record.vendor !== data.new_extension.vendor ||
            data.extension_record.version !== data.new_extension.version;
    }
};

module.exports = {
	inquireNewExtensionData: extension_deploy_inquirer.inquireNewExtensionData
,   inquireDeployExtension: extension_deploy_inquirer.inquireDeployExtension
};