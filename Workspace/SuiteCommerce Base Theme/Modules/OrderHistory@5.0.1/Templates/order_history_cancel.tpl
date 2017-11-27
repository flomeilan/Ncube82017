{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-history-cancel-modal">
	<h4>{{translate 'Cancel order?'}}</h4>
	<p>{{translate '<strong>Please note:</strong> This will cancel your entire purchase #$(0) for $(1).' model.tranid model.summary.total_formatted}}</p>

	<div class="order-history-cancel-modal-actions">
		<button class="order-history-cancel-modal-cancel-button" data-dismiss="modal" data-action="delete">
			{{translate 'Cancel Purchase'}}
		</button>
		<button class="order-history-cancel-modal-close-button" data-dismiss="modal" data-action="cancel">
			{{translate 'Close'}}
		</button>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
