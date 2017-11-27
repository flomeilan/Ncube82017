{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="payment-wizard-credit-transaction-module" {{#if isTransactionTypeCredit}}data-manage="payment-wizard-credits-accordion"{{else}}data-manage="payment-wizard-deposits-accordion"{{/if}}>
	<div class="payment-wizard-credit-transaction-module-expander-head">
		<a class="payment-wizard-credit-transaction-module-expander-head-toggle" data-toggle="collapse" data-target="#{{accordionId}}" aria-expanded="false" aria-controls="{{accordionId}}">
			{{#if isTransactionTypeCredit}}
				{{translate 'Credits (<span class="payment-wizard-credit-transaction-module-credits-count">$(0)</span>)' collectionLength}}
			{{else}}
				{{translate 'Deposits (<span class="payment-wizard-credit-transaction-module-deposits-count">$(0)</span>)' collectionLength}}
			{{/if}}
			<i class="payment-wizard-credit-transaction-module-expander-head-toggle-icon"></i>
		</a>
	</div>

	<div class="payment-wizard-credit-transaction-module-expander-body collapse in" id="{{accordionId}}">

		<table class="payment-wizard-credit-transaction-module-records">
			<thead class="payment-wizard-credit-transaction-module-records-head">
				<tr class="payment-wizard-credit-transaction-module-records-head-row">
					<th></th>
					<th></th>
					<th>{{translate 'Original amount'}}</th>
					<th>{{translate 'Remaining amount'}}</th>
					<th>{{translate 'Amount'}}</th>
					<th class="payment-wizard-credit-transaction-module-records-action-col"></th>
				</tr>
			</thead>

			<tbody class="payment-wizard-credit-transaction-module-records-body" data-view="Transaction.Collection"></tbody>

			<tfoot class="payment-wizard-credit-transaction-module-records-foot">
				<tr>
					<td colspan="6" class="payment-wizard-credit-transaction-module-subtotal">
						{{#if isTransactionTypeCredit}}
							<span class="payment-wizard-credit-transaction-module-subtotal-label">{{translate 'Credits Subtotal: '}}</span>
							<span class="payment-wizard-credit-transaction-module-subtotal-value">{{totalFormatted}}</span>
						{{else}}
							<span class="payment-wizard-credit-transaction-module-subtotal-label">{{translate 'Deposits Subtotal: '}}</span>
							<span class="payment-wizard-credit-transaction-module-subtotal-value">{{totalFormatted}}</span>
						{{/if}}
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	accordionId (String)
	isTransactionTypeCredit (Boolean)
	collectionLength (Number)
	areElementsCollapsed (Boolean)
	totalFormatted (String)

----}}
