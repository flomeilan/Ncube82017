// @module <%= module_name %>

// An example cct that shows a message with the price, using the context data from the item
// it also links to a complete TODO list example, for you to check how to make CRUD operations

// Use: Utils.getAbsoluteUrl(getExtensionAssetsPath('services/service.ss')) 
// to reference services or images available in your extension assets folder

define(
	'<%= module_name %>'
,   [
		'<%= module_name %>.View'
	,	'<%= module_name %>.Router'
	]
,   function (
		<%= module_dep_name%>View
	,	<%= module_dep_name%>Router
	)
{
	'use strict';

	return  {
		mountToApp: function mountToApp (container)
		{
			container.getComponent('CMS').registerCustomContentType({
				
				// this property value MUST be lowercase
				id: '<%= cct_id %>'
				
				// The view to render the CCT
			,	view: <%= module_dep_name%>View
			});

			new <%= module_dep_name%>Router(container);
		}
	};
});