{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div>
	{{#if showQuantity}}
		<div class="product-details-quantity-options" data-validation="control-group">
			<label for="quantity" class="product-details-quantity-options-title">
				{{translate 'Quantity'}}
			</label>

			<div data-validation="control">
				<div class="product-details-quantity-container">
					<button type="button" class="product-details-quantity-remove" data-action="updateQuantity" data-type="product-details-quantity-remove" data-value="-1" {{#if isMinusButtonDisabled}}disabled="disabled"{{/if}}>-</button>
				<input type="number" name="quantity" id="quantity" data-action="changeQuantity" class="product-details-quantity-value" value="{{model.quantity}}" min="1">
				<button  type="button" class="product-details-quantity-add" data-action="updateQuantity" data-value="+1">+</button>
			</div>
		</div>
		</div>
	{{else}}
		<input type="hidden" name="quantity" id="quantity" value="1">
	{{/if}}
</div>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.item (Object)
	model.item.internalid (Number)
	model.item.type (String)
	model.quantity (Number)
	model.options (Array)
	model.options.0 (Object)
	model.options.0.cartOptionId (String)
	model.options.0.itemOptionId (String)
	model.options.0.label (String)
	model.options.0.type (String)
	model.location (String)
	model.fulfillmentChoice (String)
	showQuantity (Boolean)
	isMinusButtonDisabled (Boolean)

----}}
