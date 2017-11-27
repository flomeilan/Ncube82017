{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showActions}}
	<a 
		class="receipt-details-item-actions-reorder" 
		data-action="addToCart"
		data-line-id="{{line.internalid}}"
		data-item-id="{{itemId}}" 
		data-item-quantity="{{line.quantity}}"
		data-partial-quantity="{{line.partial_quantity}}" 
		data-parent-id="{{itemParentId}}" 
		data-item-options="{{lineFormatOptions}}">
		{{#if isQuantityGreaterThan1}}
			{{translate 'Reorder these Items'}}
		{{else}}
			{{translate 'Reorder this Item'}}
		{{/if}}
	</a>
{{/if}}

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
