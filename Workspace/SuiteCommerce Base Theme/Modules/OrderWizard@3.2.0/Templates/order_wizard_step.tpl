{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div data-action="skip-login-message" class="order-wizard-step-guest-message"></div>

{{#if showTitle}}
<header class="order-wizard-step-header">
	<h2 data-type="wizard-step-name-container" class="order-wizard-step-title">{{title}}</h2>
</header>
{{/if}}

<div data-type="alert-placeholder-step"></div>

<div class="order-wizard-step-review-wrapper">
	
	<section class="order-wizard-step-review-main">
		<div id="wizard-step-review-left"></div>
	</section>

	<section id="wizard-step-review-right" class="order-wizard-step-review-secondary">
	</section>

</div>

<div class="order-wizard-step-content-wrapper">
	
	<section id="wizard-step-content" class="order-wizard-step-content-main">
	</section>

	<section id="wizard-step-content-right" class="order-wizard-step-content-secondary">
	</section>

	<div class="order-wizard-step-actions">

		{{#if showBottomMessage}}
		<small class="order-wizard-step-message {{bottomMessageClass}}">
			{{bottomMessage}}
		</small>
		{{/if}}

		<div class="order-wizard-step-button-container">

			{{#if showContinueButton}}
			<button class="order-wizard-step-button-continue" data-action="submit-step">
				{{continueButtonLabel}}
			</button>
			{{/if}}
			<button class="order-wizard-step-button-back" {{#unless showBackButton}}style="display:none;"{{/unless}} data-action="previous-step">
				{{translate 'Back'}}
			</button>
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	showTitle (Boolean)
	title (String)
	showContinueButton (Boolean)
	continueButtonLabel (String)
	showSecondContinueButtonOnPhone (Boolean)
	showBackButton (Boolean)
	showBottomMessage (Boolean)
	bottomMessage (String)
	bottomMessageClass (String)

----}}
