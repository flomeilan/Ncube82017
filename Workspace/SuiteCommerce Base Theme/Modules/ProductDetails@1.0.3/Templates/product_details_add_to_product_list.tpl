{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if isLoading}}
	<div class="product-details-add-to-product-list-loading">
		{{translate 'Loading List...'}}
	</div>
{{else}}
	<div data-view="ProductListControl"></div>
{{/if}}



{{!----
Use the following context variables when customizing this template: 
	
	isLoading (Boolean)

----}}
