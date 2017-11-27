{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<!-- Payment method nodes -->
{{#if firstChild}}
<h5 class="order-history-payments-method-title">
	{{translate 'Payment Method'}}
</h5>
{{/if}}
<div class="order-history-payments-info-cards-row">
	<div class="order-history-payments-info-cards-container">
		<div class="order-history-payments-info-cards" data-id="{{model.tranid}}">
			<div data-view="FormatPaymentMethod"></div>
			<p class="order-history-payments-info-card-amount-info">{{model.appliedtoforeignamount_formatted}}</p>
			<p class="order-history-payments-info-card-date-info">{{model.trandate}}</p>
			{{#if model.showLink}}
				{{translate '<span class="order-history-payments-label">$(2) </span> <a href="$(1)" class="order-history-payments-info-card-payment-link">#$(0)</a>'model.tranid model.link model.paymentLabel}}
			{{else}}
				{{translate '<span class="order-history-payments-label">#$(1) </span> <span class="order-history-payments-label-payment-number">#$(0)</span>' model.tranid model.paymentLabel}}
			{{/if}}
		</div>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
