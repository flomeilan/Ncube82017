{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<tr class="order-wizard-paymentmethod-giftcertificates-module-record-row" data-gc-code="{{giftcertificate.code}}">
	<td class="order-wizard-paymentmethod-giftcertificates-module-record-gift-certificates">
		<span class="order-wizard-paymentmethod-giftcertificates-module-record-label">{{translate 'Gift Certificate: '}}</span>
		<div data-view="GiftCertificates" class="order-wizard-paymentmethod-giftcertificates-module-record-value"></div>
	</td>
	<td class="order-wizard-paymentmethod-giftcertificates-module-record-amount-applied">
		<span class="order-wizard-paymentmethod-giftcertificates-module-record-label">{{translate 'Amount applied: '}}</span>
		<span>{{giftcertificate.amountapplied_formatted}}</span>
	</td>
	<td class="order-wizard-paymentmethod-giftcertificates-module-record-remaining-balance">
		<span class="order-wizard-paymentmethod-giftcertificates-module-record-label">{{translate 'Remaining balance: '}}</span>
		<span>{{giftcertificate.amountremaining_formatted}}</span>
	</td>
	<td class="order-wizard-paymentmethod-giftcertificates-module-record-actions">
		<a class="order-wizard-paymentmethod-giftcertificates-module-record-actions-button" href="#" data-action="remove" data-id="{{giftcertificate.code}}">
			{{translate 'Remove'}}
		</a>
	</td>
</tr>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
