{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="payment-wizard-show-credit-transaction-module-accordion-divider">
	<div class="payment-wizard-show-credit-transaction-module-accordion-head">
		<a class="payment-wizard-show-credit-transaction-module-accordion-head-toggle" data-toggle="collapse" data-target="#payment-wizard-show-credit-transaction-module-products" aria-expanded="true" aria-controls="payment-wizard-show-credit-transaction-module-products">
			{{#if isTransactionTypeCredit}}
				{{translate 'Credits'}}
			{{else}}
				{{translate 'Deposits'}}
			{{/if}}
		<i class="payment-wizard-show-credit-transaction-module-accordion-toggle-icon"></i>
		</a>
	</div>
	<div class="payment-wizard-show-credit-transaction-module-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="payment-wizard-show-credit-transaction-module-products" role="tabpanel" data-target="#payment-wizard-show-credit-transaction-module-products">
		<div data-content="items-body">
			<div class="payment-wizard-show-credit-transaction-module-accordion-body-header">
				<p class="payment-wizard-show-credit-transaction-module-accordion-body-header-label">{{translate 'Amount'}}</p>
			</div>
			<div class="payment-wizard-show-credit-transaction-module-accordion-container">
				{{#each transactions}}
					<div class="payment-wizard-show-credit-transaction-module-accordion-container-row" data-id="{{id}}">
						<div class="payment-wizard-show-credit-transaction-module-accordion-container-row-left">
							<p>{{translate '$(0) #$(1)' type number}}</p>
						</div>
						<div class="payment-wizard-show-credit-transaction-module-accordion-container-row-right">
							<p>
							<span class="payment-wizard-show-credit-transaction-module-accordion-container-label">{{translate 'Amount: '}} </span> 
							<span class="payment-wizard-show-credit-transaction-module-accordion-container-value">{{amountFormatted}}</span>

							</p>
						</div>
					</div>
				{{/each}}

			</div>

			<div class="payment-wizard-show-credit-transaction-module-accordion-body-footer">
				<div class="payment-wizard-show-credit-transaction-module-accordion-container-row">
					<span class="payment-wizard-show-credit-transaction-module-accordion-container-row-label">
					{{#if isTransactionTypeCredit}}
						{{translate 'Credits Subtotal:'}}
					{{else}}
						{{translate 'Deposits Subtotal:'}}
					{{/if}}
					</span>
					<b>{{totalFormatted}}</b>
				</div>
			</div>
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	isTransactionTypeCredit (Boolean)
	totalFormatted (String)
	transactions (Array)
	showOpenedAccordion (Boolean)

----}}
