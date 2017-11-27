{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="product-list-lists-button-back">
		<i class="product-list-lists-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="product-list-lists">
	<div data-type="alert-placeholder" class="product-list-lists-message"></div>

	<header class="product-list-lists-header">
		<h2 class="product-list-lists-title">{{translate 'My Wishlist'}}</h2>
		{{#unless isSingleList}}
			<button class="product-list-lists-button-add" data-action="add-list">{{translate 'Create New List'}}</button>
		{{/unless}}
	</header>

	<!-- if the customer as no lists then we show a Create New List form (rendered in view.render()) -->
	{{#if hasLists}}
		<div class="product-list-lists-wrapper">
			<table class="product-list-lists-details">
				<tbody data-view="ProductList.ListDetails"></tbody>
			</table>
		</div>
	{{else}}
		<h4 class="product-list-lists-subtitle">{{translate 'Create a product list'}}</h4>
		<div data-type="new-product-list"></div>
	{{/if}}
</section>



{{!----
Use the following context variables when customizing this template: 
	
	hasLists (Number)
	showBackToAccount (Boolean)
	isSingleList (Boolean)

----}}
