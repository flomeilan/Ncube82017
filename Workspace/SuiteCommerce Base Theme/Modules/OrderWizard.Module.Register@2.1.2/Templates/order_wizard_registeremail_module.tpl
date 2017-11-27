{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-registeremail-module">
	<div class="order-wizard-registeremail-module-show-addresses-container">
		<h3 class="order-wizard-registeremail-module-title">
			{{translate 'Enter Email Address'}}
		</h3>
		<div class="order-wizard-registeremail-module-form-placeholder">
			<label class="order-wizard-registeremail-module-edit-fields-group-label">
				{{translate 'Email Address'}}
				<span class="order-wizard-registeremail-module-input-required">*</span>
			</label>

			<input type="email" name="email" id="email" class="order-wizard-registeremail-module-edit-fields-group-input" placeholder="{{translate 'your@email.com'}}" value="{{email}}" >
			<small class="order-wizard-registeremail-module-input-help">
				{{translate 'We need you email address to send you information about your order.'}}
			</small>
		</div>
		<label class="order-wizard-registeremail-module-checkbox">
			<input
				type="checkbox"
				name="sign-up-newsletter"
				{{#if isEmailSubcribe}} checked {{/if}}
			>
			{{translate 'Sign up for our Newsletter to receive promotions'}}
		</label>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
