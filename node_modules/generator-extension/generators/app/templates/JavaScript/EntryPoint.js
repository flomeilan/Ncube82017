// Entry point for javascript creates a router to handle new routes and adds a view inside the Product Details Page

define(
	'<%= module_name %>'
,   [
		'<%= module_name %>.List.View'
	,	'<%= module_name %>.Collection'
	,	'<%= module_name %>.Router'
	]
,   function (
		<%= module_dep_name%>ListView
	,	<%= module_dep_name%>Collection
	,	<%= module_dep_name%>Router
	)
{
	'use strict';

	return  {
		mountToApp: function mountToApp (container)
		{
			// create a model and instantate the router
			var collection = new <%= module_dep_name %>Collection();
			new <%=module_dep_name %>Router(container);

			// using the 'PDP' component we add a new child view inside the 'Product.Information' existing view 
			// (there will be an DOM element with the HTML attribute data-view="Product.Information")

			/** @type {ProductDetailsComponent} */
			var pdp = container.getComponent('PDP');
			
			if(pdp)
			{
				pdp.addChildViews(
					'ProductDetails.Full.View'
				,	{
						'Product.Information': {
							'<%= module_name %>.List.View':
							{
								childViewIndex: 5
							,	childViewConstructor: function()
								{
									collection.fetch();

									return new <%= module_dep_name%>ListView({
										collection: collection
									,	can_edit: false
									});
								}
							}
						}
					}
				);
			}

		}
	};
});
