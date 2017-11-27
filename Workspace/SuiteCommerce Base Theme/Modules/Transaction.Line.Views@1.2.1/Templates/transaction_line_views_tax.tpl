{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showTax}}
<div class="transaction-line-views-tax">
	<span class="transaction-line-views-tax-label">{{translate 'Taxes:'}}</span>
	<span class="transaction-line-views-tax-amount-value">{{taxAmount}}</span>
	<span class="transaction-line-views-tax-rate-value">( {{taxRate}} )</span>
</div>
{{/if}}