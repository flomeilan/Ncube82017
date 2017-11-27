{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-msr-package-creation-edit-quantity-column" data-validation="control-group">
{{#if isReadOnly}}
	<p>
	<span class="order-wizard-msr-package-creation-edit-quantity-label">
		{{translate 'Quantity:' }}
	</span>
	<span class="order-wizard-msr-package-creation-edit-quantity-value">
		{{ totalQuantity }}
	</span>
	</p>
{{else}}
	<span class="order-wizard-msr-package-creation-edit-quantity-label">
		{{translate 'Quantity:'}}
	</span>

	<div class="order-wizard-msr-package-creation-edit-quantity-editable" data-validation="control">
		<button class="order-wizard-msr-package-creation-edit-quantity-input-remove" data-action="sub-quantity">-</button>
		<input type="number" name="quantity" data-item-id="{{itemId}}" id="quantity-{{itemId}}" data-action="split-quantity" class="order-wizard-msr-package-creation-edit-quantity-item-editable-quantity-normal" value="{{selectedQuantity}}" min="{{minQuantity}}" max="{{totalQuantity}}">
		<button class="order-wizard-msr-package-creation-edit-quantity-input-add" data-action="add-quantity">+</button>
	</div>
{{/if}}
{{#if showMinimumQuantity}}
	<small class="order-wizard-msr-package-creation-edit-quantity-quantity-help">
		{{translate '(Minimum of $(0) required)' minQuantity}}
	</small>
	<p class="order-wizard-msr-package-creation-edit-quantity-error-message" data-validation="error-placeholder"></p>
{{/if}}
</div>



{{!----
Use the following context variables when customizing this template:

	totalQuantityGreaterThan1 (Boolean)
	totalQuantity (Number)
	isReadOnly (Boolean)
	itemId (Number)
	selectedQuantity (Number)
	isDesktop (Boolean)
	showMinimumQuantity (Boolean)
	minQuantity (Number)

----}}