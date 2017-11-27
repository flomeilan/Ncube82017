{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-list-added-to-cart-modal-body">
	<span data-warning-message class="product-list-added-to-cart-warning-message"></span>
	{{#unless isItem}}
	<p class="product-list-added-to-cart-message">
		{{#if hasMoreThanOneModel}}
			{{translate '<span class="product-list-added-to-cart-list-from">From: </span> <span class="product-list-added-to-cart-list-name">$(0)</span> product list ($(1) items)' listName modelsLength}}
		{{else}}
			{{translate '<span class="product-list-added-to-cart-list-from">From </span> <span class="product-list-added-to-cart-list-name">$(0)</span> product list ($(1) item)' listName modelsLength}}
		{{/if}}
	</p>
	{{/unless}}
	<div class="product-list-added-to-cart-list">
		<table class="product-list-added-to-cart-table">
			<tbody data-view="ProductList.ItemsAddedToCart"></tbody>
		</table>
	</div>
</div>
<div class="product-list-added-to-cart-modal-footer">
	<a class="product-list-added-to-cart-button-viewcart" data-touchpoint="viewcart">{{translate 'View Cart &amp; Checkout'}}</a>
	<a class="product-list-added-to-cart-button-back" data-dismiss="modal" >{{translate 'Back to product list'}}</a>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	isItem (Boolean)
	hasMoreThanOneModel (Boolean)
	listName (String)
	modelsLength (Number)

----}}
