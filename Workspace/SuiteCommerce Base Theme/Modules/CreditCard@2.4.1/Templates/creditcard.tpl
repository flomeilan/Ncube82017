{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="creditcard" data-id="{{creditCartId}}">
	<div class="creditcard-content">
		{{#if showSecurityCodeForm}}
			<small class="creditcard-require-field">{{translate 'Required'}} <span class="creditcard-required">*</span></small>
			<div class="creditcard-section">
		{{/if}}

		<div class="creditcard-header">
			{{#if showCreditCardImage}}
				<img class="creditcard-header-icon" src="{{creditCardImageUrl}}" alt="{{paymentName}}">
			{{else}}
				{{paymentName}}
			{{/if}}
			<p class="creditcard-number"> &ndash; <b>{{translate 'Ending in $(0)'ccnumber}}</b></p>
		</div>

		<p class="creditcard-name">{{ccname}}</p>
		<p class="creditcard-expdate">{{translate 'Expires'}} {{expirationDate}}</p>

		{{#if showDefaults}}
			<p class="creditcard-default">
				{{#if isDefaultCreditCard}}
					<i class="creditcard-default-icon"></i>
					{{translate 'Default Credit Card'}}
				{{/if}}
			</p>
		{{/if}}
		{{#if showSecurityCodeForm}}
			</div>
			<div class="creditcard-security-code-section">
				<form>
					<div data-view="CreditCard.Edit.Form.SecurityCode"></div>
				</form>
			</div>
		{{/if}}

		{{#if showSelect}}
			<button class="creditcard-use-this-card-button" data-action="select" data-id="{{creditCartId}}">
				{{selectMessage}}
			</button>
		{{/if}}

		{{#if showActions}}
			<div class="creditcard-actions">
				<a class="creditcard-edit-form-button-edit" href="/creditcards/{{creditCartId}}" data-toggle="show-in-modal">
					{{translate 'Edit'}}
				</a>
				<button class="creditcard-edit-form-button-remove" data-action="remove" data-id="{{creditCartId}}">
					{{translate 'Remove'}}
				</button>
			</div>
		{{/if}}
	</div>
</div>



{{!----
Use the following context variables when customizing this template:

	creditCartId (String)
	showSecurityCodeForm (Boolean)
	showCreditCardImage (Boolean)
	creditCardImageUrl (String)
	paymentName (String)
	ccnumber (String)
	ccname (String)
	expirationDate (String)
	showDefaults (Boolean)
	isDefaultCreditCard (Boolean)
	showSelect (Boolean)
	showActions (Boolean)

----}}
