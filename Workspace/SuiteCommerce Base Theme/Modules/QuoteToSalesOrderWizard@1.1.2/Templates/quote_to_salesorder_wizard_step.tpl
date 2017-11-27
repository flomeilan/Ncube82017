{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div>
	<header>
		<h1 class="quote-to-salesorder-wizard-step-header-title">{{currentStepGroupName}}</h1>
	</header>
</div>

<div data-type="alert-placeholder-step"></div>

<div class="quote-to-salesorder-wizard-step-content-wrapper">

	<div id="wizard-step-content" class="quote-to-salesorder-wizard-step-content-main"></div>

	<div id="wizard-step-content-right" class="quote-to-salesorder-wizard-step-content-right"></div>


	{{#if showNavButtons}}
		<div class="quote-to-salesorder-wizard-step-actions">
			<div class="quote-to-salesorder-wizard-step-button-container">
				{{#if showContinueButton}}
					<button class="quote-to-salesorder-wizard-step-button-continue" data-action="submit-step">
						{{continueButtonLabel}}
					</button>
				{{/if}}
				{{#if showBackButton}}
					<button class="quote-to-salesorder-wizard-step-button-back" data-action="previous-step">
						{{translate 'Back'}}
					</button>
				{{/if}}
			</div>
		</div>
	{{/if}}

	<div class="quote-to-salesorder-wizard-step-disclaimer-bottom-content">
		{{#if showBottomMessage}}
			{{#if hasSalesrep}}
				<small class="quote-to-salesorder-wizard-step-disclaimer-message">
					{{translate 'For immediate assistance contact <strong>$(0)</strong> at <strong>$(1)</strong> or send an email to <strong>$(2)</strong>' salesrepName salesrepPhone salesrepEmail}}
				</small>
			{{else}}
				<small class="quote-to-salesorder-wizard-step-disclaimer-message">
					{{{disclaimer}}}
				</small>
			{{/if}}
		{{/if}}
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
