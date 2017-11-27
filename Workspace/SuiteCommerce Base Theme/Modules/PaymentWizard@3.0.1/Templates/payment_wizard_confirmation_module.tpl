{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="payment-wizard-confirmation-module alert fade in">
	<h2 class="payment-wizard-confirmation-module-title">{{translate 'Thank you!'}}</h2>
	{{#if showLinkConfirmation}}
		<p class="payment-wizard-confirmation-module-body">
			<a href="/transactionhistory/customerpayment/{{confirmationId}}" data-touchpoint="customercenter" data-hashtag="#transactionhistory/customerpayment/{{confirmationId}}" data-action="update-layout">{{translate 'Payment #$(0)' tranId}}</a>
		</p>
	{{else}}
		<p class="payment-wizard-confirmation-module-body">{{translate 'A Deposit/Credit Memo Application was generated.'}}</p>
		<p class="payment-wizard-confirmation-module-body">{{translate 'You can see the details in <a href="/transactionhistory" data-action="update-layout">Transaction History</a> page.'}}</p>
	{{/if}}
	<p class="payment-wizard-confirmation-module-body">{{translate 'You will receive an email with your payment confirmation.'}}</p>

	{{#if isConfirmationCreated}}
		<a href="{{{dwonloadPDFURL}}}" target="_blank" class="payment-wizard-confirmation-module-download" >
			{{translate 'Download as PDF'}}
		</a>
	{{/if}}

	{{#if isInvoiceLengthGreaterThan0}}
		<a href="/make-a-payment" class="payment-wizard-confirmation-module-payment" data-action="update-layout" >{{translate 'Make another payment'}} </a>
	{{else}}
		<button class="payment-wizard-confirmation-module-payment" disabled="disabled">{{translate 'No payment due'}}</button>
	{{/if}}
</div>




{{!----
Use the following context variables when customizing this template: 
	
	tranId (String)
	isConfirmationCreated (Boolean)
	showLinkConfirmation (Boolean)
	confirmationId (String)
	isInvoiceLengthGreaterThan0 (Boolean)
	dwonloadPDFURL (String)

----}}
