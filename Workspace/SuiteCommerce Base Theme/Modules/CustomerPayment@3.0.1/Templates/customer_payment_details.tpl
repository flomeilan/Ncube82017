{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a href="/transactionhistory" class="customer-payment-details-back">
	{{translate '&lt; Back to Transaction History'}}
</a>

<section class="customer-payment-details">
	<header class="customer-payment-details-header">
		<h2>
			{{translate 'Payment <span class="customer-payment-details-header-number">#$(0)</span>' tranId}}
			<span class="customer-payment-details-header-amount">{{paymentFormatted}}</span>
		</h2>
	</header>

	{{#if showPaymentEventFail}}
		<div class="customer-payment-details-message-warning">
			{{translate 'The payment process of this purchase was not completed. To place order, please <a href="$(0)">finalize your payment.</a>' redirectUrl}}
		</div>
	{{/if}}

	<div class="customer-payment-details-information">
		<div class="customer-payment-details-information-col-date">
			<p class="customer-payment-details-information-col-date-text">
				<span class="customer-payment-details-information-col-status-label">
				{{translate 'Date:'}} </span>
				<span class="customer-payment-details-information-date">
				{{ tranDate}}
				</span>
			</p>
		</div>
		<div class="customer-payment-details-information-col-status">
			<p class="customer-payment-details-information-col-status-text">
				<span class="customer-payment-details-information-col-status-label">
				{{translate 'Status: '}}</span>
				<span class="customer-payment-details-information-status">
				{{ status}}
				</span>
			</p>
			<a href="{{{downloadPDFURL}}}" target="_blank" class="customer-payment-details-information-col-button">
				{{translate 'Download as PDF'}}
			</a>
		</div>
	</div>

	<div class="customer-payment-details-accordion-head">
		<a class="customer-payment-details-accordion-head-toggle" data-toggle="collapse" data-target="#invoice-items" aria-expanded="true" aria-controls="invoice-items">
			{{translate 'Invoices'}}
			<i class="customer-payment-details-accordion-toggle-icon"></i>
		</a>
	</div>
	<div class="customer-payment-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="invoice-items" role="tabpanel" data-target="#invoice-items">
		<div class="customer-payment-details-accordion-container" data-content="order-items-body">
			{{#if showInvoices}}
			<table class="customer-payment-details-accordion-body-container-recordviews-table">
				<thead class="customer-payment-details-accordion-body-container-recordviews-table-header">
					<tr>
						<th class="customer-payment-details-accordion-body-container-recordviews-title">
							{{translate 'Number'}}
						</th>
						<th class="customer-payment-details-accordion-body-container-recordviews-date" data-name="date">
							{{translate 'Date'}}
						</th>
						<th class="customer-payment-details-accordion-body-container-recordviews-discount" data-name="discount">
							{{translate 'Disc'}}
						</th>
						<th class="customer-payment-details-accordion-body-container-recordviews-currency" data-name="amount">
							{{translate 'Amount'}}
						</th>
					</tr>
				</thead>

				<tbody data-view="Invoices.Collection"></tbody>

				<tfoot>
					<tr>
					<td colspan="4" class="customer-payment-details-accordion-body-container-payment-total">
						<p>
						<span class="customer-payment-details-payment-total-label">
							{{translate 'Payment Total: '}}
						</span>
						<span class="customer-payment-details-payment-total-value">
							{{ paymentFormatted}}
						</span>

						</p>
					</td>
					</tr>
				</tfoot>
			</table>
			{{else}}
			<div class="customer-payment-details-noinvoices-message">
				{{translate 'This payment is not applied to any invoices.'}}
			</div>
			{{/if}}
		</div>
	</div>

	<div class="customer-payment-details-accordion-head">
		<a class="customer-payment-details-accordion-head-toggle" data-toggle="collapse" data-target="#billing-payment-items" aria-expanded="true" aria-controls="billing-payment-items">
			{{translate 'Billing & Payment Method'}}
			<i class="customer-payment-details-accordion-toggle-icon"></i>
		</a>
	</div>
	<div class="customer-payment-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="billing-payment-items" role="tabpanel" data-target="#billing-payment-items">
		<div class="customer-payment-details-accordion-container" data-content="order-items-body">
			<div class="customer-payment-details-accordion-body-container">
				{{#if showPaymentMethod}}
					<div class="customer-payment-details-accordion-body-container-payment-method">
						<div class="customer-payment-details-accordion-body-container-payment-method-card">
							<div data-view="PaymentMethod"></div>
						</div>
					</div>
				{{/if}}
				{{#if showMemo}}
					<div class="customer-payment-details-accordion-body-container-payment-memo">
						<div class="customer-payment-details-accordion-body-container-payment-memo-card">{{translate 'Memo:'}}
							<div class="customer-payment-details-accordion-body-container-payment-memo-card-info">{{memo}}</div>
						</div>
					</div>
				{{/if}}
			</div>
		</div>
	</div>

</section>




{{!----
Use the following context variables when customizing this template: 
	
	tranId (String)
	paymentFormatted (String)
	tranDate (String)
	status (String)
	memo (undefined)
	collapseElements (Boolean)
	showInvoices (Boolean)
	showPaymentMethod (Boolean)
	showMemo (Boolean)
	downloadPDFURL (String)
	showOpenedAccordion (Boolean)
	showPaymentEventFail (Boolean)

----}}
