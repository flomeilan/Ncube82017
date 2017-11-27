{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-paymentmethod-creditcard-module">
	{{#if showTitle}}
		<h3 class="order-wizard-paymentmethod-creditcard-module-title">{{title}}</h3>
	{{/if}}

	{{#if showSelectedCreditCard}}
		<div class="order-wizard-paymentmethod-creditcard-module-selected-card">
			<div data-view="SelectedCreditCard"></div>
			<div class="order-wizard-paymentmethod-creditcard-module-actions">
				<a class="order-wizard-paymentmethod-creditcard-module-edit-card" href="/creditcards/{{selectedCreditCard.internalid}}" data-toggle="show-in-modal">
					{{translate 'Edit Card'}}
				</a>
				<a href="#" class="order-wizard-paymentmethod-creditcard-module-change-card" data-action="change-creditcard">
					{{translate 'Change Card'}}
				</a>
			</div>
		</div>
	{{/if}}
	{{#if showList}}
		<div id="creditcard-module-list-placeholder" class="order-wizard-paymentmethod-creditcard-module-list-placeholder">
			<p>
				<a class="order-wizard-paymentmethod-creditcard-module-add-new-credit-card-button" href="/creditcards/new" data-toggle="show-in-modal">
					{{translate 'Add New Credit Card'}}
				</a>
			</p>
			<div data-view="CreditCard.List"></div>
		</div>
	{{/if}}
	{{#if showForm}}
		<div class="order-wizard-paymentmethod-creditcard-module-form">
			<form method="POST" data-view="CreditCard.Form"></form>
		</div>
	{{/if}}


	<p class="order-wizard-paymentmethod-creditcard-module-learn-more"> <i class="order-wizard-paymentmethod-creditcard-module-learn-more-icon"></i> {{ translate 'Learn more about <a class="order-wizard-paymentmethod-creditcard-module-learn-more-link" data-action="show-safe-secure-info"> safe and secure </a> shopping' }} </p>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	showForm (Boolean)
	showList (Boolean)
	showSelectedCreditCard (Boolean)
	showTitle (Boolean)
	title (String)
	selectedCreditCard (Object)
	selectedCreditCard.debitcardissueno (undefined)
	selectedCreditCard.validfrommon (undefined)
	selectedCreditCard.expyear (String)
	selectedCreditCard.ccexpiredate (String)
	selectedCreditCard.validfromyear (undefined)
	selectedCreditCard.ccsecuritycode (String)
	selectedCreditCard.savecard (String)
	selectedCreditCard.internalid (String)
	selectedCreditCard.expmonth (String)
	selectedCreditCard.customercode (undefined)
	selectedCreditCard.validfrom (undefined)
	selectedCreditCard.ccname (String)
	selectedCreditCard.ccdefault (String)
	selectedCreditCard.paymentmethod (Object)
	selectedCreditCard.paymentmethod.internalid (String)
	selectedCreditCard.paymentmethod.isexternal (String)
	selectedCreditCard.paymentmethod.merchantid (String)
	selectedCreditCard.paymentmethod.name (String)
	selectedCreditCard.paymentmethod.imagesrc (Array)
	selectedCreditCard.paymentmethod.imagesrc.0 (String)
	selectedCreditCard.paymentmethod.ispaypal (String)
	selectedCreditCard.paymentmethod.creditcard (String)
	selectedCreditCard.paymentmethod.key (String)
	selectedCreditCard.ccnumber (String)
	selectedCreditCard.hasSecurityCode (Boolean)
	creditCards (Array)

----}}
