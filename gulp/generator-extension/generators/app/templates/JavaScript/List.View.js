// List View, it will create as child view a collection of Edit Views.

define('<%= module_name %>.List.View'
,	[
		'<%= module_name %>.Edit.View'
	,	'Backbone.CollectionView'
		
	,	'<%= tpl_name %>.tpl'

	,	'Backbone'
	,	'jQuery'
	,	'underscore'
	]
,	function (
		<%= module_dep_name%>EditView
	,	BackboneCollectionView

	,	<%= tpl_dep_name %>_tpl

	,	Backbone
	,	jQuery
	,	_
	)
{
	'use strict';

	return Backbone.View.extend({

		template: <%= tpl_dep_name %>_tpl

	,	title: _('<%= extension_name %>').translate()

	,	events: {
			'click [data-action="remove"]': 'remove<%= module_dep_name%>'
		}

	,	initialize: function (options)
		{
			var self = this;
			this.collection.get();
			this.loading = true;
			this.can_edit = options.can_edit;

			this.collection.on('reset sync add remove change destroy', function ()
			{
				self.loading = false;
				self.render();
			});
		}

	,	childViews: {
			'<%= module_dep_name%>.Collection': function ()
			{
				return new BackboneCollectionView(
				{
					childView: <%= module_dep_name%>EditView
				,	collection: this.collection
				,	childViewOptions: {
						mode: 'list'
					,	can_edit: this.can_edit
					}
				});
			}
		}

	,	remove<%= module_dep_name%>: function remove<%= module_dep_name%>(e)
		{
			var id = jQuery(e.target).data('id');
			this.collection.get(id).destroy({ wait: true });
		}

	,	getContext: function getContext()
		{
			return {
				loading: this.loading
			,	can_edit: this.can_edit
			};
		}
	});
});