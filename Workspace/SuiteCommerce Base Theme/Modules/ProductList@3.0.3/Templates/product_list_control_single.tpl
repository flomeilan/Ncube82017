{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-list-control-single">
	<button class="product-list-control-single-button-wishlist" data-type="add-product-to-single-list" {{#if isProductAlreadyAdded}}disabled{{/if}} data-action="add-product-to-single-list" type="button">
		{{#if isProductAlreadyAdded}}
			{{translate 'Added to Wishlist'}}
		{{else}}
			{{translate 'Add to Wishlist'}}
		{{/if}}
	</button>
	<div data-confirm-message class="product-list-control-single-confirm-message"></div>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
