
define('<%= module_name %>.Model'
,	[
		'Backbone'
	,	'Utils'
	,	'underscore'
	]
,	function (
		Backbone
	,	Utils
	,	_
	)
{
	'use strict';

	var <%=module_dep_name%>Model = Backbone.Model.extend({

		urlRoot: Utils.getAbsoluteUrl(getExtensionAssetsPath('services/<%=module_dep_name%>.Service.ss'))

	,	validation: {
			title: {
				required: true
			,	msg: _('Valid task name is required').translate()
			}
		}

	,	defaults: {
			'title': ''
		,	'completed': false
		}

	,	initialize: function (options)
		{
			this.options = options;
		}
	});

	return <%= module_dep_name %>Model;
});