{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<h2 class="payment-wizard-step-title">{{currentStepGroupName}}</h2>

<div data-type="alert-placeholder-step"></div>

<div class="payment-wizard-step-content-wrapper">
	<div id="wizard-step-content" class="payment-wizard-step-content-main"></div>
	<div id="wizard-step-content-right" class="payment-wizard-step-content-secondary"></div>


	{{#if showNavButtons}}
	<div class="payment-wizard-step-actions">
		<div class="payment-wizard-step-button-container">
			{{#if showContinueButton}}
				<button class="payment-wizard-step-button-continue" data-action="submit-step">
					{{continueButtonLabel}}
				</button>
			{{/if}}
			{{#if showBackButton}}
				<button class="payment-wizard-step-button-back" data-action="previous-step">
					{{translate 'Back'}}
				</button>
			{{/if}}
		</div>
	</div>
	{{/if}}

</div>




{{!----
Use the following context variables when customizing this template: 
	
	currentStepGroupName (String)
	continueButtonLabel (String)
	showNavButtons (Boolean)
	showBackButton (Boolean)
	showContinueButton (Boolean)
	showBreadcrumb (Boolean)

----}}
