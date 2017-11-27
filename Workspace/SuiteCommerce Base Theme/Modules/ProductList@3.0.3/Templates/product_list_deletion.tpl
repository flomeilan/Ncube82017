{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-list-deletion-body">
	{{body}}
</div>
<div class="product-list-deletion-footer">
	<button class="product-list-deletion-button-delete-button" data-action="delete">
		{{#if hasConfirmLabel}}
			{{confirmLabel}}
		{{else}}
			{{translate 'Yes'}}
		{{/if}}
	</button>
	<button class="product-list-deletion-button-delete-cancel" data-dismiss="modal" data-action="cancel">
		{{#if hasCancelLabel}}
			{{cancelLabel}}
		{{else}}
			{{translate 'Cancel'}}
		{{/if}}
	</button>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
