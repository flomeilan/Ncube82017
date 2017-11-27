// Collection of <%= module_name %>Model

define('<%= module_name %>.Collection'
,	[
		'<%= module_name %>.Model'

	,	'Utils'
	,	'Backbone'
	,	'underscore'
	]
,	function (
		<%= module_dep_name %>Model

	,	Utils
	,	Backbone
	,	_
	)
{
	'use strict';

	return Backbone.Collection.extend({

		url: Utils.getAbsoluteUrl(getExtensionAssetsPath('services/<%= module_dep_name %>.Service.ss'))
		
	,	model: <%= module_dep_name %>Model
	});
});