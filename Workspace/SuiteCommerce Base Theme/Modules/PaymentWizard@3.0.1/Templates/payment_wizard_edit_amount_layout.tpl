{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="payment-wizard-edit-amount-layout">
	<form id="editAmountToPayForm" class="payment-wizard-edit-amount-layout-form" data-action="edit-amount-form">
	<div>
		<div class="payment-wizard-edit-amount-layout-form-row">
			<span class="payment-wizard-edit-amount-layout-form-row-left">{{originalAmountLabel}}:</span>
			<span class="payment-wizard-edit-amount-layout-form-row-right">{{originalAmountFormatted}}</span>
		</div>

		{{#if showAmountDue}}
			<div class="payment-wizard-edit-amount-layout-form-row">
				<span class="payment-wizard-edit-amount-layout-form-row-left">{{amountDueLabel}}:</span>
				<span class="payment-wizard-edit-amount-layout-form-row-right">{{amountDueFormatted}}</span>
			</div>
		{{/if}}

		<hr/>

		{{#if showSelectedInvoicesLength}}
			<div class="payment-wizard-edit-amount-layout-form-row">
				<span class="payment-wizard-edit-amount-layout-form-row-left">
					{{translate 'Invoices ($(0))' selectedInvoicesLength}}
				</span>
				<span class="payment-wizard-edit-amount-layout-form-row-right">
					{{invoiceTotalFormatted}}
				</span>
			</div>
		{{/if}}

		<div class="payment-wizard-edit-amount-layout-form-row" data-validation="control-group">
			<span class="payment-wizard-edit-amount-layout-form-row-left-amount">{{inputLabel}}</span>
			<span class="payment-wizard-edit-amount-layout-form-row-right">
				<div class="payment-wizard-edit-amount-layout-form-row-currency" data-validation="control">
					<input name="amount" data-action="edit-amount" autofocus type="text" class="payment-wizard-edit-amount-layout-form-row-currency-selector-select" value="{{inputValue}}" />
					<span class="payment-wizard-edit-amount-layout-form-row-currency-selector-addon">{{currencySymbol}}</span>
				</div>
			</span>
		</div>

		{{#if showDiscountApplied}}
			<div class="payment-wizard-edit-amount-layout-discount-section">
				<div class="payment-wizard-edit-amount-layout-form-row">
					<span class="payment-wizard-edit-amount-layout-form-row-left">
						{{translate 'Applicable discount $(0)' discountFormatted}}
					</span>
					<span class="payment-wizard-edit-amount-layout-form-row-right" data-type="applied-discount-ammount">- {{discountAmountFormatted}}</span>
				</div>
				<hr />
				<div class="payment-wizard-edit-amount-layout-form-row">
					<span class="payment-wizard-edit-amount-layout-form-row-left">{{translate 'Your payment:'}}</span>
					<span class="payment-wizard-edit-amount-layout-form-row-right" data-type="specified-payment-ammount" >{{dueWithDiscountFormatted}}</span>
				</div>
			</div>
		{{/if}}

		<div class="payment-wizard-edit-amount-layout-form-action">
			<input type="submit" value="{{translate 'Save'}}" class="payment-wizard-edit-amount-layout-form--action-button" data-action="save-amount" />
		</div>
	</div>
	</form>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	originalAmountLabel (String)
	originalAmountFormatted (String)
	showAmountDue (Boolean)
	amountDueLabel (String)
	amountDueFormatted (String)
	showSelectedInvoicesLength (Boolean)
	inputLabel (String)
	inputValue (Number)
	currencySymbol (String)
	showDiscountApplied (Boolean)
	discountFormatted (String)
	discountAmountFormatted (String)
	dueWithDiscountFormatted (String)
	selectedInvoicesLength (Number)
	invoiceTotalFormatted (String)

----}}
