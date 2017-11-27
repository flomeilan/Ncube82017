{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="requestquote-wizard-module-header">
	<h1 class="requestquote-wizard-module-header-title">
		{{translate 'Request a Quote'}}

		{{#if hasItem}}
			<small class="requestquote-wizard-module-header-title-count">
				{{#if hasOneItem}}
					{{translate '1 item'}}
				{{else}}
					{{translate '$(0) items'  productsLength}}
				{{/if}}
			</small>
		{{else}}
			<span class="requestquote-wizard-module-header-title-count-disabled">
				{{translate 'No Items Yet'}}
			</span>
		{{/if}}
	</h1>
	<button class="requestquote-wizard-module-header-title-button" data-action="submit-step">
		{{translate 'Submit Quote Request'}}
	</button>
</div>



{{!----
Use the following context variables when customizing this template:

	model (Object)
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
	model.lines.0.options.0.value.label (String)
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
	model.internalid (String)
	model.recordtype (String)
	model.tranid (String)
	model.memo (String)
	model.trandate (String)
	model.currency (Object)
	model.currency.internalid (String)
	model.currency.name (String)
	model.createdfrom (Object)
	model.createdfrom.internalid (undefined)
	model.createdfrom.name (undefined)
	model.createdfrom.recordtype (String)
	model.status (Object)
	model.status.internalid (undefined)
	model.status.name (undefined)
	model.promocodes (Array)
	model.purchasenumber (String)
	model.shipaddress (String)
	model.billaddress (String)
	model.shipmethod (String)
	model.statusRef (undefined)
	model.message (String)
	model.allowToPurchase (Boolean)
	model.isOpen (Boolean)
	model.salesrep (Object)
	model.salesrep.name (String)
	model.salesrep.internalid (String)
	model.discount (undefined)
	model.duedate (String)
	model.isOverdue (Boolean)
	model.isCloseOverdue (Boolean)
	model.expectedclosedate (String)
	model.options (Object)
	model.sameAs (Boolean)
	hasItem (Boolean)
	productsLength (Number)
	hasOneItem (Boolean)

----}}
