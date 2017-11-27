{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div data-view="ListHeader.View"></div>

<div class="payment-wizard-invoice-module-payment-list">
{{#if isInvoiceLengthGreaterThan0}}
	<div class="payment-wizard-invoice-module-list-subheader">
			<table class="payment-wizard-invoice-module-table">
				<thead class="payment-wizard-invoice-module-table-header">
					<tr>
						<th class="payment-wizard-invoice-module-table-select-col">
							&nbsp;
						</th>
						<th class="payment-wizard-invoice-module-table-invoice-number">
							<span>{{translate 'Invoice No.'}}</span>
						</th>
						<th class="payment-wizard-invoice-module-table-invoice-due-date">
							<span>{{translate 'Due date'}}</span>
						</th>
						<th class="payment-wizard-invoice-module-table-invoice-amount">
							<span>{{translate 'Amount'}}</span>
						</th>
						<th class="payment-wizard-invoice-module-table-invoice-action">
							&nbsp;
						</th>
					</tr>
				</thead>
			<tbody class="payment-wizard-invoice-module-table-body" data-view="Invoices.Collection"></tbody>
			</table>
		</div>
{{else}}
	<p class="payment-wizard-invoice-module-list-empty">
		{{translate 'You don\'t have any Open Invoices at the moment,<br/>see <a href="/paid-invoices">Invoices Paid In Full</a>'}}
	</p>
{{/if}}
</div>




{{!----
Use the following context variables when customizing this template: 
	
	isInvoiceLengthGreaterThan0 (Boolean)

----}}
