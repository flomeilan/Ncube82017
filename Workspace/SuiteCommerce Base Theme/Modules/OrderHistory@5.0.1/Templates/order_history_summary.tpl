{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-history-summary-summary-col">
	<div class="order-history-summary-summary-container">
		<!-- SUMMARY -->
		<h3 class="order-history-summary-summary-title">
			{{translate 'Summary'}}
		</h3>
		<div class="order-history-summary-summary-subtotal">
			<p class="order-history-summary-summary-grid-float">
				<span class="order-history-summary-summary-amount-subtotal">
					{{model.summary.subtotal_formatted}}
				</span>
				{{translate 'Subtotal'}}

			</p>
		</div>

		{{#if showSummaryHandlingCost}}
			<p class="order-history-summary-summary-grid-float">
				<span class="order-history-summary-summary-amount-handling">
					{{model.summary.handlingcost_formatted}}
				</span>
				{{translate 'Handling Total'}}
			</p>
		{{/if}}

		{{#if showSummaryGiftCertificateTotal}}
			<p class="order-history-summary-summary-grid-float">
				<span class="order-history-summary-summary-amount-certificate">
					{{model.summary.giftcertapplied_formatted}}
				</span>
				{{translate 'Gift Cert Total'}}
			</p>
		{{/if}}

		{{#if showSummaryPromocode}}
			<div data-view="CartPromocodeListView"></div>
		{{/if}}

		{{#if showSummaryDiscount}}
			<p class="order-history-summary-summary-grid-float">
				<span class="order-history-summary-summary-amount-discount">
					{{model.summary.discounttotal_formatted}}
				</span>
				{{translate 'Discount Total'}}
			</p>
		{{/if}}

		{{#if showSummaryShippingCost}}
			<p class="order-history-summary-summary-grid-float">
				<span class="order-history-summary-summary-amount-shipping">
					{{model.summary.shippingcost_formatted}}
				</span>
				{{translate 'Shipping Total'}}
			</p>
		{{/if}}
		{{#if showSummaryPickupCost}}
			<p class="order-history-summary-summary-grid-float">
				{{translate 'Pick Up'}}
				<span class="order-history-summary-pickup-label-free"> {{translate 'FREE'}}</span>
			</p>
		{{/if}}

		{{#if model.summary.taxtotal}}
		<p class="order-history-summary-summary-grid-float">
			<span class="order-history-summary-summary-amount-tax">
				{{model.summary.taxtotal_formatted}}
			</span>
			{{translate taxLabel}}
		</p>
		{{/if}}

		{{#if model.summary.tax2total}}
		<p class="order-history-summary-summary-grid-float">
			<span class="order-history-summary-summary-amount-tax">
				{{model.summary.tax2total_formatted}}
			</span>
			{{translate 'PST'}}
		</p>
		{{/if}}
		<div class="order-history-summary-summary-total">
			<p class="order-history-summary-summary-grid-float">
				<span class="order-history-summary-summary-amount-total">
					{{model.summary.total_formatted}}
				</span>
				{{translate 'Total'}}
			</p>
		</div>
	</div>

	<div class="order-history-summary-row-fluid">
		{{#if showReorderAllItemsButton}}
			<!-- REORDER ALL ITEMS -->
			<a href="/reorderItems?order_id={{model.internalid}}&order_number={{model.tranid}}" class="order-history-summary-button-reorder">
				{{translate 'Reorder All Items'}}
			</a>
		{{/if}}

		<!-- DOWNLOAD AS PDF -->
		<a href="{{pdfUrl}}" target="_blank" class="order-history-summary-button-download-pdf">
			{{translate 'Download PDF'}}
		</a>

		{{#if showRequestReturnButton}}
			<a data-permissions="transactions.tranRtnAuth.2" href="/returns/new/{{model.recordtype}}/{{model.internalid}}" class="order-history-summary-button-request-return">
				{{translate 'Request a Return'}}
			</a>
		{{/if}}

		{{#if showCancelButton}}
			<a class="order-history-summary-button-cancel-order" data-action="cancel">
				{{translate 'Cancel Purchase'}}
			</a>
		{{/if}}

		{{#if showViewInvoiceButton}}
			<a data-permissions="" href="/invoices/{{invoiceModel.internalid}}" data-id="{{invoiceModel.internalid}}" class="order-history-summary-button-view-invoice">
				{{translate 'View Invoice'}}
			</a>
		{{/if}}
	</div>
</div>



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
	showReorderAllItemsButton (Boolean)
	showSummaryDiscount (Boolean)
	showSummaryShippingCost (Boolean)
	showSummaryPickupCost (Boolean)
	showSummaryHandlingCost (Boolean)
	showSummaryGiftCertificateTotal (Boolean)
	showSummaryPromocode (Boolean)
	showViewInvoiceButton (Boolean)
	pdfUrl (String)
	showCancelButton (Boolean)

----}}
