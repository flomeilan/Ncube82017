{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="balance-button-back">
		<i class="balance-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="balance">
	<div class="balance-content">
		<h2 class="balance-billing-header">
			{{translate 'Account Balance'}}
		</h2>

		<div class="balance-billing-account-balance">
			

			<div class="balance-indicator">

				<div class="balance-indicator-body">
					
					<div class="balance-indicator-title">
						{{#if showCompany}}
							<span class="balance-indicator-title-value">{{company}}</span>
						{{/if}}
					</div>

					<div class="balance-indicator-bar">
						<div class="balance-indicator-bar-progress" style="width: {{percentage}}%;"></div>
					</div>
					
					<div class="balance-indicator-details">
						<div class="balance-indicator-details-outstanding-balance">
							<span class="balance-indicator-details-outstanding-reference"></span>
							<span class="balance-indicator-details-outstanding-label">
								{{translate 'Outstanding Balance'}}
							</span>
							<span class="balance-indicator-details-outstanding-value">{{balanceFormatted}}</span>
						</div>
						<div class="balance-indicator-details-available-credit">
							<span class="balance-indicator-details-available-credit-reference"></span>
							<span class="balance-indicator-details-available-credit-label">
								{{translate 'Available'}}
							</span>
							<span class="balance-indicator-details-available-credit-value">
								{{balanceAvailableFormatted}}
							</span>
						</div>
					</div>
				</div>

				<div class="balance-indicator-summary">
					<p class="balance-indicator-summary-credit-limit">
						{{translate 'Credit Limit: <span class="balance-indicator-summary-credit-limit-value">$(0)</span>' creditLimitFormatted}}
					</p>
				</div>
			</div>

			<div class="balance-credit-and-account">
				<div class="balance-summary-credits">
					<div class="balance-summary-credits-card">
						<div class="balance-summary-credits-body">
							<p class="balance-summary-credits-title">
								{{ translate 'Credits'}}
							</p>
							<div class="balance-summary-credits-deposits">
								 
								<span class="balance-summary-credits-deposits-label">{{translate 'Deposits: '}}</span>
								<span class="balance-summary-credits-deposits-value">{{depositsRemainingFormatted}}</span>
							</div>
							<div class="balance-summary-credits-credit-memos">
								<span class="balance-summary-credits-credit-memos-label">{{translate 'Other Credits: ' }}</span>
								<span class="balance-summary-credits-credit-memos-value">{{creditMemosRemainingFormatted}}</span>
							</div>
						</div>
					</div>
				</div>

				<div class="balance-summary-account-details">
					<div class="balance-summary-account-details-card">
						<div class="balance-summary-account-details-body">
							<p class="balance-summary-account-details-title">
								{{ translate 'Account Details'}}
							</p>
							<div class="balance-summary-account-terms">
								<span class="balance-summary-account-terms-label">{{translate 'Term: '}}</span>
								<span class="balance-summary-account-terms-value">{{paymentTermsName}}</span>
							</div>
							<div class="balance-summary-account-currency">
								<span class="balance-summary-account-currency-label">{{translate 'Currency: '}}</span>
								<span class="balance-summary-account-currency-value">{{shopperCurrencyCode}}</span>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="balance-actions">
		<div class="balance-actions-proceed">
			{{#if livePaymentHaveInvoices}}
				<a data-permissions="transactions.tranCustPymt.2, transactions.tranCustInvc.1" href="/make-a-payment" class="balance-continue-button">
					{{translate 'Continue to Payment'}}
				</a>
			{{else}}
				<button data-permissions="transactions.tranCustPymt.2, transactions.tranCustInvc.1" class="balance-continue-button" disabled>
					{{translate 'No Payment Due'}}
				</button>
			{{/if}}
		</div>
		<div class="balance-actions-print">
			<a href="/printstatement" data-permissions="transactions.tranStatement.2" class="balance-print-button">
				{{translate 'Print a Statement'}}
			</a>
		</div>
	</div>
</section>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.addresses (Array)
	model.addresses.0 (Object)
	model.addresses.0.zip (String)
	model.addresses.0.country (String)
	model.addresses.0.addr2 (undefined)
	model.addresses.0.addr1 (String)
	model.addresses.0.city (String)
	model.addresses.0.addr3 (undefined)
	model.addresses.0.isvalid (String)
	model.addresses.0.internalid (String)
	model.addresses.0.phone (String)
	model.addresses.0.defaultbilling (String)
	model.addresses.0.defaultshipping (String)
	model.addresses.0.isresidential (String)
	model.addresses.0.state (String)
	model.addresses.0.fullname (String)
	model.addresses.0.company (undefined)
	model.creditcards (Array)
	model.creditcards.0 (Object)
	model.creditcards.0.debitcardissueno (undefined)
	model.creditcards.0.validfrommon (undefined)
	model.creditcards.0.expyear (String)
	model.creditcards.0.ccexpiredate (String)
	model.creditcards.0.validfromyear (undefined)
	model.creditcards.0.ccsecuritycode (undefined)
	model.creditcards.0.savecard (String)
	model.creditcards.0.internalid (String)
	model.creditcards.0.expmonth (String)
	model.creditcards.0.customercode (undefined)
	model.creditcards.0.validfrom (undefined)
	model.creditcards.0.ccname (String)
	model.creditcards.0.ccdefault (String)
	model.creditcards.0.paymentmethod (Object)
	model.creditcards.0.paymentmethod.internalid (String)
	model.creditcards.0.paymentmethod.isexternal (String)
	model.creditcards.0.paymentmethod.merchantid (String)
	model.creditcards.0.paymentmethod.name (String)
	model.creditcards.0.paymentmethod.imagesrc (Array)
	model.creditcards.0.paymentmethod.imagesrc.0 (String)
	model.creditcards.0.paymentmethod.ispaypal (String)
	model.creditcards.0.paymentmethod.creditcard (String)
	model.creditcards.0.paymentmethod.key (String)
	model.creditcards.0.ccnumber (String)
	model.firstname (String)
	model.paymentterms (undefined)
	model.phoneinfo (Object)
	model.phoneinfo.fax (undefined)
	model.phoneinfo.phone (String)
	model.phoneinfo.altphone (undefined)
	model.middlename (String)
	model.creditholdoverride (String)
	model.lastname (String)
	model.internalid (String)
	model.campaignsubscriptions (Array)
	model.campaignsubscriptions.0 (Object)
	model.campaignsubscriptions.0.internalid (Number)
	model.campaignsubscriptions.0.subscribed (Boolean)
	model.campaignsubscriptions.0.name (String)
	model.campaignsubscriptions.0.description (undefined)
	model.isperson (Boolean)
	model.balance (Number)
	model.companyname (undefined)
	model.name (String)
	model.emailsubscribe (String)
	model.creditlimit (Number)
	model.email (String)
	model.phone (String)
	model.altphone (undefined)
	model.fax (undefined)
	model.type (String)
	model.creditlimit_formatted (String)
	model.balance_formatted (String)
	model.balance_available (Number)
	model.balance_available_formatted (String)
	model.isGuest (String)
	model.subsidiary (String)
	model.language (String)
	model.currency (Object)
	model.currency.internalid (String)
	model.currency.symbol (String)
	model.currency.currencyname (String)
	model.currency.code (String)
	model.currency.precision (Number)
	model.priceLevel (String)
	model.isLoggedIn (String)
	model.defaultCreditCard (Object)
	model.defaultCreditCard.debitcardissueno (undefined)
	model.defaultCreditCard.validfrommon (undefined)
	model.defaultCreditCard.expyear (String)
	model.defaultCreditCard.ccexpiredate (String)
	model.defaultCreditCard.validfromyear (undefined)
	model.defaultCreditCard.ccsecuritycode (undefined)
	model.defaultCreditCard.savecard (String)
	model.defaultCreditCard.internalid (String)
	model.defaultCreditCard.expmonth (String)
	model.defaultCreditCard.customercode (undefined)
	model.defaultCreditCard.validfrom (undefined)
	model.defaultCreditCard.ccname (String)
	model.defaultCreditCard.ccdefault (String)
	model.defaultCreditCard.paymentmethod (Object)
	model.defaultCreditCard.paymentmethod.internalid (String)
	model.defaultCreditCard.paymentmethod.isexternal (String)
	model.defaultCreditCard.paymentmethod.merchantid (String)
	model.defaultCreditCard.paymentmethod.name (String)
	model.defaultCreditCard.paymentmethod.imagesrc (Array)
	model.defaultCreditCard.paymentmethod.imagesrc.0 (String)
	model.defaultCreditCard.paymentmethod.ispaypal (String)
	model.defaultCreditCard.paymentmethod.creditcard (String)
	model.defaultCreditCard.paymentmethod.key (String)
	model.defaultCreditCard.ccnumber (String)
	showCompany (Boolean)
	company (undefined)
	percentage (Number)
	isPercentageGreaterThan8 (Boolean)
	isPercentageLowertThan92 (Boolean)
	balanceFormatted (String)
	balanceAvailableFormatted (String)
	creditLimitFormatted (String)
	depositsRemainingFormatted (String)
	creditMemosRemainingFormatted (String)
	paymentTermsName (String)
	shopperCurrencyCode (String)
	livePaymentHaveInvoices (Boolean)
	showBackToAccount (Boolean)

----}}
