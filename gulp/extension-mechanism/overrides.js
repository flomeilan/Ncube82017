var manifest_manager = require('./manifest-manager')
,	watch_manager = require('./watch-manager')
,	nconf = require('nconf')
,	glob = require('glob')
,	fs = require('fs')
,	path = require('path')
,	_ = require('underscore');

module.exports = {
	
	updateOverrides: function()
	{
		var theme_manifest = manifest_manager.getThemeManifest();
		var overrides_folder = nconf.get('folders:overrides_path');
		var theme_folder = nconf.get('folders:theme_path');
		
		if(!fs.existsSync(overrides_folder))
		{
			throw new Error('The overrides folder path "' + overrides_folder + '" does not exists. You need to execute "gulp theme-fetch" before');
		}
		
		var src_overrides_files = glob.sync(path.join(overrides_folder, '**/*.@(scss|tpl)'));
		var manifest_path = path.join(theme_manifest.local_folder, 'manifest.json');

		theme_manifest.override = _.map(src_overrides_files, function(override)
		{
			var dst_path = override.replace(overrides_folder + '/', '');
			var src_path = override.replace(theme_folder + '/', '');
			
			var ext = path.extname(src_path);
			if(ext === '.scss')
			{
				var files = theme_manifest.sass.files;
				if(!_.contains(files, src_path))
				{
					files.push(src_path);
				}
			}
			else if(ext === '.tpl')
			{
				var aux = dst_path.split('/')
				,	extensions_name = aux.shift()
				,	file_path = aux.join('/')
				,	extension_manifest = manifest_manager.getManifestByName(extensions_name);
				
				_.each(extension_manifest.templates.application, function(app, app_name)
				{
					var files = theme_manifest.templates.application[app_name].files;
					
					if(_.contains(app.files, file_path) && !_.contains(files, src_path))
					{
						files.push(src_path);
					}
				});
				
			}			
			
			return {
				src: src_path
			,	dst: dst_path
			};
		});
		
		fs.writeFileSync(manifest_path, JSON.stringify(theme_manifest, null, '\t'));

		var tpl_overrides_files = path.join(overrides_folder, '**', '*.tpl');
		var scss_overrides_files = path.join(overrides_folder, '**', '*.scss');

		watch_manager.registerWatch([tpl_overrides_files], ['templates']);
		watch_manager.registerWatch([scss_overrides_files], ['compile-sass']);
	}
	
};