{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-cart-summary-container">
	<h3 class="order-wizard-cart-summary-title">
		{{translate 'Summary'}}
	</h3>

	<div class="order-wizard-cart-summary-body">
		{{#if showEditCartMST}}
			<div class="order-wizard-cart-summary-edit-cart-label-mst">
				<a href="#" class="order-wizard-cart-summary-edit-cart-link" data-touchpoint="viewcart">
					{{translate 'Edit Cart'}}
				</a>
			</div>
		{{/if}}
		<div class="order-wizard-cart-summary-subtotal">
			<p class="order-wizard-cart-summary-grid-float">
				<span class="order-wizard-cart-summary-grid-right" >
					{{model.summary.subtotal_formatted}}
				</span>
				<span class="order-wizard-cart-summary-subtotal-label">
					{{#if itemCountGreaterThan1}}
						{{translate 'Subtotal <span class="order-wizard-cart-summary-item-quantity-subtotal" data-type="cart-summary-subtotal-count">$(0) items</span>' itemCount}}
					{{else}}
						{{translate 'Subtotal <span class="order-wizard-cart-summary-item-quantity-subtotal" data-type="cart-summary-subtotal-count">$(0) item</span>' itemCount}}
					{{/if}}
					<p class="order-wizard-cart-summary-subtotal-legend">{{translate 'Subtotal does not include shipping or tax'}}</p>
				</span>
			</p>
		</div>

		<div class="order-wizard-cart-summary-promocode-applied">
			<div data-view="CartPromocodeListView"></div>
		</div>

		{{#if showDiscount}}
			<div class="order-wizard-cart-summary-discount-applied">
				<p class="order-wizard-cart-summary-grid-float">
					<span class="order-wizard-cart-summary-discount-total">
						{{model.summary.discounttotal_formatted}}
					</span>
					{{translate 'Discount Total'}}
				</p>
			</div>
		{{/if}}

		{{#if showGiftCertificates}}
			<div class="order-wizard-cart-summary-giftcertificate-applied">
				<p class="order-wizard-cart-summary-gift-certificate">{{translate 'Gift Certificates Applied ($(0))' giftCertificates.length}}</p>
				<div data-view="GiftCertificates"></div>
			</div>
		{{/if}}

		<div class="order-wizard-cart-summary-shipping-cost-applied">

			{{#if showShippingCost}}
				<p class="order-wizard-cart-summary-grid-float">
					<span class="order-wizard-cart-summary-shipping-cost-formatted">
						{{model.summary.shippingcost_formatted}}
					</span>
					{{translate 'Shipping'}}
				</p>
			{{/if}}

			{{#if showHandlingCost}}
				<p class="order-wizard-cart-summary-grid-float">
					<span class="order-wizard-cart-summary-handling-cost-formatted">
						{{model.summary.handlingcost_formatted}}
					</span>
					{{translate 'Handling'}}
				</p>
			{{/if}}

			{{#if showPickupCost}}
				<p class="order-wizard-cart-summary-grid-float">
					<span class="order-wizard-cart-summary-pickup-label-free">
					{{translate 'FREE'}}
					</span>
					{{translate 'Pick Up'}}
				</p>
			{{/if}}

			{{#if model.summary.taxtotal}}
			<p class="order-wizard-cart-summary-grid-float">
				<span class="order-wizard-cart-summary-tax">
					{{model.summary.taxtotal_formatted}}
				</span>
				{{translate taxLabel}}
			</p>
			{{/if}}

			{{#if model.summary.tax2total}}
			<p class="order-wizard-cart-summary-grid-float">
				<span class="order-wizard-cart-summary-tax">
					{{model.summary.tax2total_formatted}}
				</span>
				{{translate 'PST'}}
			</p>
			{{/if}}

		</div>

		<div class="order-wizard-cart-summary-total">
			<p class="order-wizard-cart-summary-grid-float">
				<span class="order-wizard-cart-summary-grid-right" >
					{{model.summary.total_formatted}}
				</span>
				{{translate 'Total'}}
			</p>
		</div>
		{{#if showWarningMessage}}
			<div class="order-wizard-cart-summary-warning" role="alert">
				<div>{{warningMessage}}</div>
			</div>
		{{/if}}
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.addresses (Array)
	model.addresses.0 (Object)
	model.addresses.0.zip (String)
	model.addresses.0.country (String)
	model.addresses.0.addr2 (String)
	model.addresses.0.addr1 (String)
	model.addresses.0.city (String)
	model.addresses.0.addr3 (String)
	model.addresses.0.isvalid (String)
	model.addresses.0.internalid (String)
	model.addresses.0.phone (String)
	model.addresses.0.defaultbilling (String)
	model.addresses.0.defaultshipping (String)
	model.addresses.0.isresidential (String)
	model.addresses.0.state (String)
	model.addresses.0.fullname (String)
	model.addresses.0.company (undefined)
	model.shipmethods (Array)
	model.shipmethods.0 (Object)
	model.shipmethods.0.internalid (String)
	model.shipmethods.0.name (String)
	model.shipmethods.0.shipcarrier (String)
	model.shipmethods.0.rate (Number)
	model.shipmethods.0.rate_formatted (String)
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
	model.lines.0.location (String)
	model.lines.0.fulfillmentChoice (String)
	model.paymentmethods (Array)
	model.paymentmethods.0 (Object)
	model.paymentmethods.0.type (String)
	model.paymentmethods.0.primary (Boolean)
	model.paymentmethods.0.creditcard (Object)
	model.paymentmethods.0.creditcard.internalid (String)
	model.paymentmethods.0.creditcard.ccnumber (String)
	model.paymentmethods.0.creditcard.ccname (String)
	model.paymentmethods.0.creditcard.ccexpiredate (String)
	model.paymentmethods.0.creditcard.ccsecuritycode (undefined)
	model.paymentmethods.0.creditcard.expmonth (String)
	model.paymentmethods.0.creditcard.expyear (String)
	model.paymentmethods.0.creditcard.paymentmethod (Object)
	model.paymentmethods.0.creditcard.paymentmethod.internalid (String)
	model.paymentmethods.0.creditcard.paymentmethod.name (String)
	model.paymentmethods.0.creditcard.paymentmethod.creditcard (Boolean)
	model.paymentmethods.0.creditcard.paymentmethod.ispaypal (Boolean)
	model.paymentmethods.0.creditcard.paymentmethod.isexternal (Boolean)
	model.paymentmethods.0.creditcard.paymentmethod.key (String)
	model.internalid (String)
	model.confirmation (Object)
	model.confirmation.addresses (Array)
	model.confirmation.shipmethods (Array)
	model.confirmation.lines (Array)
	model.confirmation.paymentmethods (Array)
	model.multishipmethods (Array)
	model.lines_sort (Array)
	model.lines_sort.0 (String)
	model.latest_addition (undefined)
	model.promocodes (Array)
	model.ismultishipto (Boolean)
	model.shipmethod (undefined)
	model.billaddress (String)
	model.shipaddress (String)
	model.isPaypalComplete (Boolean)
	model.touchpoints (Object)
	model.touchpoints.logout (String)
	model.touchpoints.customercenter (String)
	model.touchpoints.serversync (String)
	model.touchpoints.viewcart (String)
	model.touchpoints.login (String)
	model.touchpoints.welcome (String)
	model.touchpoints.checkout (String)
	model.touchpoints.continueshopping (String)
	model.touchpoints.home (String)
	model.touchpoints.register (String)
	model.touchpoints.storelocator (String)
	model.agreetermcondition (Boolean)
	model.summary (Object)
	model.summary.discounttotal_formatted (String)
	model.summary.taxonshipping_formatted (String)
	model.summary.taxondiscount_formatted (String)
	model.summary.itemcount (Number)
	model.summary.taxonhandling_formatted (String)
	model.summary.total (Number)
	model.summary.tax2total (Number)
	model.summary.discountedsubtotal (Number)
	model.summary.taxtotal (Number)
	model.summary.discounttotal (Number)
	model.summary.discountedsubtotal_formatted (String)
	model.summary.taxondiscount (Number)
	model.summary.handlingcost_formatted (String)
	model.summary.taxonshipping (Number)
	model.summary.taxtotal_formatted (String)
	model.summary.totalcombinedtaxes_formatted (String)
	model.summary.handlingcost (Number)
	model.summary.totalcombinedtaxes (Number)
	model.summary.giftcertapplied_formatted (String)
	model.summary.shippingcost_formatted (String)
	model.summary.discountrate (String)
	model.summary.taxonhandling (Number)
	model.summary.tax2total_formatted (String)
	model.summary.discountrate_formatted (String)
	model.summary.estimatedshipping (Number)
	model.summary.subtotal (Number)
	model.summary.shippingcost (Number)
	model.summary.estimatedshipping_formatted (String)
	model.summary.total_formatted (String)
	model.summary.giftcertapplied (Number)
	model.summary.subtotal_formatted (String)
	model.options (Object)
	model.purchasenumber (String)
	model.sameAs (Boolean)
	itemCount (Number)
	itemCountGreaterThan1 (Boolean)
	giftCertificates (Array)
	showGiftCertificates (Boolean)
	showDiscount (Boolean)
	showHandlingCost (Boolean)
	showShippingCost (Boolean)
	showPickupCost (Boolean)
	showRemovePromocodeButton (Boolean)
	showWarningMessage (Boolean)
	showEditCartMST (Boolean)

----}}
