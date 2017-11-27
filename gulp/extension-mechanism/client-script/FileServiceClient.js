
'use strict';

var RequestHelper = require('./RequestHelper')
,	_ = require('underscore')
;

var FileServiceClient = (function(){

	var createFoldersEnds = function createFoldersEnds(folders)
	{
		var ready = true;
		_.each(folders || {}, function(folder)
		{
			if(!_.isUndefined(folder.folder_id))
			{
				ready = _.isEmpty(folder.sub_folders) ? true : createFoldersEnds(folder.sub_folders);
			}
			else
			{
				ready = false;
			}
			
			if(!ready)
			{
				return false;
			}
		});
		
		return ready;
	};

	var cached_files = {};

	var file_service_client =  {

		PAGE_SIZE: 20
		
	,	REQUEST_TIMEOUT: 120

	,	clearCache: function clearCache()
		{
			cached_files = {};
		}

	,	writeFiles: function writeFiles(url, files)
		{
			var self = this;

			var options = {
				url: url
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'POST'
			,	data: JSON.stringify(files)
			};

			return RequestHelper.request(options);
		}

	,	createFolders: function createFolders(url, folders)
		{
			var self = this;
			var options = {
				url: url
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'POST'
			,	data: JSON.stringify({
					folders: folders
				,	operation: 'create_folders'
				})
			};

			return RequestHelper.request(options).then(
				function(result)
				{
					if(result.header.status.code !== 'SUCCESS')
					{
					   return Promise.reject(result.header.status.message);
					}
					
					var folders = result.result.folders;
					//If not all the folders were created because of governance, call again
					//using as input the outcome of the previous call.
					//The process will only create those folders without folder_id
					if(!createFoldersEnds(folders.sub_folders))
					{
						return self.createFolders(url, folders);   
					}
					
					return folders;
				}
			);
		}

	,	createFolder: function createFolder(url, folder_name, parent_id)
		{
			var self = this;
			var options = {
				url: url
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'POST'
			,	data: JSON.stringify({
					folder_name: folder_name
				,	parent_id: parent_id
				,	operation: 'create_folder'
				})
			};
			
			return RequestHelper.request(options);
		}

	,	getFolder: function getFolder(url, folder_id)
		{
			var self = this;

			var options = {
				url: url + '&operation=get_folder&folder=' + folder_id
			,	timeout: self.REQUEST_TIMEOUT
			,	method: 'GET'
			,	data: null
			};

			return RequestHelper.request(options);
		}
		
	,	getPages: function getPages(files)
		{
			var paged_files = [];

			if(!_.isArray(files))
			{
				throw new Error('Files must be a valid array of paths or files id');
			}

			for(var i = 0; i < files.length; i += this.PAGE_SIZE)
			{
				paged_files.push(files.slice(i, i + this.PAGE_SIZE));
			}
			
			return paged_files;
		}

	,	getFiles: function getFiles(url, files, optional_files)
		{
			var self = this
			,	result_promise;

			try
			{
				var paged_files = this.getPages(files);

				var promises = _.map(paged_files, function(files)
				{
					var get_files = []
					,	cached_page_files = new Array(files.length)
					,	get_files_index = [];

					_.each(files, function(file, i)
					{
						if(cached_files[file])
						{
							cached_page_files[i] = cached_files[file];
						}
						else
						{
							get_files.push(file);
							get_files_index.push(i);
						}
					});

					var get_page_promise;

					if(get_files.length)
					{
						var optional = optional_files && _.isArray(optional_files) ? optional_files : [];

						var options = {
							url: url
						,	timeout: self.REQUEST_TIMEOUT
						,	method: 'POST'
						,	data: JSON.stringify({
								operation: 'get_files'
							,	files: get_files
							,	optional: optional
							})
						};

						get_page_promise = RequestHelper.request(options);
					}
					else
					{
						get_page_promise = Promise.resolve();
					}

					return get_page_promise
						.then(
							function getPageDone(response)
							{
								var files = response && response.result ? response.result.files || [] : [];

								//optional files were sent so we need to reconcile results with the cached page files
								if(get_files.length !== files.length)
								{
									var file_obj = _.indexBy(files, 'file');
									var index_to_remove = [];

									_.each(get_files, function(file_requested, i)
										{
											if(!file_obj[file_requested])
											{
												index_to_remove.push(i);
											}
										}
									);

									//remove all the indexes that correspond to optional files not found
									get_files_index = _.reject(get_files_index, function(elem, i){ return index_to_remove.indexOf(i) >= 0; });
								}

								//reconstruct page with the cached files also
								_.each(files, function(file, i)
								{
									var file_index = get_files_index[i];
									cached_page_files[file_index] = file;

									if(!cached_files[file.file])
									{
										cached_files[file.file] = file;
									}
								});

								//remove optional files not found
								cached_page_files = _.reject(cached_page_files, function(file){ return _.isUndefined(file); });
								
								return cached_page_files;

							}
						);
				});

				result_promise = Promise.all(promises)
					.then(
						function getAllPagesDone(responses)
						{
							var downloaded_files = _.reduce(
								responses
							,	function concatPageFilesResult(files, response_files)
								{
									return files.concat(response_files);
								}
							,	[]
							);

							return downloaded_files;
						}
					);
				
				return result_promise;
			}
			catch(error)
			{
				return Promise.reject(error.message);
			}
		}
		
	,	copyFiles: function copyFiles(url, src_files, dst_names)
		{
			try
			{
				var self = this;
				src_files = this.getPages(src_files);
				dst_names = this.getPages(dst_names);
				
				var promises = _.map(src_files, function(src_page, index)
				{
					var options = {
						url: url
					,	method: 'PUT'
					,	timeout: self.REQUEST_TIMEOUT
					,	data: JSON.stringify({
							operation: 'copy'
						,	src_paths: src_page
						,	dst_names: dst_names[index]
						})
					};

					return RequestHelper.request(options);
				});
				
				return Promise.all(promises)
				.then(
					function(responses)
					{
						if(responses && responses.length > 0 && responses[0].header.status.code === 'SUCCESS')
						{
							return responses[0];
						}
					}
				);
			}
			catch(error)
			{
				return Promise.reject(error.message);
			}
			
		}
	
	,	moveFiles: function moveFiles(url, src_files, dst_names)
		{
			try
			{
				var self = this;	
				src_files = this.getPages(src_files);
				dst_names = this.getPages(dst_names);
				
				var promises = _.map(src_files, function(src_page, index)
				{
					var options = {
						url: url
					,	method: 'PUT'
					,	timeout: self.REQUEST_TIMEOUT
					,	data: JSON.stringify({
							operation: 'move'
						,	src_paths: src_page
						,	dst_names: dst_names[index]
						})
					};

					return RequestHelper.request(options);
				});
				
				return Promise.all(promises)
				.then(
					function(responses)
					{
						if(responses && responses.length > 0 && responses[0].header.status.code === 'SUCCESS')
						{
							return responses[0];
						}
					}
				);
			}
			catch(error)
			{
				return Promise.reject(error.message);
			}
			
		}
		
	};

	return {
		getInstance: function getInstance()
		{
			this.instance = this.instance || file_service_client;
			return this.instance;
		}
	};
})();

module.exports = FileServiceClient;