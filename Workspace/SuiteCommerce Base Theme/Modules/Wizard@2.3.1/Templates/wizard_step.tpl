{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showTitle}}
<header class="wizard-step-header">
	<h2 data-type="wizard-step-name-container" class="wizard-step-title">{{title}}</h2>
</header>
{{/if}}

<div data-type="alert-placeholder-step"></div>

<section id="wizard-step-content" class="wizard-step-content-main">
</section>

<div class="wizard-step-actions">

	{{#if showBottomMessage}}
	<small class="wizard-step-message {{bottomMessageClass}}">
		{{bottomMessage}}
	</small>
	{{/if}}

	<div class="wizard-step-button-container">

		{{#if showContinueButton}}
		<button class="wizard-step-button-continue" data-action="submit-step">
			{{continueButtonLabel}}
		</button>
		{{/if}}
		<button class="wizard-step-button-back" {{#unless showBackButton}}style="display:none;"{{/unless}} data-action="previous-step">
			{{translate 'Back'}}
		</button>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
