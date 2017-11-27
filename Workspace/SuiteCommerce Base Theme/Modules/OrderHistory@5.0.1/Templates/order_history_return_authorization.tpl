{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-history-return-authorization">
	<div class="order-history-return-authorization-header">
		{{#if showLink}}
		<p class="order-history-return-authorization-id">
			{{translate '<span class="order-history-return-authorization-number-label">Return: </span><a class="order-history-return-authorization-status-id-link" href="returns/$(2)/$(1)">#$(0)</a>' model.tranid model.internalid model.recordtype}}
		</p>
		{{/if}}
		<p class="order-history-return-authorization-status">
			<span class="order-history-return-authorization-status-label">{{translate 'Status:'}}</span>
			<span class="order-history-return-authorization-status-value">{{model.status.name}}</span>
		</p>
	</div>

	<table class="order-history-return-authorization-table lg2sm-first">
		<thead class="order-history-return-authorization-table-head">
			<th class="order-history-return-authorization-table-header"></th>
			<th class="order-history-return-authorization-table-header">{{translate 'Item'}}</th>
			<th class="order-history-return-authorization-table-header-quantity">{{translate 'Qty'}}</th>
			<th class="order-history-return-authorization-table-header-unit-price">{{translate 'Unit price'}}</th>
			<th class="order-history-return-authorization-table-header-amount">{{translate 'Amount'}}</th>
		</thead>
		<tbody data-view="Items.Collection"></tbody>
	</table>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
