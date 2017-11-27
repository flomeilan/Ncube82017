{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a href="/transactionhistory" class="credit-memo-details-back">
	{{translate '&lt; Back to Transaction History'}}
</a>
<section class="credit-memo-details">
	<header class="credit-memo-details-header">
		<h2 class="credit-memo-details-title">
			{{translate 'Credit Memo #$(0)' tranId}}
			<span class="credit-memo-details-header-payment-amount">{{totalFormatted}}</span>
		</h2>
	</header>

	<div class="credit-memo-details-information">
		<div class="credit-memo-details-information-col-date">
			<p class="credit-memo-details-information-col-date-text">{{translate '<span class="credit-memo-details-date-label">Date: </span> <span  class="credit-memo-details-information-date">$(0)</span>' tranDate}}</p>
		</div>
		<div class="credit-memo-details-information-col-status">
			<p class="credit-memo-details-information-col-status-text">{{translate '<span class="credit-memo-details-status-label">Status: </span> <span  class="credit-memo-details-information-status">$(0)</span>' status}}</p>
		</div>
	</div>

	<div class="credit-memo-details-row">
		<div class="credit-memo-details-content-col">
			<div class="credit-memo-details-accordion-divider">
				<div class="credit-memo-details-accordion-head">
					<a class="credit-memo-details-accordion-head-toggle" data-toggle="collapse" data-target="#credit-memo-details-products" aria-expanded="true" aria-controls="credit-memo-details-products">
						{{translate 'Product'}}
					<i class="credit-memo-details-accordion-toggle-icon"></i>
					</a>
				</div>
				<div class="credit-memo-details-accordion-body collapse in" id="credit-memo-details-products" role="tabpanel" data-target="#credit-memo-details-products">
					<div data-content="items-body">

						<table class="credit-memo-details-table-flex-item-navigable">
							<thead class="credit-memo-details-table-products-header">
								<th class="credit-memo-details-table-products-header-image"></th>
								<th class="credit-memo-details-table-products-header-product">{{translate 'Product'}}</th>
								<th class="credit-memo-details-table-products-header-unit-price">{{translate 'Unit price'}}</th>
								<th class="credit-memo-details-table-products-header-qty">{{translate 'Quantity'}}</th>
								<th class="credit-memo-details-table-products-header-amount">{{translate 'Amount'}}</th>
							</thead>
							<tbody data-view="Items.Collection"></tbody>
						</table>

						<div class="credit-memo-details-accordion-body-container-payment-total">
							<p><span class="credit-memo-details-accordion-body-container-payment-total-label">{{translate 'Items subtotal: '}}</span> <span class="credit-memo-details-accordion-body-container-payment-total-value">{{ subTotalFormatted}}</span></p>
						</div>
					</div>
				</div>
			</div>

			<div class="credit-memo-details-accordion-divider">
				<div class="credit-memo-details-accordion-head">
					<a class="credit-memo-details-accordion-head-toggle" data-toggle="collapse" data-target="#credit-memo-details-invoice" aria-expanded="true" aria-controls="credit-memo-details-products">
						{{translate 'Applied to Invoices'}}
					<i class="credit-memo-details-accordion-toggle-icon"></i>
					</a>
				</div>
				<div class="credit-memo-details-accordion-body collapse in" id="credit-memo-details-invoice" role="tabpanel" data-target="#credit-memo-details-invoice">
					<div data-content="items-body">
					{{#if showInvoicesDetails}}

						<table class="credit-memo-details-table-product">
							<thead class="credit-memo-details-table-invoices-header">
								<th class="credit-memo-details-table-invoices-header-title-record"></th>
								<th class="credit-memo-details-table-invoices-header-date-record">{{translate 'Date'}}</th>
								<th class="credit-memo-details-table-invoices-header-amount-record">{{translate 'Amount'}}</th>
							</thead>


							<tbody data-view="Invoices.Collection"></tbody>

							<tfoot>
							<tr>
							<td class="credit-memo-details-accordion-body-container-payment-total" colspan="3">
								<p><span class="credit-memo-details-accordion-body-container-payment-total-label">{{translate 'Applied Subtotal: '}}</span> <span class="credit-memo-details-accordion-body-container-payment-total-value">{{ amountPaidFormatted}}</span></p>
								<p><span class="credit-memo-details-accordion-body-container-payment-total-label">{{translate 'Remaining subtotal: '}}</span> <span class="credit-memo-details-accordion-body-container-payment-total-value">{{ amountRemainingFormatted}}</span></p>
							</td>
							</tr>
							</tfoot>
						</table>
					{{else}}
						<div class="credit-memo-details-accordion-body-container-message">
							<p>{{translate 'This Credit Memo has not been applied to any invoices yet.'}}</p>
						</div>
					{{/if}}
					</div>
				</div>
			</div>

			{{#if showMemoDetails}}
			<div class="credit-memo-details-accordion-divider">
				<div class="credit-memo-details-accordion-head">
					<a class="credit-memo-details-accordion-head-toggle" data-toggle="collapse" data-target="#credit-memo-details-memo" aria-expanded="true" aria-controls="credit-memo-details-memo">
							{{translate 'More Details'}}
					<i class="credit-memo-details-accordion-toggle-icon"></i>
					</a>
				</div>
				<div class="credit-memo-details-accordion-body collapse in" id="credit-memo-details-memo" role="tabpanel" data-target="#credit-memo-details-memo">
					<div class="credit-memo-details-accordion-body-container-message">
						<p>{{translate 'Memo:'}} <span class="credit-memo-details-memo">{{memo}}</span></p>
					</div>
				</div>
			</div>	
			{{/if}}
		</div>

		<div class="credit-memo-details-summary-col">

			<div class="credit-memo-details-row-fluid">
				<div class="credit-memo-details-summary-container">
					<h3 class="credit-memo-details-summary-title">{{translate 'ITEMS SUMMARY'}}</h3>
					<p class="credit-memo-details-summary-grid-float">
						<span class="credit-memo-details-summary-subtotal">
							{{subTotalFormatted}}
						</span>
						{{translate 'Subtotal'}}
						<span class="credit-memo-details-summary-items">
							{{#if linesitemsNumberGreaterThan1}}
								{{itemsQuantityNumber}} {{translate 'Items'}}
							{{else}}
								{{itemsQuantityNumber}} {{translate 'Item'}}
							{{/if}}
						</span>
					</p>
					<p class="credit-memo-details-summary-grid-float">
						<span class="credit-memo-details-summary-discount">
							{{discountFormatted}}
						</span>
						{{translate 'Discount'}}
					</p>
					<p class="credit-memo-details-summary-grid-float">
						<span class="credit-memo-details-summary-tax">
							{{taxTotalFormatted}}
						</span>
						{{translate 'Tax Item'}}
					</p>
					<p class="credit-memo-details-summary-grid-float">
						<span class="credit-memo-details-summary-shipping-cost">
							{{shippingCostFormatted}}
						</span>
						{{translate 'Shipping Cost'}}
					</p>
					<div class="credit-memo-details-summary-total-container">
						<p class="credit-memo-details-summary-grid-float">
							<span class="credit-memo-details-summary-total">
								{{totalFormatted}}
							</span>
							{{translate 'Total'}}
						</p>
					</div>
				</div>

				<div class="credit-memo-details-buttons-container">
					<a href="{{{downloadPDFURL}}}" target="_blank" class="credit-memo-details-button-download-as-pdf">{{translate 'Download as PDF'}}</a>
				</div>
			</div>

		</div>
	</div>


</section>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
