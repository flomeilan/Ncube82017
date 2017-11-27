{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a href="/quotes" class="quote-details-header-back-btn">{{translate '&lt; Back to quotes'}}</a>
<section class="quote-details">
	<div class="quote-details-view">
		<header>
			<h2 class="quote-details-header-title">
				{{translate 'Quote '}}
				<span class="quote-details-quote-id">{{tranid}}</span>

				<span class="quote-details-header-amount-total">
					{{summary.total_formatted}}
				</span>
			</h2>
		</header>

		<!--GENERATE HEADER -->
		<div class="quote-details-header-information">
			<div class="quote-details-row">
				<div class="quote-details-header-col-left">
					<p class="quote-details-header-info-request-date">
						<span class="quote-details-header-label-request-date">{{translate 'Request date: '}}</span>
						<span class="quote-details-header-value-date">{{model.trandate}}</span>
					</p>
					<p class="quote-details-header-info-expiration-date">
						<span class="quote-details-header-info-expiration-date-label">{{translate 'Expiration date: ' }}</span>
						{{#if hasDuedate}}
							<span class="quote-details-header-info-expiration-date-value">{{duedate}}</span>

							{{#if model.isOverdue }}
								<i class="quote-details-header-info-expiration-date-icon-overdue"></i>
							{{else}}
								{{#if model.isCloseOverdue}}
									<i class="quote-details-header-info-expiration-date-icon-closeoverdue"></i>
								{{/if}}
							{{/if}}
						{{else}}
							<span class="quote-details-header-info-expiration-date-value">{{translate 'Not specified'}}</span>
						{{/if}}
					</p>
				</div>
				<div class="quote-details-header-col-right">
				{{#if showQuoteStatus}}
					<p class="quote-details-header-info-status">
						<span class="quote-details-header-label-status">{{translate 'Status: '}}</span>
						<span class="quote-details-header-value-status">{{entityStatusName}}</span>
					</p>
				{{/if}}
				</div>
			</div>
		</div>

		<!-- CONTENT -->
		<div class="quote-details-row">
			<div class="quote-details-content-col">

				<div class="quote-details-accordion-divider">
					<div class="quote-details-accordion-head">
							<a class="quote-details-accordion-head-toggle {{#unless showOpenedAccordion}}collapsed{{/unless}}" data-toggle="collapse" data-target="#quote-products" aria-expanded="true" aria-controls="#quote-products">
								{{translate 'Items ($(0))' lineItemsLength}}
							<i class="quote-details-accordion-toggle-icon"></i>
						</a>
					</div>

						<div class="quote-details-accordion-body collapse  {{#if showOpenedAccordion}}in{{/if}}" id="quote-products" role="tabpanel" data-target="#quote-products">
						<table class="quote-details-products-table lg2sm-first">
							<tbody data-view="Items.Collection"></tbody>
						</table>
					</div>
				</div>

				<!-- COMMENTS/MEMO -->
				{{#if showMemo}}
					<div class="quote-details-accordion-divider">

						<div class="quote-details-accordion-head">
							<a class="quote-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#quote-comments" aria-expanded="false" aria-controls="#quote-comments">
								{{translate 'My comments'}}
								<i class="quote-details-accordion-toggle-icon"></i>
							</a>
						</div>

						<div class="quote-details-accordion-body collapse" id="quote-comments" role="tabpanel" data-target="quote-comments">
							<div class="quote-details-accordion-container">
								<div class="quote-details-comments-row">
									{{breaklines memo}}
								</div>
							</div>
						</div>
					</div>
				{{/if}}

				<!-- BILLADDRESS -->
				{{#if showBillingAddress}}
					<div class="quote-details-accordion-divider">
						<div class="quote-details-accordion-head">
							<a class="quote-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#quote-billing-info" aria-expanded="false" aria-controls="#quote-billing-info">
								{{translate 'Payment Information'}}
								<i class="quote-details-accordion-toggle-icon"></i>
							</a>
						</div>
						<div class="quote-details-accordion-body collapse" id="quote-billing-info" role="tabpanel" data-target="quote-billing-info">
							<div class="quote-details-accordion-container">
								<div class="quote-details-billing-row">
									<div class="quote-details-billing-info-card">
										<h5 class="quote-details-billing-info-card-title">
											{{translate 'Bill to:'}}
										</h5>
										<div data-view="Billing.Address"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				{{/if}}

				<!-- MESSAGE -->
				{{#if showMessage}}
					<div class="quote-details-accordion-divider">

						<div class="quote-details-accordion-head">
							<a class="quote-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#quote-messages" aria-expanded="false" aria-controls="#quote-messages">
								{{translate 'Message from Sales Representative'}}
								<i class="quote-details-accordion-toggle-icon"></i>
							</a>
						</div>

						<div class="quote-details-accordion-body collapse" id="quote-messages" role="tabpanel" data-target="quote-messages">
							<div class="quote-details-accordion-container">
								<div class="quote-details-message-row">
								{{breaklines message}}
								</div>
							</div>
						</div>
					</div>
				{{/if}}

				<div class="quote-details-disclaimer-bottom-content">
					{{#if hasSalesrep}}
						<small class="quote-details-disclaimer-message">{{translate 'For immediate assistance contact <strong>$(0)</strong> at <strong>$(1)</strong>. For additional information, send an email to <strong>$(2)</strong>.' salesrepName salesrepPhone salesrepEmail}}</small>
					{{else}}
						<small class="quote-details-disclaimer-message">{{{disclaimer}}}</small>
					{{/if}}
				</div>
			</div>

			<!-- SUMMARY -->
			<div class="quote-details-summary-col">
				<div class="quote-details-summary-container">
					<h3 class="quote-details-summary-title">
						{{translate 'SUMMARY'}}
					</h3>
					<div class="quote-details-summary-subtotal">
						<p class="quote-details-summary-grid-float">
							<span class="quote-details-summary-amount-subtotal">
							{{summary.subtotal_formatted}}
							</span>
							{{translate 'Subtotal'}}
						</p>
					</div>

					{{#if showDiscount}}
						<p class="quote-details-summary-grid-float">
							<span class="quote-details-summary-amount-discount">
								{{summary.discounttotal_formatted}}
							</span>
							{{translate 'Discount'}}
						</p>
						<div class="quote-details-summary-grid">
							<div class="quote-details-summary-amount-discount-text-success">
								<span class="quote-details-summary-amount-discount-code">
								{{#if true}}
									({{model.discount.name}})
								{{/if}}
								</span>
							</div>
						</div>
					{{/if}}

					{{#if showPromocode}}
						<p class="quote-details-summary-grid-float">
							<span class="quote-details-summary-promo-code">
								{{model.summary.discountrate_formatted}}
							</span>
							{{translate 'Promo Code Applied'}}
						</p>
						<div class="quote-details-summary-grid">
							<div class="quote-details-summary-promocode-text-success">
								<span class="quote-details-summary-promocode-code">#{{model.promocode.code}}</span>
							</div>
						</div>
					{{/if}}

					<p class="quote-details-summary-grid-float">
						<span class="quote-details-summary-amount-shipping">
						{{summary.shippingcost_formatted}}
						</span>
						{{translate 'Shipping'}}
					</p>

					{{#if showHandlingCost}}
					<p class="quote-details-summary-grid-float">
						<span class="quote-details-summary-handling-cost-formatted">
							{{summary.handlingcost_formatted}}
						</span>
						{{translate 'Handling'}}
					</p>
					{{/if}}

					<p class="quote-details-summary-grid-float">
						<span class="quote-details-summary-amount-tax">
						{{summary.taxtotal_formatted}}
						</span>
						{{translate 'Tax Total'}}
					</p>

					<div class="quote-details-summary-total">
						<p class="quote-details-summary-grid-float">
							<span class="quote-details-summary-amount-total">
							{{summary.total_formatted}}
							</span>
							{{translate 'Total'}}
						</p>
					</div>

				</div>
				<div class="quote-details-row-fluid">

					{{#if isOpen}}
						{{#unless model.purchasablestatus.isPurchasable}}
							<div data-type="quote-details-and-order-msg-placeholder">
								<div class="quote-details-msg">
									{{#if hasPermissionAndHasErrors}}
										<p>{{translate 'The following information is needed:'}}</p>
										<ul>
											{{#each purchaseValidationErrors}}
												<li>- {{this}}</li>
											{{/each}}
										</ul>
									{{/if}}

									{{#if hasSalesrep}}
										<p>{{translate 'To place the order please contact <strong>$(0)</strong> at <strong>$(1)</strong> or send an email to <strong>$(2)</strong>' salesrepName salesrepPhone salesrepEmail}}</p>
									{{else}}
										<p>{{{disclaimerSummary}}}</p>
									{{/if}}
								</div>

								{{#if showGiftCertificateMessage}}
									<div class="quote-details-msg-certificate">
										<p>
											<i class="quote-details-msg-certificate-icon"></i>
											{{translate 'Gift Certificate not allowed'}}
										</p>
									</div>
								{{/if}}
							</div>
						{{/unless}}

						{{#if hasPermission}}
							<a href="{{reviewQuoteURL}}" class="quote-details-button-review-and-order" {{#unless model.purchasablestatus.isPurchasable}}disabled{{/unless}}>{{translate 'Review and Place Order'}}</a>
						{{/if}}
					{{/if}}
					<a href="{{pdfUrl}}" target="_blank" class="quote-details-button-download-pdf">{{translate 'Download as PDF'}}</a>
				</div>
				<div class="quote-details-disclaimer-bottom">
					{{#if hasSalesrep}}
						<small class="quote-details-disclaimer-message">{{translate 'For immediate assistance contact <strong>$(0)</strong> at <strong>$(1)</strong>. For additional information, send an email to <strong>$(2)</strong>.' salesrepName salesrepPhone salesrepEmail}}</small>
					{{else}}
						<small class="quote-details-disclaimer-message">{{{disclaimer}}}</small>
					{{/if}}
				</div>
			</div>
		</div>
	</div>
</section>




{{!----
Use the following context variables when customizing this template: 
	
	tranid (String)
	model (Object)
	model.internalid (String)
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
	model.shipmethods (Array)
	model.shipmethods.0 (Object)
	model.shipmethods.0.internalid (String)
	model.shipmethods.0.name (String)
	model.shipmethods.0.rate (Number)
	model.shipmethods.0.rate_formatted (String)
	model.shipmethods.0.shipcarrier (String)
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
	model.lines.0.options.0.value.label (String)
	model.lines.0.options.0.value.internalid (String)
	model.lines.0.shipaddress (undefined)
	model.lines.0.shipmethod (undefined)
	model.lines.0.location (String)
	model.lines.0.fulfillmentChoice (String)
	model.paymentmethods (Array)
	model.paymentmethods.0 (Object)
	model.paymentmethods.0.type (String)
	model.paymentmethods.0.primary (Boolean)
	model.paymentmethods.0.name (undefined)
	model.paymentmethods.0.paymentterms (Object)
	model.paymentmethods.0.paymentterms.internalid (String)
	model.paymentmethods.0.paymentterms.name (String)
	model.recordtype (String)
	model.tranid (String)
	model.memo (undefined)
	model.trandate (String)
	model.currency (Object)
	model.currency.internalid (String)
	model.currency.name (String)
	model.createdfrom (Object)
	model.createdfrom.internalid (undefined)
	model.createdfrom.name (undefined)
	model.createdfrom.recordtype (String)
	model.status (Object)
	model.status.internalid (String)
	model.status.name (undefined)
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
	model.promocodes (Array)
	model.purchasenumber (undefined)
	model.shipaddress (String)
	model.billaddress (String)
	model.shipmethod (String)
	model.entitystatus (Object)
	model.entitystatus.id (String)
	model.entitystatus.name (String)
	model.statusRef (String)
	model.message (String)
	model.allowToPurchase (Boolean)
	model.isOpen (Boolean)
	model.purchasablestatus (Object)
	model.purchasablestatus.isPurchasable (Boolean)
	model.purchasablestatus.validationErrors (Array)
	model.purchasablestatus.validationErrors.0 (String)
	model.discount (undefined)
	model.duedate (String)
	model.isOverdue (Boolean)
	model.isCloseOverdue (Boolean)
	model.expectedclosedate (String)
	model.options (Object)
	lineItemsLength (Number)
	entityStatusName (String)
	pdfUrl (String)
	reviewQuoteURL (String)
	showPromocode (Boolean)
	showDiscount (Boolean)
	showBillingAddress (Boolean)
	showMessage (Boolean)
	message (String)
	showMemo (Boolean)
	memo (undefined)
	collapseElements (Boolean)
	summary (Object)
	summary.subtotal (Number)
	summary.subtotal_formatted (String)
	summary.taxtotal (Number)
	summary.taxtotal_formatted (String)
	summary.tax2total (Number)
	summary.tax2total_formatted (String)
	summary.shippingcost (Number)
	summary.shippingcost_formatted (String)
	summary.handlingcost (Number)
	summary.handlingcost_formatted (String)
	summary.estimatedshipping (Number)
	summary.estimatedshipping_formatted (String)
	summary.taxonshipping (Number)
	summary.taxonshipping_formatted (String)
	summary.discounttotal (Number)
	summary.discounttotal_formatted (String)
	summary.taxondiscount (Number)
	summary.taxondiscount_formatted (String)
	summary.discountrate (Number)
	summary.discountrate_formatted (String)
	summary.discountedsubtotal (Number)
	summary.discountedsubtotal_formatted (String)
	summary.giftcertapplied (Number)
	summary.giftcertapplied_formatted (String)
	summary.total (Number)
	summary.total_formatted (String)
	duedate (String)
	hasDuedate (Boolean)
	hasSalesrep (Boolean)
	salesrepPhone (String)
	salesrepEmail (String)
	disclaimerSummary (String)
	disclaimer (String)
	purchaseValidationErrors (Array)
	isOpen (Boolean)
	showOpenedAccordion (Boolean)
	hasPermission (Boolean)
	showHandlingCost (Boolean)
	hasPermissionAndHasErrors (Number)
	showQuoteStatus (Boolean)

----}}
