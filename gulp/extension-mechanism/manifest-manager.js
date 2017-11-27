'use strict';

var fs = require('fs')
,	gutil = require('gulp-util')
,	nconf = require('nconf')
,	map = require('map-stream')
,	path = require('path')
,	_ = require('underscore')
;


module.exports = {

	addManifest: function(manifestPath)
	{
		if(!fs.existsSync(manifestPath))
		{
			throw new Error('Manifest ' + manifestPath + ' does not exists');
		}
		
		var manifest = JSON.parse(fs.readFileSync(manifestPath).toString());
		manifest.local_folder = path.parse(manifestPath).dir;
		
		this.manifests = this.manifests || [];
		this.manifests.push(manifest);
		
		this.manifests = _.sortBy(this.manifests, function(manifest)
		{
			//TODO add priority un gulp fetch
			return manifest.type && manifest.type === 'theme' ? -1 : 0;
		});
	}

,	updateManifest: function updateManifest(manifestPath)
	{
		if(!fs.existsSync(manifestPath))
		{
			throw new Error('Manifest ' + manifestPath + ' does not exists');
		}
		
		var updated_manifest = JSON.parse(fs.readFileSync(manifestPath).toString());
		updated_manifest.local_folder = path.parse(manifestPath).dir;
		
		this.manifests = this.manifests || [];

		_.each(this.manifests, function(manifest)
		{
			if(manifest.name === updated_manifest.name &&
				manifest.vendor === updated_manifest.vendor)
			{
				manifest = updated_manifest;
			}
		});

		return updated_manifest;
	}

,	findManifest: function findManifest(file_path)
	{
		return _.find(this.manifests, function(manifest)
		{
			var manifest_name_regex = new RegExp(nconf.get('folders:source:source_path') + '\/([^\/]*)\/')
			,	manifest_path = file_path.match(manifest_name_regex) && file_path.match(manifest_name_regex)[1];
			
			return (manifest_path && manifest_path === manifest.name) ||
				 (manifest_path && manifest_path === manifest.name.replace(/[^\w\-\_@0-9]/gi, ''));
		});
	}

,	getExtensionManifests: function getExtensionManifests()
	{
		var manifests = _.where(this.manifests || [], { type: 'extension'});
		return manifests;
	}
	
,	getManifestByName: function getManifestByName(name)
	{
		var manifest = _.findWhere(this.manifests || [], {'name': name});
		return manifest;
	}
	
,	getThemeManifest: function getThemeManifest()
	{
		var theme_manifest = _.where(this.manifests || [], {'type': 'theme'});

		if(!theme_manifest || theme_manifest.length !== 1)
		{
			throw new Error('Theme not found');
		}
		return _.first(theme_manifest);
	}
	
,	getActivationId: function getActivationId()
	{
		var first_manifest = _.first(this.manifests || []);
		return first_manifest ? first_manifest.activation_id : null;
	}
	
,	handleOverrides: function handleOverrides(){
		var theme_manifest = this.getThemeManifest();
		var overrides = theme_manifest.override;

		var theme_folder = path.resolve(nconf.get('folders:theme_path'))
		,	base_path = path.resolve(nconf.get('folders:source:source_path'))
		,	extensions_folder = path.resolve(nconf.get('folders:source:extras_path'))
		;

		if(nconf.get('extensionMode'))
		{
			extensions_folder = base_path;
		}

		return map(function(file, cb)
		{
			var is_source = _.find(overrides, function(override)
			{
				return path.join(theme_folder, override.src) === file.path;
			});
			
			if(is_source)
			{
				cb();
			}
			else
			{
				var is_dst = _.find(overrides, function(override)
				{
					return path.join(extensions_folder, override.dst) === file.path;
				});
				
				if(is_dst)
				{
					var src_file = path.join(theme_folder, is_dst.src);

					gutil.log(gutil.colors.yellow('Overriding... ') + path.relative(base_path, file.path) + '\n\t\t' + gutil.colors.yellow('with ') + path.relative(base_path, src_file));
					
					file.contents = new Buffer(fs.readFileSync(src_file));
				}
				
				cb(null, file);
			}
			
		});
	}

	// sass
,	getSassBasicEntryPoints: function getSassBasicEntryPoints()
	{
		var self = this;
		var files = [];
		
		_.each(this.manifests, function(manifest)
		{
			if(manifest.sass)
			{
				_.each(manifest.sass.entry_points, function(entry_points)
				{
					var folder = !_.isEmpty(manifest.sass.folder) ? path.join(manifest.name, manifest.sass.folder) : manifest.name;

					files = files.concat(self._absolutize([entry_points], folder, true));
				});
			}
		});
		
		return files;
	}

,	getSassEntryPoints: function getSassEntryPoints()
	{
		var self = this;
		var files = {};
		
		_.each(this.manifests, function(manifest)
		{
			if(manifest.sass)
			{
				_.each(manifest.sass.entry_points, function(entry_points, app)
				{
					var folder = !_.isEmpty(manifest.sass.folder) ? path.join(manifest.name, manifest.sass.folder) : manifest.name;
					files[app] = files[app] || [];
					files[app] = files[app].concat(self._absolutize([entry_points], folder, true));
				});
			}
		});
		
		var meta_entry_points = {};
		_.each(files, function(entry_points, app)
		{
			var meta_entry_point = '';
			_.each(entry_points, function(entry_point)
			{
				var file_path = path.parse(entry_point).dir;
				var file_name = path.basename(entry_point, '.scss');
				
				meta_entry_point += '@import "' + path.join('tmp', file_path, file_name).replace(/\\/g, '/') + '"; ';	
			});
			
			meta_entry_points[app] = meta_entry_point;
		});
		
		return meta_entry_points;
	}

,	_absolutize: function _absolutize(files, local_folder, absolute)
	{
		if(absolute)
		{
			files = files.map((file)=>
			{
				return path.join(local_folder, file);
			});
		}
		return files;
	}

	// templates
,	getApplicationTemplates: function getApplicationTemplates(application, absolute)
	{
		var self = this;
		var files = _.map(this.manifests, function(manifest){
			try
			{			
				var tpl_files = manifest.templates.application[application].files;
				var folder = !_.isEmpty(manifest.templates.folder) ? path.join(manifest.local_folder, manifest.templates.folder) : manifest.local_folder;
				
				var file_pahts = self._absolutize(tpl_files || [], folder, absolute);
				
				_.each(file_pahts, function(file_path)
				{
					self.templates_extension = self.templates_extension || {};
					self.templates_extension[path.resolve(file_path)] = [
							'extensions'
						,	manifest.vendor
						,	manifest.name
						,	manifest.version
						,	''].join('/');
				});
				
				return file_pahts;
			}
			catch(error)
			{
				return [];
			}
		});
		files = _.union.apply(_, files);
		
		return files;
	}

,	getTemplateExtensionPath: function getTemplateExtensionPath(tpl_path)
	{
		this.templates_extension = this.templates_extension || {};
		
		tpl_path = tpl_path.replace(/\.js$/, '.tpl');
		return this.templates_extension[tpl_path];
	}

,	getTemplateApplications: function getTemplateApplications()
	{
		var theme_manifest = this.getThemeManifest();
		return _.keys(theme_manifest.templates.application);
	}

,	getJsFilesForManifest: function getJsFilesForManifest(manifest_name)
	{
		var manifest = _.where(this.manifests || [], { type: 'extension', name: manifest_name});

		if(!manifest || manifest.length !== 1)
		{
			throw new Error('Manifest for ' + manifest_name + ' not found or several manifests found.');
		}

		manifest = _.first(manifest);
		var app_manifest = nconf.get('application:application_manifest');

		if(!app_manifest)
		{
			throw new Error('No Application Manifest found to get valid applications');
		}

		var entry_points = app_manifest.application
		, js_files = []
		;

		_.each(entry_points, function(application)
		{
			if(manifest.javascript && manifest.javascript.application && manifest.javascript.application[application])
			{
				js_files = js_files.concat(manifest.javascript.application[application].files);
			}
		});

		return js_files;
	}

,	getAssetFilesForManifest: function getAssetFilesForManifest(manifest_name)
	{
		var manifest = _.where(this.manifests || [], { name: manifest_name});

		if(!manifest || manifest.length !== 1)
		{
			throw new Error('Manifest for ' + manifest_name + ' not found or several manifests found.');
		}

		manifest = _.first(manifest);
		var assets_files = [];

		_.each(manifest.assets || [], function(asset_obj, key)
		{
			if(asset_obj.files.length)
			{
				var key_files = _.each(asset_obj.files || [], function(file)
				{
					return 'assets/ ' + file;
				});

				assets_files = assets_files.concat(key_files);
			}
			
			
		});

		return assets_files;
	}
};