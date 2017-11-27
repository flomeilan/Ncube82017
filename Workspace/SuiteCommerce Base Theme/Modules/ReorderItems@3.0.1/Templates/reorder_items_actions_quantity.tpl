{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="reorder-items-actions-quantity">
	{{#if showQuantityInput}}
		<label class="reorder-items-actions-quantity-label">{{translate 'Quantity:'}}</label>
		<div class="reorder-items-actions-quantity-input">
			<button class="reorder-items-actions-quantity-remove" data-action="minus">-</button>
				<input type="number" name="item_quantity" data-line-id="{{lineId}}" value="{{itemQuantity}}" class="reorder-items-actions-quantity-value" min="{{minimumQuantity}}">
			<button class="reorder-items-actions-quantity-add" data-action="plus">+</button>
		</div>
	{{else}}
		<div data-view="Item.Stock"></div>
	{{/if}}
</div>
<div data-view="Quantity.Pricing"></div>
{{#if showLastPurchased}}
	<p class="reorder-items-actions-quantity-last-purchased">{{translate 'Last purchased on $(0)' line.trandate}}</p>
{{/if}}

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
