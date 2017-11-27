{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-paymentmethod-selector-module">
	{{#if showTitle}}
		<h2 class="order-wizard-paymentmethod-selector-module-header">
			{{title}}
		</h2>
	{{/if}}
	{{#if activeModulesLengthGreaterThan1}}
		<select class="order-wizard-paymentmethod-selector-module-options" data-action="select-payment-method" >
			{{#each activeModules}}
				<option class="order-wizard-paymentmethod-selector-module-option" {{#if isSelected}}selected{{/if}}  data-type="{{type}}" value="{{type}}">
					{{name}}
				</option>
			{{/each}}
		</select>
	{{/if}}

	<div class="order-wizard-paymentmethod-selector-module-payment-method-selector-content" id="payment-method-selector-content"></div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	activeModules (Array)
	activeModulesLengthGreaterThan1 (Number)
	firstActiveModuleName (String)
	showTitle (Boolean)
	title (String)
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
	model.lines.0 (Object)
	model.lines.0.item (Object)
	model.lines.0.item.internalid (Number)
	model.lines.0.item.type (String)
	model.lines.0.quantity (Number)
	model.lines.0.internalid (String)
	model.lines.0.options (Array)
	model.lines.0.shipaddress (String)
	model.lines.0.shipmethod (String)
	model.lines.0.location (String)
	model.lines.0.fulfillmentChoice (String)
	model.paymentmethods (Array)
	model.internalid (String)
	model.confirmation (Object)
	model.confirmation.addresses (Array)
	model.confirmation.shipmethods (Array)
	model.confirmation.lines (Array)
	model.confirmation.paymentmethods (Array)
	model.multishipmethods (Object)
	model.multishipmethods.1568 (Array)
	model.multishipmethods.1568.0 (Object)
	model.multishipmethods.1568.0.name (String)
	model.multishipmethods.1568.0.rate (Number)
	model.multishipmethods.1568.0.shipcarrier (String)
	model.multishipmethods.1568.0.internalid (Number)
	model.multishipmethods.1568.0.rate_formatted (String)
	model.multishipmethods.1568.0.check (Boolean)
	model.multishipmethods.2508 (Array)
	model.multishipmethods.2508.0 (Object)
	model.multishipmethods.2508.0.name (String)
	model.multishipmethods.2508.0.rate (Number)
	model.multishipmethods.2508.0.shipcarrier (String)
	model.multishipmethods.2508.0.internalid (Number)
	model.multishipmethods.2508.0.rate_formatted (String)
	model.lines_sort (Array)
	model.lines_sort.0 (String)
	model.latest_addition (undefined)
	model.promocodes (Array)
	model.ismultishipto (Boolean)
	model.shipmethod (undefined)
	model.billaddress (String)
	model.shipaddress (undefined)
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

----}}
