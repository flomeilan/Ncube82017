var gulp = require('gulp-help')(require('gulp'), { hideDepsMessage: true, hideEmpty: true })
,	path = require('path')
,	nconf = require('nconf')
,	fs = require('fs')
,	gutil = require('gulp-util')
,	_ = require('underscore')
,	manifest_manager = require('../extension-mechanism/manifest-manager')
;

function validate(cb)
{
	var manifests = [];
	if(nconf.get('extensionMode') && nconf.get('folders:extensions_path') && nconf.get('folders:extensions_path').length)
	{
		manifests = _.map(nconf.get('folders:extensions_path'), function(manifest_path)
		{
			var ext_manifest_path = path.join(manifest_path, 'manifest.json')
			,	manifest = JSON.parse(fs.readFileSync(ext_manifest_path).toString());
			
			manifest.local_folder = manifest_path;
			
			return manifest;
		});
	}
	
	if(nconf.get('folders:theme_path') && fs.existsSync(nconf.get('folders:theme_path')))
	{
		var theme_manifest_path = path.join(nconf.get('folders:theme_path'), 'manifest.json')
		,	manifest = JSON.parse(fs.readFileSync(theme_manifest_path).toString());
			
		manifest.local_folder = nconf.get('folders:theme_path');
		
		manifests.push(manifest);
	}
	
	for(var i = 0; i < manifests.length; i++)
	{
		var manifest = manifests[i]
		,	manifest_path = path.join(manifest.local_folder, 'manifest.json');
		
		gutil.log(gutil.colors.green('Checking ' + manifest_path + ' file paths...'));

		var files = [];

		if(manifest.templates && !manifest.templates.application)
		{
			cb(new gutil.PluginError('gulp validate', 'Templates section of the manifest needs an application key.'));
			return;
		}
		
		_.each(manifest.templates && manifest.templates.application, function(application)
		{
			files = files.concat(application.files);
		});

		if(manifest.sass)
		{
			if(!manifest.sass.files)
			{
				cb(new gutil.PluginError('gulp validate', 'Sass section of the manifest needs an array of files.'));
				return;
			}

			if(!manifest.sass.entry_points || !_.keys(manifest.sass.entry_points).length)
			{
				cb(new gutil.PluginError('gulp validate', 'Sass section of the manifest needs an entry point declaration section.'));
				return;
			}
			
			for(var sass_index in manifest.sass.entry_points)
			{
				var sass_entry_point = manifest.sass.entry_points[sass_index];
				
				if(!_.contains(manifest.sass.files, sass_entry_point))
				{
					cb(new gutil.PluginError('gulp validate', 'Sass files section does not include the entry point ' + sass_entry_point));
					return;
				}
			}

			files = files.concat(manifest.sass.files);
		}
		
		if(manifest.assets)
		{
			_.each(manifest.assets, function(asset_files)
			{
				asset_files.files = _.map(asset_files.files, function(file_path)
				{
					return 'assets/' + file_path;
				});

				files = files.concat(asset_files.files);
			});
		}
		
		if(manifest.type !== 'theme')
		{
			if(manifest.javascript)
			{
				if(!manifest.javascript.entry_points || !_.keys(manifest.javascript.entry_points).length)
				{
					cb(new gutil.PluginError('gulp validate', 'JavaScript section of the manifest needs an entry point declaration section.'));
					return;
				}
				
				if(!manifest.javascript.application)
				{
					cb(new gutil.PluginError('gulp validate', 'JavaScript section of the manifest needs a application declaration section.'));
					return;
				}
				
				for(var js_app in manifest.javascript.entry_points)
				{
					var js_entry_point = manifest.javascript.entry_points[js_app];
					
					if(!manifest.javascript.application[js_app] || !manifest.javascript.application[js_app].files)
					{
						cb(new gutil.PluginError('gulp validate', 'JavaScript section of the manifest needs a files declaration section for the application ' + js_app));
						return;
					}
					
					if(!_.contains(manifest.javascript.application[js_app].files, js_entry_point))
					{
						cb(new gutil.PluginError('gulp validate', 'JavaScript ' + js_app + ' files section does not include the entry point ' + js_entry_point));
						return;
					}
				}
				
				_.each(manifest.javascript.application, function(application)
				{
					files = files.concat(application.files);
				});
			}
			
			if(manifest['ssp-libraries'])
			{
				if(!manifest['ssp-libraries'].entry_point)
				{
					cb(new gutil.PluginError('gulp validate', 'Ssp-libraries section of the manifest needs an entry point declaration.'));
					return;
				}

				if(!manifest['ssp-libraries'].files)
				{
					cb(new gutil.PluginError('gulp validate', 'Ssp-libraries section of the manifest needs a files declaration section.'));
					return;
				}
				
				if(!_.contains(manifest['ssp-libraries'].files, manifest['ssp-libraries'].entry_point))
				{
					cb(new gutil.PluginError('gulp validate', 'Ssp-libraries files section does not include the entry point ' + manifest['ssp-libraries'].entry_point));
					return;
				}

				files = files.concat(manifest['ssp-libraries'].files);
			}
			
			if(manifest.configuration)
			{
				if(!manifest.configuration.files)
				{
					cb(new gutil.PluginError('gulp validate', 'Configuration section of the manifest needs an array of files.'));
					return;
				}
				
				files = files.concat(manifest.configuration.files);
			}
			
		}

		files = _.map(files, function(file_path)
		{
			return path.join(manifest.local_folder, file_path);
		});

		var errors = [];

		_.each(files, function(file_path)
		{
			if(!fs.existsSync(file_path))
			{
				errors.push(file_path + ' does not exists.');
			}
		});

		if(errors.length)
		{
			cb(new gutil.PluginError('gulp validate', '\nThe following errors were found in the ' + manifest_path + ' file:\n' + errors.join('\n')));
			return;
		}
		
		gutil.log(gutil.colors.green('Check ' + manifest_path + ' file paths ok'));
	}

	cb();
}


gulp.task('validate'
	,	'Validates the manifest file.'
	,	[]
	, validate);

gulp.task('update-validate', ['update-manifest'], validate);

module.exports = {
	validate: validate
};