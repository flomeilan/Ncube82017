{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a href="/purchases" class="order-history-details-back-btn">{{translate '&lt; Back to Purchases'}}</a>
<section>
	<header>
		<h2 class="order-history-details-order-title" data-origin='{{originName}}'>
			<span class="order-history-details-order-title">{{title}} </span><b> <span class="order-history-details-order-number">{{model.tranid}}</span></b>
			<span class="order-history-details-total-formatted">
				{{model.summary.total_formatted}}
			</span>
		</h2>
	</header>

	<div data-type="alert-placeholder"></div>

	{{#if showReturnAuthorizations}}
		<div class="order-history-details-message-warning" data-action="go-to-returns">
			{{translate 'You have returns associated with this order. <a href="#">View Details</a>'}}
		</div>
	{{/if}}

	{{#if showPaymentEventFail}}
		<div class="order-history-details-message-warning">
			{{translate 'The checkout process of this purchase was not completed. To place order, please <a data-navigation="ignore-click" href="$(0)" >finalize your payment.</a>' model.paymentevent.redirecturl}}
		</div>
	{{/if}}

	<!-- HEADER INFORMATION -->
	<div class="order-history-details-header-information">
		<div class="order-history-details-header-row">
			<div class="order-history-details-header-col-left">
				<p class="order-history-details-header-date-info">
					{{translate '<span class="order-history-details-header-date-info-date-label">Date: </span> <span class="order-history-details-header-date">$(0)</span>' model.trandate}}
				</p>
				{{#if showPurchaseOrderNumber}}
					<p class="order-history-details-header-purchase-order-number-info">
						{{translate '<span class="order-history-details-header-purchase-order-info-purchase-order-number-label">Purchase Order Number: </span> <span class="order-history-details-header-purchase-order-number">$(0)</span>' model.purchasenumber}}
					</p>
				{{/if}}
				{{#if showQuoteDetail}}
				<p class="order-history-details-header-quote-info">
					{{translate '<span class="order-history-details-header-quote-info-quote-label">Created from: </span> <a href="$(0)" class="order-history-details-header-date">$(1)</a>'quoteURL quoteName}}
				</p>
				{{/if}}
			</div>
			<div class="order-history-details-header-col-right">
				<p class="order-history-details-header-status-info">
					{{translate '<strong>Status: </strong> <span class="order-history-details-header-status">$(0)</span>' model.status.name}}
				</p>
			</div>
			<div class="order-history-details-header-amount">
				<p class="order-history-details-header-amount-info">
					{{translate '<span class="order-history-details-header-amount-info-amount-label">Amount: </span> <span class="order-history-details-header-amount-number">$(0)</span>' model.summary.total_formatted}}
				</p>
			</div>

		</div>
	</div>

	<div class="order-history-details-row">
		<div class="order-history-details-content-col">

			<div data-view="OrderPackages"></div>

			{{#if showNonShippableLines}}

				<div class="order-history-details-accordion-divider">
					<div class="order-history-details-accordion-head">
						<a class="order-history-details-accordion-head-toggle-secondary collapsed" data-toggle="collapse" data-target="#products-not-shipp" aria-expanded="true" aria-controls="products-not-shipp">
							{{#if nonShippableItemsLengthGreaterThan1}}
								{{translate 'Products that don\'t require shipping ($(0))' nonShippableLines.length}}
							{{else}}
								{{translate 'Product that doesn\'t require shipping ($(0))' nonShippableLines.length}}
							{{/if}}
						<i class="order-history-details-accordion-toggle-icon-secondary"></i>
						</a>
					</div>
					<div class="order-history-details-accordion-body collapse" id="products-not-shipp" role="tabpanel" data-target="#products-not-shipp">
						<div class="order-history-details-accordion-container" data-content="order-items-body">
							<table class="order-history-details-non-shippable-table">
								<tbody data-view="NonShippableLines"></tbody>
							</table>
						</div>
					</div>
				</div>

			{{/if}}

			<!-- PAYMENT INFORMATION -->
			<div class="order-history-details-accordion-divider">
				<div class="order-history-details-accordion-head">
					<a class="order-history-details-accordion-head-toggle-secondary collapsed" data-toggle="collapse" data-target="#order-payment-info" aria-expanded="true" aria-controls="order-payment-info">{{translate 'Payment Information'}}
					<i class="order-history-details-accordion-toggle-icon-secondary"></i>
					</a>
				</div>
				<div class="order-history-details-accordion-body collapse" id="order-payment-info" role="tabpanel" data-target="#order-payment-info">
					<div class="order-history-details-accordion-container" data-content="order-items-body">

						{{#if showPaymentMethod}}
							<div class="order-history-details-payment-info-cards">
								<div class="order-history-details-info-card">
									<h5 class="order-history-details-info-card-title">
										{{translate 'Payment Method'}}
									</h5>
									<div class="order-history-details-info-card-info">
										<div data-view='FormatPaymentMethod'></div>
									</div>
								</div>
								{{#if showBillAddress}}
								<div class="order-history-details-info-card">
									<h5 class="order-history-details-info-card-title">
										{{translate 'Bill to'}}
									</h5>
									<div class="order-history-details-info-card-info-billing">
										<div data-view="Billing.Address.View"></div>
									</div>
								</div>
								{{/if}}
							</div>
						{{/if}}


						<div class="order-history-details-payment" data-view="Payments"></div>

						<div class="order-history-details-payment-others" data-view="OtherPayments"></div>

					</div>
				</div>
			</div>

			<!-- PAYMENT INFORMATION ENDS -->

			{{#if showReturnAuthorizations}}
				<!-- RETURNS AUTHORIZATIONS -->
				<div class="order-history-details-accordion-divider">
					<div class="order-history-details-accordion-head collapsed">
						<a class="order-history-details-accordion-head-toggle-secondary" data-toggle="collapse" data-target="#returns-authorizations" aria-expanded="true" aria-controls="returns-authorizations">
						{{translate '<span>Returns ($(0))</span>' returnAuthorizations.totalLines}}
						<i class="order-history-details-accordion-toggle-icon-secondary"></i>
						</a>
					</div>
					<div class="order-history-details-accordion-body collapse" id="returns-authorizations" role="tabpanel" data-target="#returns-authorizations">
						<div class="order-history-details-accordion-container" data-content="order-items-body">
							<div data-view="ReturnAutorization"></div>
						</div>
					</div>
				</div>
				<!-- RETURNS AUTHORIZATIONS ENDS -->
			{{/if}}
		</div>

		<!-- SUMMARY -->
		<div class="order-history-details-summary" data-view="Summary"></div>
		<!-- SUMMARY ENDS -->
	</div>
</section>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.date (String)
	model.order_number (String)
	model.status (Object)
	model.status.internalid (String)
	model.status.name (String)
	model.summary (Object)
	model.summary.subtotal (Number)
	model.summary.subtotal_formatted (String)
	model.summary.taxtotal (Number)
	model.summary.taxtotal_formatted (String)
	model.summary.tax2total (Number)
	model.summary.tax2total_formatted (String)
	model.summary.shippingcost (Number)
	model.summary.shippingcost_formatted (String)
	model.summary.handlingcost (Number)
	model.summary.handlingcost_formatted (String)
	model.summary.estimatedshipping (Number)
	model.summary.estimatedshipping_formatted (String)
	model.summary.taxonshipping (Number)
	model.summary.taxonshipping_formatted (String)
	model.summary.discounttotal (Number)
	model.summary.discounttotal_formatted (String)
	model.summary.taxondiscount (Number)
	model.summary.taxondiscount_formatted (String)
	model.summary.discountrate (Number)
	model.summary.discountrate_formatted (String)
	model.summary.discountedsubtotal (Number)
	model.summary.discountedsubtotal_formatted (String)
	model.summary.giftcertapplied (Number)
	model.summary.giftcertapplied_formatted (String)
	model.summary.total (Number)
	model.summary.total_formatted (String)
	model.currency (Object)
	model.currency.internalid (String)
	model.currency.name (String)
	model.trackingnumbers (undefined)
	model.type (String)
	model.trantype (String)
	model.purchasenumber (undefined)
	model.dueDate (undefined)
	model.amountDue (undefined)
	model.amountDue_formatted (String)
	model.memo (String)
	model.isReturnable (Boolean)
	model.lines (Array)
	model.lines.0 (Object)
	model.lines.0.item (Object)
	model.lines.0.item.internalid (Number)
	model.lines.0.item.type (String)
	model.lines.0.quantity (Number)
	model.lines.0.internalid (String)
	model.lines.0.options (Array)
	model.lines.0.options.0 (Object)
	model.lines.0.options.0.cartOptionId (String)
	model.lines.0.options.0.itemOptionId (String)
	model.lines.0.options.0.label (String)
	model.lines.0.options.0.type (String)
	model.lines.0.options.0.value (Object)
	model.lines.0.options.0.value.internalid (String)
	model.lines.0.shipaddress (undefined)
	model.lines.0.shipmethod (undefined)
	model.lines.0.location (String)
	model.lines.0.fulfillmentChoice (String)
	model.shipmethods (Array)
	model.shipmethods.0 (Object)
	model.shipmethods.0.internalid (String)
	model.shipmethods.0.name (String)
	model.shipmethods.0.rate (Number)
	model.shipmethods.0.rate_formatted (String)
	model.shipmethods.0.shipcarrier (String)
	model.paymentmethods (Array)
	model.paymentmethods.0 (Object)
	model.paymentmethods.0.type (String)
	model.paymentmethods.0.primary (Boolean)
	model.paymentmethods.0.name (String)
	model.paymentmethods.0.creditcard (Object)
	model.paymentmethods.0.creditcard.ccnumber (String)
	model.paymentmethods.0.creditcard.ccexpiredate (String)
	model.paymentmethods.0.creditcard.ccname (String)
	model.paymentmethods.0.creditcard.internalid (String)
	model.paymentmethods.0.creditcard.paymentmethod (Object)
	model.paymentmethods.0.creditcard.paymentmethod.ispaypal (String)
	model.paymentmethods.0.creditcard.paymentmethod.name (String)
	model.paymentmethods.0.creditcard.paymentmethod.creditcard (String)
	model.paymentmethods.0.creditcard.paymentmethod.internalid (String)
	model.addresses (Array)
	model.addresses.0 (Object)
	model.addresses.0.internalid (String)
	model.addresses.0.country (String)
	model.addresses.0.state (String)
	model.addresses.0.city (String)
	model.addresses.0.zip (String)
	model.addresses.0.addr1 (String)
	model.addresses.0.addr2 (String)
	model.addresses.0.phone (String)
	model.addresses.0.fullname (String)
	model.addresses.0.company (undefined)
	model.addresses.0.isvalid (String)
	model.receipts (Array)
	model.payments (Array)
	model.returnauthorizations (Array)
	model.fulfillments (Array)
	model.internalid (String)
	model.recordtype (String)
	model.tranid (String)
	model.trandate (String)
	model.createdfrom (Object)
	model.createdfrom.internalid (String)
	model.createdfrom.name (String)
	model.createdfrom.recordtype (String)
	model.promocodes (Array)
	model.shipaddress (String)
	model.billaddress (String)
	model.shipmethod (String)
	model.origin (Number)
	model.ismultishipto (Boolean)
	model.paymentevent (Object)
	model.isCancelable (Boolean)
	model.options (Object)
	showNonShippableLines (Boolean)
	showNonShippableLinesAccordion (Boolean)
	nonShippableLines (Array)
	nonShippableLinesLengthGreaterThan1 (Boolean)
	showInStoreLines (Boolean)
	showInStoreLinesAccordion (Boolean)
	inStoreItems (Array)
	inStoreLinesLengthGreaterThan1 (Boolean)
	lines (Array)
	collapseElements (Boolean)
	showBillAddress (Boolean)
	showOrderShipAddress (Boolean)
	orderShipaddress (Object)
	orderShipaddress.internalid (String)
	orderShipaddress.country (String)
	orderShipaddress.state (String)
	orderShipaddress.city (String)
	orderShipaddress.zip (String)
	orderShipaddress.addr1 (String)
	orderShipaddress.addr2 (String)
	orderShipaddress.phone (String)
	orderShipaddress.fullname (String)
	orderShipaddress.company (undefined)
	orderShipaddress.isvalid (String)
	showReturnAuthorizations (Boolean)
	returnAuthorizations (Array)
	deliveryMethodName (String)
	showDeliveryMethod (Boolean)
	isInStore (Boolean)
	showPaymentMethod (Boolean)
	initiallyCollapsed (String)
	initiallyCollapsedArrow (String)
	originName (String)
	title (String)
	showPaymentEventFail (Boolean)
	showQuoteDetail (String)
	quoteName (String)
	quoteURL (String)
	showPurchaseOrderNumber (Boolean)

----}}
