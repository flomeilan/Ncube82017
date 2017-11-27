{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="receipt-details-item-summary">
	{{#unless isDiscountType}}
		<p>{{translate '<span class="receipt-details-item-summary-label">Quantity</span>: <span class="receipt-details-item-summary-quantity">$(0)</span>' quantity}}</p>
	{{/unless}}

	{{#if showAmount}}
		<p>
			<span>{{#if showAmountLabel}}{{line.amount_label}}{{else}}{{translate '<span class="receipt-details-item-summary-label">Amount</span>'}}: {{/if}}</span>
			{{#if hasDiscount}}
				<span class="receipt-details-item-summary-non-discounted-amount">
					{{#if showAmount}}{{amountFormatted}}{{else}}&nbsp;{{/if}}
				</span>
				<span class="receipt-details-item-summary-amount">
					{{#if showAmount}}{{totalFormatted}}{{else}}&nbsp;{{/if}}
				</span>
			{{else}}
				<span class="receipt-details-item-summary-amount">
					{{#if showAmount}}{{amountFormatted}}{{else}}&nbsp;{{/if}}
				</span>
			{{/if}}
		</p>
	{{/if}}
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
