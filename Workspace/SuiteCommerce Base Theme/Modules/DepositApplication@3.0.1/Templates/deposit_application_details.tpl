{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section>
	<a href="/transactionhistory" class="deposit-application-details-back-btn">
		{{translate '&lt; Back to Transaction History'}}
	</a>
	<header>
		<h2 class="deposit-application-details-title">
			{{translate 'Deposit Application <span class="deposit-application-details-deposit-number">#$(0)</span>' tranId}}
			<span class="deposit-application-details-deposit-amount">{{totalFormatted}}</span>
		</h2>

	</header>

	<div class="deposit-application-details-header-information">
		<div class="deposit-application-details-row">
			<div class="deposit-application-details-header-information-container">
				<p class="deposit-application-details-transaction-date-info">
				<span class="deposit-application-details-transaction-date-label">{{translate 'Transaction Date: '}}</span>
				<span class="deposit-application-details-transaction-date-value">{{ tranDate}}</span>
				</p>
				<p class="deposit-application-details-from-info">
					<span class="deposit-application-details-from-label">{{translate 'From:'}}</span>
					<span class="deposit-application-details-from-link"><a href="/transactionhistory/customerdeposit/{{depositInternalId}}" class="deposit-application-details-deposit-link">
						{{depositName}}
					</a></span>
				</p>
				<p class="deposit-application-details-deposit-date-info">
					<span class="deposit-application-details-deposit-date-label">{{translate 'Deposit Date:'}}</span>
					<span class="deposit-application-details-deposit-date-value">{{ depositDate}}</span>
				</p>
			</div>
		</div>
	</div>

	<div class="deposit-application-details-accordion-divider">
		<div class="deposit-application-details-accordion-head">
			<a class="deposit-application-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#deposit-application-applied-to-invoices" aria-expanded="true" aria-controls="deposit-application-applied-to-invoices">
				{{translate 'Applied to Invoices'}}
				<i class="deposit-application-details-accordion-toggle-icon"></i>
			</a>
		</div>
		<div class="deposit-application-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="deposit-application-applied-to-invoices" role="tabpanel" data-target="#deposit-application-applied-to-invoices">
			<div class="deposit-application-details-accordion-container-table">
				{{#if showInvoices}}
				<table class="deposit-application-details-table">
					<thead class="deposit-application-details-table-header">
						<th class="deposit-application-details-table-header-number">{{translate 'Number'}}</th>
						<th class="deposit-application-details-table-header-transaction-date">{{translate 'Transaction Date'}}</th>
						<th class="deposit-application-details-table-header-amount">{{translate 'Amount'}}</th>
					</thead>

					<tbody data-view="Invoices.Collection"></tbody>

					<tfoot>
						<tr>
							<td class="deposit-application-details-applied-amount" colspan="3">
								<span class="deposit-application-details-applied-amount-label">{{translate 'Applied Amount:'}} </span>
								<span class="deposit-application-details-applied-amount-value">{{ totalFormatted}}</span>
							</td>
						</tr>
					</tfoot>
				</table>
				{{/if}}
			</div>
		</div>
	</div>

	{{#if showMemo}}
	<div class="deposit-application-details-accordion-divider">
		<div class="deposit-application-details-accordion-head">
			<a class="deposit-application-details-accordion-head-toggle-secondary" data-toggle="collapse" data-target="#deposit-application-more-details" aria-expanded="true" aria-controls="deposit-application-more-details">
				{{translate 'More Details'}}
				<i class="deposit-application-details-accordion-toggle-icon-secondary"></i>
			</a>
		</div>
		<div class="deposit-application-details-accordion-body collapse" id="deposit-application-more-details" role="tabpanel" data-target="#deposit-application-more-details">
			<div class="deposit-application-details-accordion-container">
				<div class="deposit-application-details-info-card">
					<p>{{translate 'Memo:'}}</p>
					<p class="deposit-application-details-deposit-memo">{{memo}}</p>
				</div>
			</div>
		</div>
	</div>
	{{/if}}
</section>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
