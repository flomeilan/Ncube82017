{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<span class="quote-list-expiration-date">
	{{#if model.duedate}}
		{{#if model.isOverdue}}
			<span class="quote-list-expiration-date-overdue">{{model.duedate}}</span> <i class="quote-list-expiration-date-icon-overdue"></i>
		{{else}}
			{{#if model.isCloseOverdue}}
				<span class="quote-list-expiration-date-closeoverdue">{{model.duedate}}</span> <i class="quote-list-expiration-date-icon-closeoverdue"></i>
			{{else}}
				{{model.duedate}}
			{{/if}}
		{{/if}}
	{{else}}
		<span>{{translate 'Not specified'}}</span>
	{{/if}}
</span>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
