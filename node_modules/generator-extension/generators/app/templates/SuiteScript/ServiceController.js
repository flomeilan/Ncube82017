
define(
	'<%= module_name %>.ServiceController'
,	[
		'ServiceController'
	,	'SC.Models.Init'
	,	'<%= module_name %>.Model'
	]
,	function(
		ServiceController
	,	ModelsInit
	,	<%= module_dep_name %>Model
	)
	{
		'use strict';

		return ServiceController.extend({

			name: '<%= module_name %>.ServiceController'

			// The values in this object are the validation needed for the current service.
			// Can have values for all the request methods ('common' values) and specific for each one.
		,	options: {
				common: {
					requireLoggedInPPS: true
				}
			}

		,	get: function get()
			{
				return <%= module_dep_name %>Model.get();
			}

		,	post: function post()
			{
				return <%= module_dep_name %>Model.create(this.data);
			}

		,	put: function put()
			{
				return <%= module_dep_name %>Model.update(this.data);
			}
			
		,	delete: function()
			{
				var id = this.request.getParameter('internalid');
          		return <%= module_dep_name %>Model.remove(id);
			}
		});
	}
);