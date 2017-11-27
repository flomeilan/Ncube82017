var path = require('path');

var Generator = require('yeoman-generator');

module.exports = class extends Generator {

	constructor(args, opts) {
		super(args, opts);

		var context = this.options.gulp_context ?  this.options.gulp_context + '/' : '';
		this.work_folder = this.options.work_folder;
		this.extension_options = this.options.extension_options;
		this.sourceRoot(context + 'generators/app/templates');
	}

	writing() {
		//create service file
		var root_ext_path = path.join(this.contextRoot, this.work_folder, this.extension_options.name)
		,	service_full_name_array = [this.extension_options.vendor, this.extension_options.name,  this.extension_options.service_name]
		,	module_full_name = service_full_name_array.join('.')
		,	service_path = path.join(root_ext_path, 'assets', 'services',  this.extension_options.service_name + '.Service.ss')
		;

		this.fs.copyTpl(
	      	this.templatePath('service.ss')
		,	this.destinationPath(service_path)
		,	{
				module_name: module_full_name
			}
		);
	}

	end()
	{
		if(this.options.cb)
		{
			this.options.cb({status: 'OK'});
		}
	}
};