{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<form class="cart-quickaddtocart" data-action="add-to-cart">
	<div data-view="ProductViewsPrice.Price" class="cart-quickaddtocart-price"></div>
	{{#if showQuickAddToCartButton}}
		<div data-view="AddToCart">
			<input name="quantity" data-action="setquantity" class="cart-quickaddtocart-quantity" type="number" min="{{minimumQuantity}}" value="{{quantity}}"/>
		</div>
	{{/if}}
</form>




{{!----
Use the following context variables when customizing this template: 
	
	itemId (Number)
	showQuickAddToCartButton (Boolean)
	minimumQuantity (Number)
	quantity (Number)

----}}
