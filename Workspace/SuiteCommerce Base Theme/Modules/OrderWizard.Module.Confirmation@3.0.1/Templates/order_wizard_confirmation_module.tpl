{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-confirmation-module alert fade in">
	<h2 class="order-wizard-confirmation-module-title">{{translate 'Thank you for shopping with us!'}}</h2>
	<p class="order-wizard-confirmation-module-body" name="orderNumber">{{translate 'Your order number is'}}
		<strong>
			{{#if isGuestAndCustomerCenter}}
				<a href="#" data-touchpoint="customercenter" data-hashtag="#/purchases/view/salesorder/{{orderId}}">#{{confirmationNumber}}</a>.
			{{else}}
				#{{confirmationNumber}}
			{{/if}}
		</strong>
	</p>
	<p class="order-wizard-confirmation-module-body">{{translate 'We received your order and will process it right away.'}}</p>
	{{#if additionalConfirmationMessage}}
		<p class="order-wizard-confirmation-module-body" data-type="additional-confirmation-message">{{additionalConfirmationMessage}}</p>
	{{/if}}
	<a class="order-wizard-confirmation-module-continue" href="{{continueURL}}" {{#if touchPoint}}data-touchpoint="home"{{/if}} data-hashtag="#/">{{translate 'Continue shopping'}}</a>
		<!-- DOWNLOAD AS PDF -->
	<a href="{{pdfUrl}}" target="_blank" class="order-wizard-confirmation-module-download-pdf">
		{{translate 'Download PDF'}}
	</a>
</div>



{{!----
Use the following context variables when customizing this template:

	continueURL (String)
	isGuestAndCustomerCenter (Boolean)
	additionalConfirmationMessage (String)
	touchPoint (Boolean)
	confirmationNumber (String)
	orderId (Number)
	pdfUrl (String)
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
	model.lines (Array)
	model.paymentmethods (Array)
	model.paymentmethods.0 (Object)
	model.paymentmethods.0.type (String)
	model.paymentmethods.0.primary (Boolean)
	model.paymentmethods.0.creditcard (Object)
	model.paymentmethods.0.creditcard.internalid (String)
	model.paymentmethods.0.creditcard.ccnumber (String)
	model.paymentmethods.0.creditcard.ccname (String)
	model.paymentmethods.0.creditcard.ccexpiredate (String)
	model.paymentmethods.0.creditcard.ccsecuritycode (String)
	model.paymentmethods.0.creditcard.expmonth (String)
	model.paymentmethods.0.creditcard.expyear (String)
	model.paymentmethods.0.creditcard.paymentmethod (Object)
	model.paymentmethods.0.creditcard.paymentmethod.internalid (String)
	model.paymentmethods.0.creditcard.paymentmethod.name (String)
	model.paymentmethods.0.creditcard.paymentmethod.creditcard (Boolean)
	model.paymentmethods.0.creditcard.paymentmethod.ispaypal (Boolean)
	model.paymentmethods.0.creditcard.paymentmethod.isexternal (Boolean)
	model.paymentmethods.0.creditcard.paymentmethod.key (String)
	model.internalid (undefined)
	model.confirmation (Object)
	model.confirmation.internalid (Number)
	model.confirmation.tranid (String)
	model.confirmation.summary (Object)
	model.confirmation.summary.subtotal (Number)
	model.confirmation.summary.subtotal_formatted (String)
	model.confirmation.summary.taxtotal (Number)
	model.confirmation.summary.taxtotal_formatted (String)
	model.confirmation.summary.shippingcost (Number)
	model.confirmation.summary.shippingcost_formatted (String)
	model.confirmation.summary.handlingcost (Number)
	model.confirmation.summary.handlingcost_formatted (String)
	model.confirmation.summary.discounttotal (Number)
	model.confirmation.summary.discounttotal_formatted (String)
	model.confirmation.summary.giftcertapplied (Number)
	model.confirmation.summary.giftcertapplied_formatted (String)
	model.confirmation.summary.total (Number)
	model.confirmation.summary.total_formatted (String)
	model.confirmation.promocodes (Array)
	model.confirmation.paymentmethods (Array)
	model.confirmation.lines (Array)
	model.confirmation.lines.0 (Object)
	model.confirmation.lines.0.item (Object)
	model.confirmation.lines.0.item.internalid (Number)
	model.confirmation.lines.0.item.type (String)
	model.confirmation.lines.0.quantity (Number)
	model.confirmation.lines.0.options (Array)
	model.confirmation.lines.0.options.0 (Object)
	model.confirmation.lines.0.options.0.cartOptionId (String)
	model.confirmation.lines.0.options.0.itemOptionId (String)
	model.confirmation.lines.0.options.0.label (String)
	model.confirmation.lines.0.options.0.type (String)
	model.confirmation.lines.0.options.0.value (Object)
	model.confirmation.lines.0.options.0.value.internalid (String)
	model.confirmation.lines.0.location (String)
	model.confirmation.lines.0.fulfillmentChoice (String)
	model.confirmation.statuscode (String)
	model.confirmation.confirmationnumber (String)
	model.confirmation.reasoncode (undefined)
	model.confirmation.addresses (Array)
	model.confirmation.shipmethods (Array)
	model.multishipmethods (Array)
	model.lines_sort (Array)
	model.lines_sort.0 (String)
	model.latest_addition (undefined)
	model.promocodes (Array)
	model.ismultishipto (Boolean)
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
	model.summary.discountrate (Number)
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

----}}
