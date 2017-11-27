// Edit View, it will allow to list, edit and add todo tasks
// depending on the mode

define('<%= module_name %>.Edit.View'
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

	return Backbone.View.extend({

		template: <%= tpl_dep_name %>_tpl

	,	initialize: function (options)
		{
			var self = this;
			this.options = options;
			this.model = options.model;
			this.list = options.collection;
			this.mode = options.mode;
			this.can_edit = options.can_edit;

			BackboneFormView.add(this);

			this.model.on('change', function()
			{
				if(self.mode === 'add')
				{
					self.list.add(self.model);
				}
				else
				{
					self.mode = 'list';
					self.render();
				}
				
			});
		}

	,	events: {
			'click [data-action="edit"]': 'editMode'
		,	'change [name="completed"]': 'markCompleted'
		,	'submit form': 'saveForm'
		}

	,	bindings: {
			'[name="title"]': 'title'
		,	'[name="completed"]': 'completed'
		}

	, 	childViews: {
			
		}

	,	editMode: function editMode()
		{
			this.mode = 'edit';
			this.render();
		}

	,	markCompleted: function markCompleted(e)
		{
			var completed = jQuery(e.target).is(':checked');
			this.model.set('completed', completed);
			this.model.save();
		}

	,	getContext: function getContext()
		{
			return {
				id: this.model.id
			,	title: this.model.get('title')
			,	completed: this.model.get('completed')
			,	can_edit: this.can_edit

			,	add_mode: this.mode === 'add'
			,	edit_mode: this.mode === 'edit'
			,	list_mode: this.mode === 'list'
			};
		}
	});
});