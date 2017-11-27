// @module <%= module_name %>
define('<%= module_name %>.View'
,	[
		'<%= tpl_name %>.tpl'

	,	'Backbone.FormView'
	,	'Backbone'
	,	'jQuery'
	,	'underscore'
	]
,	function (
		<%= tpl_dep_name %>_tpl
	,	BackboneFormView
	,	Backbone
	,	jQuery
	,	_
	)
{
	'use strict';

	// @class <%= module_name %>.View @extends Backbone.View
	return Backbone.View.extend({

		template: <%= tpl_dep_name %>_tpl

	,	initialize: function (options)
		{
			this.options = options;
			this.model = options.model;
			BackboneFormView.add(this);
		}

	,	events: {
			'submit form': 'saveForm'
		}

	,	bindings: {
			'[name="message"]': 'message'
		,	'[name="result"]': 'result'
		}

	, 	childViews: {
			
		}

		//@method getContext @return <%= module_name %>.View.Context
	,	getContext: function getContext()
		{
			//@class <%= module_name %>.View.Context
			return {
				model: this.model
			};
		}
	});
});