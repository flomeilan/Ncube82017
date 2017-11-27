{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showPayments}}
	<table class="order-history-other-payments-table">
		<thead>
			<th>
				{{translate 'Other Payments' }}
			</th>
			<th>
				{{translate 'Date'}}
			</th>
			<th>
				{{translate 'Amount'}}
			</th>
		</thead>
		{{#if showCreditMemos}}
			{{#each creditMemos}}
				<tr data-recordtype="{{recordtype}}" data-id="{{internalid}}">
					<td data-type='link' class="order-history-other-payments-table-body">
						<span class="order-history-other-payments-table-body-label">
							{{#if ../showLinks}}
								<a href="transactionhistory/{{recordtype}}/{{internalid}}">
								 	{{translate 'Credit Memo #$(0)' tranid }}
								</a>
							{{else}}
								{{translate 'Credit Memo #$(0)' tranid }}
							{{/if}}
						</span>
					</td>
					<td data-type="payment-date" class="order-history-other-payments-table-body-date">
						<span  class="order-history-other-payments-table-body-date-label">{{translate 'Date: '}}</span>
						<span class="order-history-other-payments-table-body-date-value">{{trandate}}</span>
					</td>
					<td data-type="payment-total" class="order-history-other-payments-table-body-amount">
						<span class="order-history-other-payments-table-body-amount-label">{{translate 'Amount: '}}</span>
						<span class="order-history-other-payments-table-body-amount-value">{{amount_formatted}}</span>
					</td>
				</tr> 
			{{/each}}
		{{/if}}
		{{#if showDepositApplications}}
			{{#each depositApplications}}
				<tr data-recordtype="{{recordtype}}" data-id="{{internalid}}">
					<td data-type='link' class="order-history-other-payments-table-body">
						<span class="order-history-other-payments-table-body-label">
							{{#if ../showLinks}}
								<a href="transactionhistory/{{recordtype}}/{{internalid}}">
									{{translate 'Deposit Application #$(0)' tranid }}
								</a>
							{{else}}
								{{translate 'Deposit Application #$(0)' tranid }}
							{{/if}}
						</span>
					</td>
					<td data-type="payment-date" class="order-history-other-payments-table-body-date">
						<span  class="order-history-other-payments-table-body-date-label">{{translate 'Date: '}}</span>
						<span class="order-history-other-payments-table-body-date-value">{{trandate}}</span>
					</td>
					<td data-type="payment-total" class="order-history-other-payments-table-body-amount">
						<span class="order-history-other-payments-table-body-amount-label">{{translate 'Amount: '}}</span>
						<span class="order-history-other-payments-table-body-amount-value">{{amount_formatted}}</span>
					</td>
				</tr> 
			{{/each}}
		{{/if}}

	</table>
{{/if}}



{{!----
Use the following context variables when customizing this template: 
	
	creditMemos (Array)
	depositApplications (Array)
	showCreditMemos (Boolean)
	showDepositApplications (Boolean)
	showLinks (Boolean)
	showPayments (Boolean)

----}}
