// <%= module_name %>View, this is the view your cct
// will load after dragged into the application

define('<%= module_name %>.View'
,	[
		'CustomContentType.Base.View'

	,	'<%= tpl_name %>.tpl'

	,	'jQuery'
	,	'underscore'
	]
,	function (
		CustomContentTypeBaseView

	,	<%= tpl_dep_name %>_tpl

	,	jQuery
	,	_
	)
{
	'use strict';

	return CustomContentTypeBaseView.extend({

		template: <%= tpl_dep_name %>_tpl

		// As an example of the 'install' method, we are going to emulate a fetch to a service with the setTimeout
		// Until the promise is resolved, you won't be able to edit the settings of this CCT
		// The same could happen with the 'update' method
	,	install: function (settings, context_data)
		{
			this._install(settings, context_data);

			// call some ajax here
			
			var promise = jQuery.Deferred();
			return promise.resolve();
		}

		// The list of contexts that you may need to run the CCT
		// These are all the context data you have available by default depending on where you dropped the cct
	,	contextDataRequest: ['item']

		// By default when you drop a CCT in the SMT admin, it will run the 'validateContextDataRequest' method to check that you have
		// all the requested contexts and it will fail if some context is missing.
		// We will override the 'validateContextDataRequest' method to return always true
		// since I want to run the CCT even if I don't have an 'item' or the rest of the context data
	,	validateContextDataRequest: function validateContextDataRequest()
		{
			return true;
		}

	,	getContext: function getContext()
		{
			var text = 'Awesome price, only for today';

			//example of how to access context data from the item
			if (this.contextData.item)
			{
				var item = this.contextData.item();

				text += ' at $' + item.get('_price') + '!!';
			}

			// if you would want to get the settings from the SMT Panel you would consult
			// var field_value = this.settings.custrecord_<id of the custom field in the cct record>

			return {
				promotion_text: text
			};
		}
	});
});