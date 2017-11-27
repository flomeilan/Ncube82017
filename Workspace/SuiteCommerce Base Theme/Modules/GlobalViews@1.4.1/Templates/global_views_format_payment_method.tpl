{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="global-views-format-payment-method">
	{{#if isCreditcard}}
		<div class="global-views-format-payment-method-header">
			{{#if showCreditCardImage}}
				<img class="global-views-format-payment-method-header-icon" src="{{creditCardImageUrl}}" alt="{{creditCardPaymentMethodName}}">
			{{else}}
				{{creditCardPaymentMethodName}}
			{{/if}}
			<p class="global-views-format-payment-method-number"> &ndash; <b>{{translate 'Ending in $(0)' creditCardNumberEnding}}</b></p>
		</div>
		<p class="global-views-format-payment-method-name">{{creditCard.ccname}}</p>
		<p class="global-views-format-payment-method-expdate">{{translate 'Expires $(0)' creditCard.ccexpiredate}}</p>

		{{#if showPurchaseNumber}}
			<p class="global-views-format-payment-method-purchase">{{translate 'Purchase Number: $(0)' model.purchasenumber }}</p>
	{{/if}}
	{{/if}}

	{{#if isGiftCertificate}}
		<p class="global-views-format-payment-method-gift-certificate">{{translate 'Ending in $(0)' giftCertificateEnding}}</p>
	{{/if}}

	{{#if isInvoice}}
		<p class="global-views-format-payment-method-invoice">{{translate 'Invoice: Terms $(0)' model.paymentterms.name}}</p>
		
		{{#if showPurchaseNumber}}
			<p class="global-views-format-payment-method-purchase">{{translate 'Purchase Number: $(0)' model.purchasenumber }}</p>
		{{/if}}
	{{/if}}

	{{#if isPaypal}}
		<p class="global-views-format-payment-method-paypal">{{translate 'Payment via Paypal'}}</p>
		{{#if showPurchaseNumber}}
			<p class="global-views-format-payment-method-purchase">{{translate 'Purchase Number: $(0)' model.purchasenumber }}</p>
		{{/if}}
	{{/if}}

	{{#if isOther}}
		{{name}}

		{{#if showPurchaseNumber}}
			<p class="global-views-format-payment-method-purchase">{{translate 'Purchase Number: $(0)' model.purchasenumber }}</p>
		{{/if}}
	{{/if}}

	{{#if showStreet}}
			<p class="global-views-format-payment-method-street">{{translate 'Card Street: <span class="global-views-format-payment-method-street-value">$(0)</span>' model.ccstreet }}</p>
	{{/if}}
	{{#if showZipCode}}
		<p class="global-views-format-payment-method-zip">{{translate 'Card Zip Code: <span class="global-views-format-payment-method-zip-value">$(0)</span>' model.cczipcode }}</p>
	{{/if}}
</div>



{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.type (String)
	model.primary (Boolean)
	model.creditcard (Object)
	model.creditcard.internalid (String)
	model.creditcard.ccnumber (String)
	model.creditcard.ccname (String)
	model.creditcard.ccexpiredate (String)
	model.creditcard.ccsecuritycode (undefined)
	model.creditcard.expmonth (String)
	model.creditcard.expyear (String)
	model.creditcard.paymentmethod (Object)
	model.creditcard.paymentmethod.internalid (String)
	model.creditcard.paymentmethod.name (String)
	model.creditcard.paymentmethod.creditcard (Boolean)
	model.creditcard.paymentmethod.ispaypal (Boolean)
	model.creditcard.paymentmethod.isexternal (Boolean)
	model.creditcard.paymentmethod.key (String)
	isCreditcard (String)
	isGiftCertificate (Boolean)
	isPaypal (Boolean)
	isInvoice (Boolean)
	isOther (Boolean)
	type (String)
	name (String)
	creditCardNumberEnding (String)
	showCreditCardImage (Boolean)
	creditCardImageUrl (String)
	creditCardPaymentMethodName (String)
	creditCard (Object)
	creditCard.internalid (String)
	creditCard.ccnumber (String)
	creditCard.ccname (String)
	creditCard.ccexpiredate (String)
	creditCard.ccsecuritycode (undefined)
	creditCard.expmonth (String)
	creditCard.expyear (String)
	creditCard.paymentmethod (Object)
	creditCard.paymentmethod.internalid (String)
	creditCard.paymentmethod.name (String)
	creditCard.paymentmethod.creditcard (Boolean)
	creditCard.paymentmethod.ispaypal (Boolean)
	creditCard.paymentmethod.isexternal (Boolean)
	creditCard.paymentmethod.key (String)
	giftCertificateEnding (String)
	showPurchaseNumber (Boolean)

----}}
