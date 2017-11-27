{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="creditcard-edit-form-securitycode">
	<div class="creditcard-edit-form-securitycode-group" data-input="ccsecuritycode" data-validation="control-group">
		<label class="creditcard-edit-form-securitycode-group-label" for="ccsecuritycode">
			{{translate 'Security Number'}} <span class="creditcard-edit-form-securitycode-group-label-required">*</span>
		</label>

		<div class="creditcard-edit-form-securitycode-controls" data-validation="control">
			<input type="text" class="creditcard-edit-form-securitycode-group-input" id="ccsecuritycode" name="ccsecuritycode" value="{{value}}" maxlength="4">

			<a href="#" class="creditcard-edit-form-securitycode-link">
				<span class="creditcard-edit-form-securitycode-icon-container">
					<i class="creditcard-edit-form-securitycode-icon"  data-toggle="popover" data-placement="bottom" data-title="{{creditCardHelpTitle}}"/>
				</span>
			</a>
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template:

	showCreditCardHelp (Boolean)
	creditCardHelpTitle (String)
	showError (Boolean)
	errorMessage (String)

----}}
