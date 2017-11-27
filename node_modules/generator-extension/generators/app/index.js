var gutil = require('gulp-util')
,	path = require('path')
,	shell = require('shelljs')
,	_ = require('underscore');

var ModuleGenerator = require('../module/index');

module.exports = class extends ModuleGenerator {

	constructor(args, opts) {
		super(args, opts);
		this.option('n');
	}

	prompting() {

		this.log('\nWelcome! Let´s bootstrap your extension by following these steps:\n');

		return this.prompt([
			{
				type    : 'input'
			,	name    : 'name'
			,	message : 'Set your Extension Name'
			,	default: 'MyCoolExtension'
			,	validate: function(input)
				{
				    if(input.length === 0)
				    {
				    	return 'Plase provide an Extension name.';
				    }
				    return true;
				}
			}
		,	{
				type    : 'input'
			,	name    : 'vendor'
			,	message : 'Set the Vendor Name'
			,	default: 'Acme'
			,	store   : true
			,	validate: function(input)
				{
				    if(input.length === 0)
				    {
				    	return 'Plase provide a Vendor Name.';
				    }
				    return true;
				}
			}
		,	{
				type    : 'input'
			,	name    : 'version'
			,	message : 'Assign a Version Number'
			,	default: '1.0.0'
			,   validate: function(input)
	            {
	                var message;

	                if(input.length > 0)
	                {
	                    var values = input.split('.')
	                    ,   i = 0;

	                    if(values.length > 3)
	                    {
	                        return 'Please provide a valid version number (ie. 1.0.0)';
	                    }

	                    while(!message && i < values.length)
	                    {
	                        var value = values[i];

	                        if(_.isNaN(parseInt(value)))
	                        {
	                            message = 'Please provide a valid version number (ie. 1.0.0)';
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
		,	{
        		type: 'confirm'
        	,	name: 'is_cct'
        	,	message: 'Will you be working on a CCT?'
        	,	default: false
        	}
		,   {
                type: 'input'
            ,   name: 'description'
            ,   message: 'Set a Description for your extension'
            ,	default: 'My cool extension does magic!'
        	}
        // After the support for SCA is implemented uncomment this
        // ,   {
        //         type: 'checkbox'
        //     ,   name: 'target'
        //     ,   message: 'This extension supports'
        //     ,	store: true
        //     ,	default: ['SCS']
        //     ,	choices: [
        //     		{value: 'SCS', name: 'SuiteCommerce Standard'}
        //     	]
        // 	}
        ,	{
        		type: 'checkbox'
        	,	name: 'application'
        	,	message: 'This extension will be applied to'
        	,	default: ['shopping', 'myaccount', 'checkout']
        	,	choices: [
        			{value: 'shopping', name: 'Shopping'}
        		,	{value: 'myaccount', name: 'My Account'}
        		,	{value: 'checkout', name: 'Checkout'}
        		]
        	}
        ,	{
        		type: 'checkbox'
        	,	name: 'resources'
        	,	message: 'For this extension you will be using'
        	,	default: ['templates', 'sass', 'configuration', 'suitescript', 'javascript']
        	,	choices: [
        			{value: 'templates', name: 'Templates'}
        		,	{value: 'sass', name: 'Sass'}
        		,	{value: 'configuration', name: 'Configuration'}
        		,	{value: 'javascript', name: 'JavaScript'}
        		,	{value: 'suitescript', name: 'SuiteScript'}
        		]
        	}
        ,	{
        		type: 'input'
        	,	name: 'module_name'
        	,	message: 'Set the Initial Module Name'
        	,	default: 'MyCoolModule'
	        }
		])
		.then((answers) => {
	        
	        this.extension_options = answers;
	        this.extension_options.target = ['SCS'];

	        this.extension_options.label_name = answers.name;
	        this.extension_options.label_vendor = answers.vendor;

	        this.extension_options.module_name = answers.module_name.replace(/[^\w\-\_@0-9]/gi, '');
	        this.extension_options.name = this.extension_options.name.replace(/[^\w\-\_@0-9]/gi, '');
	        this.extension_options.vendor = this.extension_options.vendor.replace(/[^\w\-\_@0-9]/gi, '');

	        var ext_application = this.config.get('ext_application') || {};
	        ext_application[this.extension_options.name] = this.extension_options.application;

	        // this will determine for all the rest of the files of this extension
	        // for which application will they be compiled
	        this.config.set('ext_application', ext_application);

        	var root_ext_path = path.join(this.contextRoot, this.work_folder, this.extension_options.name);

        	if(shell.test('-d', root_ext_path))
			{
				return this.prompt([
					{
		        		type: 'confirm'
		        	,	name: 'continue'
		        	,	message: 'The extension ' +  this.extension_options.name + ' already exists.\nDo you want to continue and overwrite it?'
		        	,	default: false
		        	}
			    ]);
			}
		})
		.then((answer_confirm) =>
		{
			if(answer_confirm && !answer_confirm.continue)
        	{
        		this.env.error('Create extension ' + this.extension_options.name + ' operation was cancelled.');
        	}
		});
	}

	writing() {
		//create basic extension folders
		var root_ext_path = path.join(this.contextRoot, this.work_folder, this.extension_options.name)
		,	assets_path = path.join(root_ext_path, 'assets')
		,	manifest_dest_path = path.join(root_ext_path, 'manifest.json')
		,	module_name = this.extension_options.module_name
		,	module_path = path.join(root_ext_path, 'Modules', module_name)
		,	self = this
		;

		var cct_name_array = ['cct', this.extension_options.vendor, this.extension_options.name]
		,	cct_name = cct_name_array.map((value) => value.toLowerCase()).join('_')
		,	icon_name = cct_name + '_icon.svg'
		,	cct_icon_dest_path = path.join(assets_path, 'img', icon_name)
		;

		this.extension_options.cct_name = cct_name;

		shell.mkdir('-p', root_ext_path);
		shell.mkdir('-p', path.join(root_ext_path, 'Modules'));
		shell.mkdir('-p', module_path);
		shell.mkdir('-p', assets_path);
		shell.mkdir('-p', path.join(assets_path, 'fonts'));
		shell.mkdir('-p', path.join(assets_path, 'img'));
		shell.mkdir('-p', path.join(assets_path, 'services'));


		if(this.extension_options.is_cct)
		{
			this.fs.copyTpl(
		      	this.templatePath('manifest_cct.json')
			,	this.destinationPath(manifest_dest_path)
			,	{
					name: self.extension_options.label_name
				,	version: self.extension_options.version
				,	vendor: self.extension_options.label_vendor
				,	target: self.extension_options.target.join(',')
				,	description: self.extension_options.description || ''
				,	cct_name: cct_name
				}
			);

			this.fs.copy(
	      		this.templatePath('cct_icon.svg')
			,	this.destinationPath(cct_icon_dest_path)
			);
		}
		else
		{
			this.fs.copyTpl(
		      	this.templatePath('manifest.json')
			,	this.destinationPath(manifest_dest_path)
			,	{
					name: self.extension_options.label_name
				,	version: self.extension_options.version
				,	vendor: self.extension_options.label_vendor
				,	target: self.extension_options.target.join(',')
				,	description: self.extension_options.description || ''
				}
			);
		}

		var manifest = this.fs.readJSON(manifest_dest_path);

		var module_metadata = {
			manifest: manifest
		,	base_path: root_ext_path
		,	module_name: module_name
		,	create_mode: true
		};

		//add resources accordignly

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

	configuring()
	{
		var config = this.fs.readJSON(this.config_path)
		,	new_ext_path = this.work_folder + '/' + this.extension_options.name
		;

		if(config.folders.extensions_path)
		{
			if(!_.contains(config.folders.extensions_path, new_ext_path))
			{
				config.folders.extensions_path.push(new_ext_path);
			}
		}
		else
		{
			config.folders.extensions_path = [new_ext_path];
		}

		this.fs.extendJSON(this.config_path, config);
	}

	end()
	{
		var time_diff =  Math.abs(new Date() - this.initial_time);
		this.log(gutil.colors.green('\nGood! The process "extension:create" finished after ' + Math.round(time_diff / 1000) + ' sec.\n'));
		var default_logo_path = 'SuiteScripts/' + this.deploy_folder + '/' +
			this.extension_options.vendor + '/' + this.extension_options.name + '/' + this.extension_options.version + '/assets/' +
			this.extension_options.cct_name + '_icon.svg'
		;

		this.log(gutil.colors.green('You can continue developing using the following commands in order:\n'));
		this.log(
			gutil.colors.green('\t1- ') + 'gulp extension:fetch - to get the current theme and compile all the resources.\n' +
			gutil.colors.green('\t2- ') + 'gulp extension:local - (Optional) to develop locally styles and template files.\n' +
			gutil.colors.green('\t3- ') + 'gulp extension:deploy - to deploy your extension to the file cabinet and try it using the Extension Management UI.\n'
		);

		if(this.extension_options.is_cct)
		{
			this.log(gutil.colors.green('\nTo see your CCT in the SMT Panel, after running gulp extension:deploy you will need to:\n'));
			this.log(
			gutil.colors.green('\t1- ') + 'Go to Customization -> List,Records & Fields -> Record Types -> New.\n' +
			gutil.colors.green('\t2- ') + 'Create a custom record with id customrecord_' + this.extension_options.cct_name + '.\n' +
			gutil.colors.green('\t3- ') + 'Add all the fields your CCT will need.\n' +
			gutil.colors.green('\t4- ') + 'Go to Lists -> Website -> CMS Content Type -> New.\n' +
			gutil.colors.green('\t5- ') + 'Create a new CMS Content Type with name ' + this.extension_options.cct_name  + '\n\tand linked it to the custom record you created in the previous steps.\n' +
			gutil.colors.green('\t6- ') + 'You can link an icon with an absolute url to netsuite with the format ' + gutil.colors.blue('/core/media/media.nl?id=...') + 
				'\n\tWe\'ve added an icon by default, after deploying search the url in \n\t' + default_logo_path + '.\n' +
			gutil.colors.green('\t7- ') + 'Activate the extension for your domain.\n' +
			gutil.colors.green('\t8- ') + 'Go to the site, press ESC to go to the SMT Panel, and check that your CCT was added correctly.\n');
		}
	}
};