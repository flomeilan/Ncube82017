{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-register-guest-module-form-container collapse" id="register-guest-show-view">
	<form>
		<div data-view="RegisterGuestForm"></div>
 		<p>
			<button type="submit" class="order-wizard-register-guest-module-create-account-button">
				{{translate 'Create Account'}}
			</button>
		</p> 
	</form>
</div>
<p>
	<button class="order-wizard-register-guest-module-button-toggle-create-account" data-action="remove-button" data-toggle="collapse" data-target="#register-guest-show-view">
		{{translate 'Create Account'}}
	</button>
</p>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
