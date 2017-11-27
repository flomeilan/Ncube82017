{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="store-locator-list-all-main">
	<h2>Store List</h2>

	{{#if showList}}
		<ul data-view="StoreLocatorListAllStoreView" class="store-locator-list-all-container"></ul>
		<div data-view="GlobalViews.Pagination"></div>
	{{else}}
		<div class="store-locator-list-all-container">
			<p>{{translate 'The list of stores is not available.'}}</p>
		</div>
	{{/if}}
</div>



{{!----
Use the following context variables when customizing this template: 
	
	showList (Boolean)

----}}
