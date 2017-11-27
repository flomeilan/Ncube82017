{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if isLoading}}
	<div class="product-detail-to-quote-add-to-quote">
		<div class="product-detail-to-quote-loading">{{translate 'Loading...'}}</div>
	</div>
{{else}}
	{{#if isQuotable}}
		<div class="product-detail-to-quote-add-to-quote">
				<button data-type="add-to-quote" class="product-detail-to-quote-add-to-quote-button" {{#unless isReadyForQuote}}disabled{{/unless}}>
					{{translate 'Add to Quote'}}
				</button>
		</div>
		{{#if showMessage}}
			<div data-view="GlobalViews.FeedbackMessage"></div>
		{{/if}}
	{{/if}}
{{/if}}




{{!----
Use the following context variables when customizing this template: 
	
	isQuotable (Boolean)
	isLoading (Boolean)
	isReadyForQuote (Boolean)
	showMessage (Boolean)

----}}
