{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if haveCreatedFrom}}
	{{translate '<a href="/purchases/view/$(1)/$(2)" class="receipt-details-back-btn">&lt; Back to $(0)</a>' model.createdfrom.name model.createdfrom.recordtype model.createdfrom.internalid}}
{{else}}
	<a href="/transactionhistory" class="receipt-details-back-btn">{{translate '&lt; Back to Transaction History'}}
	</a>
{{/if}}
<section>
	<header>
		<h2 class="receipt-details-order-title">
			{{translate 'Receipt <span class="tranid">#$(0)</span>' orderNumber}}
			<span class="receipt-details-title-header-amount">
				{{totalFormatted}}
			</span>
		</h2>
		
	</header>

	<!-- HEADER INFORMATION -->
	<div class="receipt-details-header-information">
		<div class="receipt-details-header-row">
			<div class="receipt-details-header-col-left">
				<p class="receipt-details-header-date-info">
					{{translate '<span class="receipt-details-header-date-label">Date: </span> <span class="receipt-details-header-date">$(0)</span>' date}}
				</p>
			</div>
			<div class="receipt-details-header-col-right">
				<p class="receipt-details-header-status-info">
					{{translate '<span class="receipt-details-header-status-label">Status: </span> <span class="receipt-details-header-status">$(0)</span>' status}}
				</p>
			</div>
			<div class="receipt-details-header-amount">
				<p class="receipt-details-header-amount-info">
					{{translate '<span class="receipt-details-header-amount-label">Amount: </span> <span class="receipt-details-header-amount-number">$(0)</span>' totalFormatted}}
				</p>
			</div>
		</div>
	</div>

	<div class="receipt-details-row">
		<div class="receipt-details-content-col">
			<!-- ITEMS -->
			{{#if showLines}}
			<div class="receipt-details-accordion-divider">
				<div class="receipt-details-accordion-head">
					<a class="receipt-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#receipt-products-list" aria-expanded="true" aria-controls="#receipt-products-list">
						{{#if isLinesLengthGreaterThan1}}
							{{translate 'Products (<span class="receipt-details-items-count">$(0)</span>)' linesLength}}
						{{else}}
							{{translate 'Product (<span class="receipt-details-items-count">$(0)</span>)' linesLength}}
						{{/if}}
					<i class="receipt-details-accordion-toggle-icon"></i>
					</a>
				</div>
				<div class="receipt-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="receipt-products-list" role="tabpanel" data-target="#receipt-products-list">
					<div class="receipt-details-accordion-container" data-content="order-items-body">
						<table class="receipt-details-item-details-table">
							<tbody data-view="Item.Details.Line"></tbody>
						</table>
					</div>
				</div>
			</div>
			{{/if}}

			<div class="receipt-details-accordion-divider">
				<!-- PAYMENT INFORMATION -->
				<div class="receipt-details-accordion-head">
					<a class="receipt-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#receipt-payment-info" aria-expanded="true" aria-controls="#receipt-payment-info">
						{{translate 'Payment Information'}}
						<i class="receipt-details-accordion-toggle-icon"></i>
					</a>
				</div>

				<div class="receipt-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="receipt-payment-info" role="tabpanel" data-target="#receipt-payment-info">
					<div class="receipt-details-accordion-container" data-content="order-items-body">
						<div class="receipt-details-info-card">
							<h5 class="receipt-details-info-card-title">
									{{translate 'Payment Method:'}}
							</h5>
		
							<div class="receipt-details-info-card-info">
								{{#if showPaymentMethod}}
									<div data-view="FormatPaymentMethod"></div>
								{{else}}
									{{translate 'N/A'}}
								{{/if}}
							</div>
						</div>
											
						<div class="receipt-details-info-card">
							<h5 class="receipt-details-info-card-title">
									{{translate 'Bill to:'}}
							</h5>
		
							<div class="receipt-details-info-card-info-billing">
								<address>
								{{#if showBillingAddress}}
									<div data-view="Address.View"></div>
								{{else}}
									{{translate 'N/A'}}
								{{/if}}
								</address>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="receipt-details-summary-col">
			<div class="receipt-details-summary-container">
					<!-- SUMMARY -->
					<h3 class="receipt-details-summary-title">
						{{translate 'SUMMARY'}}
					</h3>
					<div class="receipt-details-summary-subtotal">
						<p class="receipt-details-summary-grid-float">
							<span class="receipt-details-summary-amount-subtotal">
								{{subTotalFormatted}}
							</span>
							{{translate 'Subtotal'}}
							<span class="receipt-details-summary-subtotal-items">
								{{#if itemsQuantityLengthGreaterThan1}}
									{{itemsQuantityNumber}} {{translate 'Items'}}
								{{else}}
									{{itemsQuantityNumber}} {{translate 'Item'}}
								{{/if}}
							</span>
						</p>
					</div>

					{{#if showDiscountTotal}}
					<p class="receipt-details-summary-grid-float">
						<span class="receipt-details-summary-amount-discount">
						{{discountTotalFormatted}}
						</span>
							{{translate 'Discount'}}
					</p>
					{{/if}}

					{{#if showShippingCost}}
					<p class="receipt-details-summary-grid-float">
						<span class="receipt-details-summary-amount-shipping">
							<span class="receipt-details-summary-shippingcost">{{shippingCostFormatted}}</span>
						</span>
						{{translate 'Shipping Total'}}
					</p>
					{{/if}}

					{{#if showHandlingCost}}
					<p class="receipt-details-summary-grid-float">
						<span class="receipt-details-summary-amount-handling">
							{{handlingCostFormatted}}
						</span>
						{{translate 'Handling Total'}}
					</p>
					{{/if}}

					{{#if showPromocode}}
					<p class="receipt-details-summary-grid-float">
						<span class="receipt-details-summary-amount-promocode">
						{{promocode}}
						</span>
						{{translate 'Promo Code'}}
					</p>
					{{/if}}

					<p class="receipt-details-summary-grid-float">
						<span class="receipt-details-summary-amount-tax">
						{{taxTotalFormatted}}
						</span>
						{{translate 'Tax Total'}}
					</p>

					<div class="receipt-details-summary-total">
						<p class="receipt-details-summary-grid-float">
							<span class="receipt-details-summary-amount-total">
								{{totalFormatted}}
							</span>
							{{translate 'Total'}}
						</p>
					</div>	
				</div>

				<!-- DOWNLOAD AS PDF -->
				<div class="receipt-details-row-fluid">
					<a href="{{pdfUrl}}" target="_blank" class="receipt-details-button-download-pdf">
						{{translate 'Download as PDF'}}
					</a>
				</div>
		</div>
	</div>
</section>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
