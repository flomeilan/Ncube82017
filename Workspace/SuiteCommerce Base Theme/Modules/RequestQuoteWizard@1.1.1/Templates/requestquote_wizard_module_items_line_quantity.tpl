{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="requestquote-wizard-module-items-line-quantity-qty">
	<form action="#" class="requestquote-wizard-module-items-line-quantity-qty-form" data-action="update-quantity" data-validation="control-group">
		<input type="hidden" name="internalid" id="update-internalid-{{lineId}}" class="update-internalid-{{lineId}}" value="{{lineId}}">
		<label for="quantity-{{lineId}}" data-validation="control">
			{{#if showQuantity}}
				<input type="hidden" name="quantity" id="quantity-{{lineId}}" value="1">
			{{else}}
				<div class="requestquote-wizard-module-items-line-quantity-container-qty">
					<label class="requestquote-wizard-module-items-line-quantity-label-qty">{{translate 'Quantity:'}}</label>
					<div class="requestquote-wizard-module-items-line-quantity-input-qty">
						<button type="button" class="requestquote-wizard-module-items-line-quantity-remove" data-action="minus" {{#if isMinusButtonDisabled}}disabled{{/if}}>-</button>
						<input data-type="quantity-input" type="number" name="quantity" id="quantity-{{lineId}}" class="requestquote-wizard-module-items-line-quantity-value quantity-{{lineId}}" value="{{model.quantity}}" min="{{minimumQuantity}}"/>
						<button type="button" class="requestquote-wizard-module-items-line-quantity-add" data-action="plus">+</button>
					</div>
					{{#if showMinimumQuantity}}
						<small class="requestquote-wizard-module-items-line-quantity-title-help">
							{{translate 'Minimum of $(0) required' minimumQuantity}}
						</small>
					{{/if}}
					<div data-view="Quantity.Pricing"></div>
				</div>
			{{/if}}
			<div data-type="alert-placeholder"></div>
		</label>
	</form>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.item (Object)
	model.item.internalid (Number)
	model.quantity (Number)
	model.internalid (String)
	model.options (Array)
	model.options.0 (Object)
	model.options.0.cartOptionId (String)
	model.options.0.itemOptionId (String)
	model.options.0.label (String)
	model.options.0.type (String)
	model.options.0.value (Object)
	model.options.0.value.internalid (String)
	model.options.0.value.label (String)
	model.location (String)
	model.fulfillmentChoice (String)
	lineId (String)
	isMinusButtonDisabled (Boolean)
	showMinimumQuantity (Boolean)
	minimumQuantity (Number)

----}}
