{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="payment-wizard-confirmation-summary-module">
	<div class="payment-wizard-confirmation-summary-module-container">
		<header class="payment-wizard-confirmation-summary-module-header">
			<h3 class="payment-wizard-confirmation-summary-module-title">
				{{translate 'Payment Summary'}}
			</h3>
		</header>
		<div class="payment-wizard-confirmation-summary-module-body">
			<div class="payment-wizard-confirmation-summary-module-invoices">
				<p class="payment-wizard-confirmation-summary-module-grid-float">
					<span class="payment-wizard-confirmation-summary-module-invoices-value">{{invoiceTotalFormatted}}</span>
					{{translate 'Invoices (<span class="payment-wizard-confirmation-summary-module-invoices-number">$(0)</span>)' selectedInvoicesLength}}					
				</p>
			</div>

			{{#if hasDeposit}}
				<div class="payment-wizard-confirmation-summary-module-deposits-subtotal">
					<p class="payment-wizard-confirmation-summary-module-grid-float">
						<span class="payment-wizard-confirmation-summary-module-deposits-subtotal-value">{{depositTotalFormatted}}</span>
						{{translate 'Deposits Subtotal'}}
						
					</p>
				</div>
			{{/if}}

			{{#if hasCredit}}
				<div class="payment-wizard-confirmation-summary-module-credits-subtotal">
					<p class="payment-wizard-confirmation-summary-module-grid-float">
						<span class="payment-wizard-confirmation-summary-module-credits-subtotal-value">{{creditTotalFormatted}}</span>
						{{translate 'Credits Subtotal'}}						
					</p>
				</div>
			{{/if}}

			<div class="payment-wizard-confirmation-summary-module-estimated">
				<p class="payment-wizard-confirmation-summary-module-grid-float">
					<span class="payment-wizard-confirmation-summary-module-total-value">{{paymentFormatted}}</span>
					<span class="payment-wizard-confirmation-summary-module-total-label">{{translate 'Payment Total'}}</span>
				</p>
			</div>			
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	selectedInvoicesLength (Number)
	invoiceTotalFormatted (String)
	paymentFormatted (String)
	depositTotalFormatted (String)
	hasDeposit (Boolean)
	hasCredit (Boolean)
	creditTotalFormatted (String)
	showTotalLabel (Boolean)
	totalLabel (String)

----}}
