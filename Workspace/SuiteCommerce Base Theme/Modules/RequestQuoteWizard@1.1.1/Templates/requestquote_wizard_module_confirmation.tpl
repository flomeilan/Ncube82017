{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="requestquote-wizard-module-confirmation">
	<h2 class="requestquote-wizard-module-confirmation-title">{{translate 'Thank you!'}}</h2>
	<p class="requestquote-wizard-module-confirmation-body">
		{{translate 'Your Quote Request <a href="/quotes/$(0)">#$(1)</a> was successfully placed.' quoteId quoteTranId}}
	</p>
	<p class="requestquote-wizard-module-confirmation-body">
		{{translate contactBusinessDaysMessage}}
	</p>
	<p class="requestquote-wizard-module-confirmation-body">
		{{#if hasSalesrep}}
			{{translate 'For immediate assistance call us at <strong>$(0)</strong> or email us at <a href="mailto:$(1)">$(1)</a>' salesrepPhone salesrepEmail}}
		{{else}}
			{{{disclaimer}}}
		{{/if}}
	</p>
	<a class="requestquote-wizard-module-confirmation-new-quote" href="/request-a-quote">{{translate 'Request a new Quote'}}</a>
	<a class="requestquote-wizard-module-confirmation-continue" href="/quotes">{{translate 'See Your Quotes'}}</a>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
