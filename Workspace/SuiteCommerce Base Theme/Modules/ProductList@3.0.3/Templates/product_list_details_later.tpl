{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-list-details-later">
	<button class="product-list-details-later-button-saveforlater-pusher" data-type="sc-pusher" data-target="cart-save-for-later">
		{{translate 'Saved for Later'}} <i></i>
	</button>
	<div class="product-list-details-later-row" data-action="pushable" data-id="cart-save-for-later">
		<div class="product-list-details-later-col">
			<h3 class="product-list-details-later-list-header-title">
				{{translate 'Saved for Later'}}
				<small class="product-list-details-later-shopping-cart-title-details-count">
					{{#if isEmpty}}
						{{translate 'No products yet'}}
					{{else}}
						{{#if hasMoreThanOneItem}}
							{{translate '$(0) Products' itemsLength}}
						{{else}}
							{{translate '$(0) Product' itemsLength}}
						{{/if}}
					{{/if}}
				</small>
			</h3>
			
			<div data-confirm-message class="product-list-details-later-confirm-message"></div>
			
			{{#if hasItems}}
				<div class="product-list-details-later-explanation">
					{{translate 'To buy an item now, click "Move to Cart"'}}
				</div>
				<div class="product-list-details-later-list-items" data-type="product-list-items">
					<div data-view="ProductList.DetailsLater.Collection"></div>
				</div>
			{{else}}
				<div class="product-list-details-later-header-no-items">
					{{translate 'You don\'t have items in this list yet.'}}
				</div>
			{{/if}}
		</div>
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	itemsLength (Number)
	hasItems (Boolean)
	isEmpty (Boolean)
	hasMoreThanOneItem (Boolean)

----}}
