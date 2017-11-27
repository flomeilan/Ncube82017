var gutil = require('gulp-util')
,	path = require('path')
,	shell = require('shelljs')
,	_ = require('underscore');

var Generator = require('yeoman-generator');

module.exports = class extends Generator {

	constructor(args, opts) {
		super(args, opts);

		var context = this.options.gulp_context ?  this.options.gulp_context + '/' : '';
		this.work_folder = this.options.work_folder;
		this.config_path = this.options.config_path;
		this.deploy_folder = this.options.deploy_folder;
		this.sourceRoot(context + 'generators/app/templates');
		this.extension_options = {};
		this.initial_time = new Date();
	}

	prompting() {

		this.log('\nWelcome! Let´s bootstrap your module by following these steps:\n');

		return this.prompt([
			{
	        	type: 'input'
        	,	name: 'module_name'
        	,	message: 'Set the Module Name'
        	,	default: 'AdditionalCoolModule'
        	}
       	,	{
        		type: 'checkbox'
        	,	name: 'resources'
        	,	message: 'For this module you will be using'
        	,	default: ['templates', 'sass', 'configuration', 'suitescript', 'javascript']
        	,	choices: [
        			{value: 'templates', name: 'Templates'}
        		,	{value: 'sass', name: 'Sass'}
        		,	{value: 'configuration', name: 'Configuration'}
        		,	{value: 'javascript', name: 'JavaScript'}
        		,	{value: 'suitescript', name: 'SuiteScript'}
        		]
        	}
		])
		.then((answers) => {
	        
	        this.extension_options = answers;
	        this.extension_options.module_name = this.extension_options.module_name.replace(/[^\w\-\_@0-9]/gi, '');
	        this.extension_options.is_cct = false;
	        return this._inquireExtension();
		})
		.then((manifest) =>
		{
			this.extension_options.label_name = manifest.name;
	        this.extension_options.label_vendor = manifest.vendor;

			this.extension_options.name = manifest.name.replace(/[^\w\-\_@0-9]/gi, '');
	        this.extension_options.vendor = manifest.vendor.replace(/[^\w\-\_@0-9]/gi, '');

	        this.extension_options.application = this.config.get('ext_application') ? this.config.get('ext_application')[manifest.name] : ['shopping', 'myaccount', 'checkout'];

        	var root_ext_path = path.join(this.contextRoot, this.work_folder, this.extension_options.name, this.extension_options.module_name);

        	if(shell.test('-d', root_ext_path))
			{
				return this.prompt([
					{
		        		type: 'confirm'
		        	,	name: 'continue'
		        	,	message: 'The module ' +  this.extension_options.module_name + ' already exists.\nDo to continue and overwrite it?'
		        	}
			    ]);
			}
		})
		.then((answer_confirm) =>
		{
			if(answer_confirm && !answer_confirm.continue)
        	{
        		this.env.error('Canceling extension:create for ' + this.extension_options.name);
        	}
		});
	}

	_inquireExtension() {

		var config = this.fs.readJSON(this.config_path)
		,	extensions_path = config.folders.extensions_path
		,	manifest
        ,	manifest_path
        ,	self = this
        ;
        
        if(extensions_path.length)
        {
            if(extensions_path.length === 1)
            {
                manifest_path = path.join(extensions_path[0], 'manifest.json');
                manifest = this.fs.readJSON(manifest_path);
                return Promise.resolve(manifest);
            }
            else
            {
                var extensions = _.map(extensions_path, function(path)
                {
                    return path.replace(config.folders.source.source_path + '/', '');
                });

               	return this.prompt([
                    {
                        type: 'list'
                    ,   name: 'extension'
                    ,   message: 'Select extension to add module:'
                    ,   default: extensions[0]
                    ,   choices: extensions
                    }
               		])
	                .then((ext_answer) =>
	            	{
	                    ext_answer = ext_answer.extension;
	                    manifest_path = path.join(this.contextRoot, config.folders.source.source_path, ext_answer, 'manifest.json');
	                    manifest = self.fs.readJSON(manifest_path);
	                    return manifest;
	                });
            }
        }
        else
        {
        	this.env.error('Sorry. Could not find extension to add additional modules.');
        }
    }

	writing() {
		//create module folders
		var root_ext_path = path.join(this.contextRoot, this.work_folder, this.extension_options.name)
		,	manifest_dest_path = path.join(root_ext_path, 'manifest.json')
		,	module_name = this.extension_options.module_name
		,	module_path = path.join(root_ext_path, 'Modules', module_name)
		,	self = this
		;

		shell.mkdir('-p', module_path);

		//add resources accordignly
		var manifest = this.fs.readJSON(manifest_dest_path);
		
		var module_metadata = {
			manifest: manifest
		,	base_path: root_ext_path
		,	module_name: module_name
		,	create_mode: false
		};

		_.each(this.extension_options.resources, function(resource)
		{
			switch(resource)
			{
				case 'javascript':
					self._writeJavascript(module_metadata);
					break;
				case 'configuration':
					self._writeConfiguration(module_metadata);
					break;
				case 'suitescript':
					self._writeSuiteScript(module_metadata);
					break;
				case 'sass':
					self._writeSass(module_metadata);
					break;
				case 'templates':
					self._writeTemplates(module_metadata);
					break;
			}
		});

		this.fs.extendJSON(manifest_dest_path, manifest);	
	}

	end()
	{
		var time_diff =  Math.abs(new Date() - this.initial_time);
		this.log(gutil.colors.green('\nGood! The process "extension:create-module" finished after ' + Math.round(time_diff / 1000) + ' sec.'));
		this.log(gutil.colors.green('You can continue developing using the following commands in order:\n'));
		this.log(
			gutil.colors.green('\t1- ') + 'gulp extension:fetch - to get the current theme and compile all the resources.\n' +
			gutil.colors.green('\t2- ') + 'gulp extension:local - (Optional) to develop locally styles and template files.\n' +
			gutil.colors.green('\t3- ') + 'gulp extension:deploy - to deploy your extension to the file cabinet and try it using the Extension Management UI.\n' +
			gutil.colors.green('\nThank you.')
		);
	}

	_writeJavascript(data) {

		var module_full_name_array = [this.extension_options.vendor, this.extension_options.name, this.extension_options.module_name]
		,	module_full_name = module_full_name_array.join('.')
		,	tpl_name = module_full_name_array.map((value) => value.toLowerCase()).join('_')
		,	module_dep_name = this.extension_options.module_name.replace(/[^\w]/gi, '')
		;

		var javascript_path = path.join(data.base_path, 'Modules', data.module_name, 'JavaScript', data.module_name)
		,	full_entry_point_path = path.join(data.base_path, 'Modules', data.module_name, 'JavaScript', module_full_name)
		,	manifest_module_path = ['Modules', data.module_name, 'JavaScript', data.module_name].join('/')
		,	manifest_entry_point_path = ['Modules', data.module_name, 'JavaScript', module_full_name].join('/')
		;

		if(!this.extension_options.is_cct)
		{
			this.fs.copyTpl(
		      	this.templatePath('JavaScript/EntryPoint.js')
			,	this.destinationPath(full_entry_point_path + '.js')
			,	{
					module_name: module_full_name
				,	module_dep_name: module_dep_name
				}
			);
		}
		else
		{
			this.fs.copyTpl(
		      	this.templatePath('JavaScript/EntryPoint.CCT.js')
			,	this.destinationPath(full_entry_point_path + '.js')
			,	{
					module_name: module_full_name
				,	module_dep_name: module_dep_name
				,	cct_id: this.extension_options.cct_name
				}
			);

			this.fs.copyTpl(
		      	this.templatePath('JavaScript/View.CCT.js')
			,	this.destinationPath(javascript_path + '.View.js')
			,	{
					module_name: module_full_name
				,	tpl_name: tpl_name
				,	tpl_dep_name: tpl_name
				}
			);

		}
		
		this.fs.copyTpl(
	      	this.templatePath('JavaScript/Edit.View.js')
		,	this.destinationPath(javascript_path + '.Edit.View.js')
		,	{
				module_name: module_full_name
			,	tpl_name: tpl_name + '_edit'
			,	tpl_dep_name: tpl_name + '_edit'
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('JavaScript/List.View.js')
		,	this.destinationPath(javascript_path + '.List.View.js')
		,	{
				module_name: module_full_name
			,	module_dep_name: module_dep_name
			,	tpl_name: tpl_name + '_list'
			,	tpl_dep_name: tpl_name + '_list'
			,	extension_name: this.extension_options.name
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('JavaScript/Router.js')
		,	this.destinationPath(javascript_path + '.Router.js')
		,	{
				module_name: module_full_name
			,	module_dep_name: module_dep_name
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('JavaScript/Model.js')
		,	this.destinationPath(javascript_path + '.Model.js')
		,	{
				module_name: module_full_name
			,	module_dep_name: module_dep_name
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('JavaScript/Collection.js')
		,	this.destinationPath(javascript_path + '.Collection.js')
		,	{
				module_name: module_full_name
			,	module_dep_name: module_dep_name
			}
		);

		var create_javascript = data.create_mode || !(data.manifest.javascript && data.manifest.javascript.application);
		var files_to_add =  [
				manifest_entry_point_path + '.js'
			,	manifest_module_path + '.Router.js'
			,	manifest_module_path + '.List.View.js'
			,	manifest_module_path + '.Edit.View.js'
			,	manifest_module_path + '.Collection.js'
			,	manifest_module_path + '.Model.js'
			];

		if(this.extension_options.is_cct)
		{
			files_to_add.push(manifest_module_path + '.View.js');
		}

		if(create_javascript)
		{
			data.manifest.javascript = {
				entry_points: {}
			,	application: {}
			};

			_.each(this.extension_options.application, function(application)
			{
				data.manifest.javascript.entry_points[application] = manifest_entry_point_path + '.js';
				data.manifest.javascript.application[application] = {
					files: files_to_add
				};
			});
		}
		else
		{
			_.each(this.extension_options.application, function(application)
			{
				data.manifest.javascript.application[application].files = data.manifest.javascript.application[application].files.concat(files_to_add);
			});
		}
	}

	_writeConfiguration(data) {

		var module_conf_name = [this.extension_options.vendor, this.extension_options.name, data.module_name].map((value) => value.toLowerCase()).join('_');
		
		var conf_path = path.join(data.base_path, 'Modules', data.module_name, 'Configuration', data.module_name)
		,	manifest_module_path = ['Modules', data.module_name, 'Configuration', data.module_name].join('/')
		
		this.fs.copyTpl(
	      	this.templatePath('Configuration/Configuration.json')
		,	this.destinationPath(conf_path + '.json')
		,	{
				conf_title: this.extension_options.label_name
			,	module_conf_name: module_conf_name
			}
		);

		var create_conf = data.create_mode || !(data.manifest.configuration && data.manifest.configuration.files)
		,	files_to_add = [manifest_module_path + '.json']
		;
	
		if(create_conf)
		{
			data.manifest.configuration = {
				files: files_to_add
			};
		}
		else
		{
			data.manifest.configuration.files = data.manifest.configuration.files.concat(files_to_add);
		}
	}

	_writeSuiteScript(data) {

		var module_full_name_array = [this.extension_options.vendor, this.extension_options.name, this.extension_options.module_name]
		,	module_full_name = module_full_name_array.join('.')
		,	module_dep_name =  this.extension_options.module_name.replace(/[^\w]/gi, '')
		;
		
		var suitescript_path = path.join(data.base_path, 'Modules', data.module_name, 'SuiteScript', data.module_name)
		,	service_path = path.join(data.base_path, 'assets', 'services', data.module_name)
		,	full_entry_point_path = path.join(data.base_path, 'Modules', data.module_name, 'SuiteScript', module_full_name)
		,	manifest_module_path = ['Modules', data.module_name, 'SuiteScript', data.module_name].join('/')
		,	manifest_entry_point_path = ['Modules', data.module_name, 'SuiteScript', module_full_name].join('/')
		;
		
		this.fs.copyTpl(
	      	this.templatePath('SuiteScript/EntryPoint.js')
		,	this.destinationPath(full_entry_point_path + '.js')
		,	{
				module_name: module_full_name
			,	module_dep_name: module_dep_name
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('SuiteScript/Model.js')
		,	this.destinationPath(suitescript_path + '.Model.js')
		,	{
				module_name: module_full_name
			,	entity_name:  this.extension_options.module_name.toLowerCase()
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('SuiteScript/ServiceController.js')
		,	this.destinationPath(suitescript_path + '.ServiceController.js')
		,	{
				module_name: module_full_name
			,	module_dep_name: module_dep_name
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('service.ss')
		,	this.destinationPath(service_path + '.Service.ss')
		,	{
				module_name: module_full_name
			}
		);

		var create_ssp_lib = data.create_mode || !(data.manifest['ssp-libraries'] && data.manifest['ssp-libraries'].files)
		,	files_to_add =  [
				manifest_entry_point_path + '.js'
			,	manifest_module_path + '.ServiceController.js'
			,	manifest_module_path + '.Model.js'
			]
		;
	
		if(create_ssp_lib)
		{
			data.manifest['ssp-libraries'] = {
				entry_point: manifest_entry_point_path + '.js'
			,	files: files_to_add
			};
		}
		else
		{
			data.manifest['ssp-libraries'].files = data.manifest['ssp-libraries'].files.concat(files_to_add);
		}

		data.manifest.assets = data.manifest.assets || {};
		data.manifest.assets.services = data.manifest.assets.services || { files: [] };

		data.manifest.assets.services.files.push('services/' + data.module_name + '.Service.ss');
	}

	_writeSass(data) {

		var sass_entry_file_name = [this.extension_options.name, this.extension_options.module_name].map((value) => value.toLowerCase()).join('-')
		,	sass_class_name = this.extension_options.module_name.toLowerCase()
		;
		
		var sass_path = path.join(data.base_path, 'Modules', data.module_name, 'Sass', '_')
		,	manifest_module_path = ['Modules', data.module_name, 'Sass', '_'].join('/')
		;

		this.fs.copyTpl(
	      	this.templatePath('Sass/_entry-point.scss')
		,	this.destinationPath(sass_path + sass_entry_file_name + '.scss')
		,	{
				sass_dependency: sass_class_name
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('Sass/_example.scss')
		,	this.destinationPath(sass_path + sass_class_name + '.scss')
		,	{
				sass_class_name: sass_class_name
			}
		);

		var create_sass = data.create_mode || !(data.manifest.sass && data.manifest.sass.files)
		,	files_to_add =  [
				manifest_module_path + sass_entry_file_name + '.scss'
			,	manifest_module_path + sass_class_name + '.scss'
			]
		;
	
		if(create_sass)
		{
			data.manifest.sass = {
				entry_points: {}
			,	files: files_to_add
			};

			_.each(this.extension_options.application, function(application)
			{
				data.manifest.sass.entry_points[application] = manifest_module_path + sass_entry_file_name + '.scss';
			});
		}
		else
		{
			data.manifest.sass.files = data.manifest.sass.files.concat(files_to_add);
		}
	}

	_writeTemplates(data) {

		var module_full_name_array = [this.extension_options.vendor, this.extension_options.name, this.extension_options.module_name]
		,	module_full_name = module_full_name_array.map((value) => value.toLowerCase()).join('_')
		,	class_name = this.extension_options.module_name.toLowerCase()
		;
		
		var templates_path = path.join(data.base_path, 'Modules', data.module_name, 'Templates', module_full_name)
		,	manifest_module_path = ['Modules', data.module_name, 'Templates', module_full_name].join('/')
		,	files_to_add  = [ 
				manifest_module_path + '_list.tpl'
			,	manifest_module_path + '_edit.tpl'
			]
		;

		if(this.extension_options.is_cct)
		{
			this.fs.copyTpl(
	      		this.templatePath('Templates/template_cct.tpl')
			,	this.destinationPath(templates_path + '.tpl')
			,	{
					module_name:  this.extension_options.name
				,	class_name: class_name
			}
			);

			files_to_add.push(manifest_module_path + '.tpl');
		}
		
		this.fs.copyTpl(
	      	this.templatePath('Templates/template_list.tpl')
		,	this.destinationPath(templates_path + '_list.tpl')
		,	{
				module_name:  this.extension_options.name
			,	module_dep_name: data.module_name
			,	class_name: class_name
			}
		);

		this.fs.copyTpl(
	      	this.templatePath('Templates/template_edit.tpl')
		,	this.destinationPath(templates_path + '_edit.tpl')
		,	{
				module_name:  this.extension_options.name
			,	class_name: class_name
			}
		);

		var create_templates = data.create_mode || !(data.manifest.templates && data.manifest.templates.application);
	
		if(create_templates)
		{
			data.manifest.templates = {
				application: {}
			};

			_.each(this.extension_options.application, function(application)
			{
				data.manifest.templates.application[application] = {
					files: files_to_add
				};
			});
		}
		else
		{
			_.each(this.extension_options.application, function(application)
			{
				data.manifest.templates.application[application].files = data.manifest.templates.application[application].files.concat(files_to_add);
			});
		}
	}

};