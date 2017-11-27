// @module module_dep_name
define('<%= module_name %>.Router'
,	[
		'<%= module_name %>.List.View'
	,	'<%= module_name %>.Edit.View'
	,	'<%= module_name %>.Collection'
	,	'<%= module_name %>.Model'
	,	'Backbone'
	]
,	function (
		<%= module_dep_name %>ListView
	,	<%= module_dep_name %>EditView
	,	<%= module_dep_name %>Collection
	,	<%= module_dep_name %>Model
	,	Backbone
	)
{
	'use strict';

	//@class <%= module_name %>.Router @extend Backbone.Router
	return Backbone.Router.extend({

		routes: {
			'test_extension': 'show<%= module_dep_name %>'
		,	'test_extension/new': 'add<%= module_dep_name %>'
		,	'test_extension/:id': 'edit<%= module_dep_name %>'
		}

	,	initialize: function (application)
		{
			this.application = application;
		}

	,	show<%= module_dep_name %>: function show<%= module_dep_name %>()
		{
			this.collection = new <%= module_dep_name %>Collection();
			
			var view = new <%= module_dep_name %>ListView({
				collection: this.collection
			,	application: this.application
			,	mode: 'list'
			,	can_edit: true
			});

			view.showContent();

			this.collection
			.fetch();
		}

	,	add<%= module_dep_name %>: function add<%= module_dep_name %>()
		{
			var model = new <%= module_dep_name %>Model();

			var view = new <%= module_dep_name %>EditView({
				application: this.application
			,	collection: this.collection
			,	model: model
			,	mode: 'add'
			});

			view.showContent();
		}

	,	edit<%= module_dep_name %>: function edit<%= module_dep_name %>(id)
		{
			var model = this.collection.get(id);

			var view = new <%= module_dep_name %>EditView({
				application: this.application
			,	collection: this.collection
			,	model: model
			,	mode: 'edit'
			});

			view.showContent();
		}
	});
});
