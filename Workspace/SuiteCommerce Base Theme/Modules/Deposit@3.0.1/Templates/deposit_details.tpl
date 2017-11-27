{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="deposit-details">
	<header>
		<h2 class="deposit-details-header-title">
			{{translate 'Deposit <span class="deposit-details-number">#$(0)</span>' tranId}}
			<span class="deposit-details-deposit-payment">{{paymentFormatted}}</span>
		</h2>
		<a href="/transactionhistory" class="deposit-details-back-btn">
			{{translate '&lt; Back to Transaction History'}}
		</a>
	</header>

	<div class="deposit-details-header-information">
		<div class="deposit-details-row">
			<div class="deposit-details-header-col-left">
				<p class="deposit-details-date-info">
					<span class="deposit-details-date-label">{{translate 'Date: '}}</span>
					<span class="deposit-details-date-value"> {{tranDate}}</span>
				</p>
			</div>
			<div class="deposit-details-header-col-right">
				<p class="deposit-details-status-info">
					 <span class="deposit-details-status-label">{{translate 'Status: '}}</span>
					 <span class="deposit-details-status-value">{{status}}</span>
				</p>
			</div>
		</div>

		<div class="deposit-details-row">
			<div class="deposit-details-button-container">
			<a href="{{{downloadPDFURL}}}" target="_blank" class="deposit-details-button-download-as-pdf">{{translate 'Download as PDF'}}</a>
			</div>
		</div>
	</div>

	<div class="deposit-details-accordion-divider">
		<div class="deposit-details-accordion-head">
			<a class="deposit-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#deposit-applied-to-invoices" aria-expanded="true" aria-controls="deposit-applied-to-invoices">
				{{translate 'Applied to Invoices'}}
				<i class="deposit-details-accordion-toggle-icon"></i>
			</a>
		</div>
		<div class="deposit-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="deposit-applied-to-invoices" role="tabpanel" data-target="#deposit-applied-to-invoices">
			<div class="deposit-details-accordion-container-table">
				{{#if showInvoices}}
				<table class="deposit-details-invoice-table">
					<thead class="deposit-details-invoice-table-heading">
						<th class="deposit-details-invoice-table-heading-number">{{translate 'Number'}}</th>
						<th class="deposit-details-invoice-table-heading-date">{{translate 'Invoice Date'}}</th>
						<th class="deposit-details-invoice-table-heading-date-applied">{{translate 'Date Applied'}}</th>
						<th class="deposit-details-invoice-table-heading-amount">{{translate 'Amount'}}</th>
					</thead>
					<tbody data-view="Invoices.Collection"></tbody>

					<tfoot>
						<tr>
							<td colspan="4" class="deposit-details-applied-amount">
								<span class="deposit-details-applied-amount-label">{{translate 'Applied Amount:'}} </span>
								<span class="deposit-details-applied-amount-value">{{ paidFormatted}}</span>
							</td>
						</tr>

						<tr>
							<td colspan="4" class="deposit-details-remaining-amount">
								<span class="deposit-details-remaining-amount-label">{{translate 'Remaining Amount:'}} </span>
								<span class="deposit-details-remaining-amount-value">{{ remainingFormatted}}</span>
							</td>
						</tr>
					</tfoot>
				</table>
				{{else}}
				<div class="deposit-details-row">
					<div class="deposit-details-deposit-message">
					{{translate 'This Deposit has not been applied to any invoices yet.'}}
					</div>
				</div>
				{{/if}}
			</div>
		</div>
	</div>

	<div class="deposit-details-accordion-divider">
		<div class="deposit-details-accordion-head">
			<a class="deposit-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#deposit-billing" aria-expanded="true" aria-controls="deposit-billing">
				{{translate 'Billing & Payment Method'}}
				<i class="deposit-details-accordion-toggle-icon"></i>
			</a>
		</div>
		<div class="deposit-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="deposit-billing" role="tabpanel" data-target="#deposit-billing">
			<div class="deposit-details-accordion-container">
				<div class="deposit-details-row">
					<div class="deposit-details-info-card-grid">
						<div class="deposit-details-info-card">
							{{#if showPaymentMethod}}
								<div class="deposit-details-method">
									<div data-view="PaymentMethod"></div>
								</div>
							{{/if}}
						</div>
						{{#if showMemo}}
						<div class="deposit-details-info-card-grid">
							<div class="deposit-details-info-card">
								<span class="deposit-details-memo-title">{{translate 'Memo:'}}</span>
								<span class="deposit-details-memo-value">{{memo}}</span>
							</div>
						</div>
						{{/if}}
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
