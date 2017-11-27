{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="payment-wizard-summary-module">
	<div class="payment-wizard-summary-module-container">
		<header class="payment-wizard-summary-module-header">
			<h3 class="payment-wizard-summary-module-title">
				{{translate 'Payment Summary'}}
			</h3>
		</header>
		<div class="payment-wizard-summary-module-body">
			<div class="payment-wizard-summary-module-invoices">
				<p class="payment-wizard-summary-module-grid-float">
					<span class="payment-wizard-summary-module-invoices-value">{{invoiceTotalFormatted}}</span>
					{{translate 'Invoices (<span class="payment-wizard-summary-module-invoices-number">$(0)</span>)' selectedInvoicesLength}}
					
				</p>
			</div>
			{{#if showTotalLabel}}
				<div class="payment-wizard-summary-module-deposits-subtotal">
					<p class="payment-wizard-summary-module-grid-float">
						<span class="payment-wizard-summary-module-deposits-subtotal-value">{{depositTotalFormatted}}</span>
						{{translate 'Deposits Subtotal'}}
						
					</p>
				</div>
				<div class="payment-wizard-summary-module-credits-subtotal">
					<p class="payment-wizard-summary-module-grid-float">
					<span class="payment-wizard-summary-module-credits-subtotal-value">{{creditTotalFormatted}}</span>
						{{translate 'Credits Subtotal'}}
						
					</p>
				</div>
			{{/if}}
			<div class="payment-wizard-summary-module-estimated">
				<p class="payment-wizard-summary-module-grid-float">
					{{#if showEstimatedAsInvoiceTotal}}
						<span class="payment-wizard-summary-module-estimated-total-value">{{invoiceTotalFormatted}}</span>
					{{else}}
						<span class="payment-wizard-summary-module-estimated-total-value">{{paymentFormatted}}</span>
					{{/if}}
					{{totalLabel}}
				</p>
			</div>

			{{#if showCreditCardInformatioRequrieLabel}}
				<div class="payment-wizard-summary-module-alert-information">
					{{translate 'Add your credit card security code (CSC/CVV) before submitting the payment'}}
				</div>
			{{else}}
				{{#if showPaymentMethodRequireLabel}}
					<div class="payment-wizard-summary-module-alert-information">
						{{translate 'Payment method is not required'}}
					</div>
				{{/if}}
			{{/if}}
			
		</div>
	</div>
	<div class="payment-wizard-summary-module-buttons-container">
		<button class="payment-wizard-summary-module-button-continue" data-action="submit-step" {{continueButtonDisabled}} >
			{{continueButtonLabel}}
		</button>
	</div>
</div>








{{!----
Use the following context variables when customizing this template: 
	
	selectedInvoicesLength (Number)
	invoiceTotalFormatted (String)
	paymentFormatted (String)
	depositTotalFormatted (String)
	creditTotalFormatted (String)
	showTotalLabel (Boolean)
	totalLabel (String)
	showEstimatedAsInvoiceTotal (Boolean)
	showCreditCardInformatioRequrieLabel (Boolean)
	showPaymentMethodRequireLabel (Boolean)
	continueButtonDisabled (String)
	continueButtonLabel (String)

----}}
