{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="order-wizard-cartitems-module-ship">
	<div class="order-wizard-cartitems-module-ship-accordion-head">
		<a class="order-wizard-cartitems-module-ship-accordion-head-toggle{{#unless showOpenedAccordion}} collapsed{{/unless}}{{#if isAccordionPrimary}} order-wizard-cartitems-module-ship-accordion-primary{{/if}}" data-toggle="collapse" data-target="#unfulfilled-items-ship" aria-controls="unfulfilled-items">
		{{#if showAddress}}
			<span>{{translate 'Ship to '}}</span>
			<span class="order-wizard-cartitems-module-ship-accordion-head-toggle-address-name">{{address.fullname}}</span>
			<span> ({{itemCount}})</span>
		{{else}}
			{{translate 'Items to Ship ($(0))' itemCount}}
		{{/if}}
		<i class="order-wizard-cartitems-module-ship-accordion-toggle-icon"></i>
		</a>
	</div>
	<div class="order-wizard-cartitems-module-ship-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="unfulfilled-items-ship" role="tabpanel">
		<div class="order-wizard-cartitems-module-ship-accordion-container" data-content="order-items-body">
			{{#if showAddress}}
				<div class="order-wizard-cartitems-module-ship-dropdown">
					<a
						id="order-wizard-cartitems-module-ship-address-dropdown-{{address.id}}"
						class="order-wizard-cartitems-module-ship-address-dropdown-link"
						data-toggle="dropdown"
						aria-expanded="true">

						<span class="order-wizard-cartitems-module-ship-address-label">{{translate 'Ship to'}} </span> {{address.fullname}}
						<i class="order-wizard-cartitems-module-ship-address-icon-angle-down"></i>
					</a>

					<div
						class="order-wizard-cartitems-module-ship-dropdown-menu"
						aria-labelledby="order-wizard-cartitems-module-ship-address-dropdown-{{address.id}}">
						<div data-view="Address.Details"></div>
					</div>
				</div>
			{{/if}}

			<div class="order-wizard-cartitems-module-ship-products-scroll">
				<table class="{{#if showMobile}}lg2sm-first{{/if}} order-wizard-cartitems-module-ship-table">
					<tbody data-view="Items.Collection"></tbody>
				</table>
			</div>

			{{#if showEditCartButton}}
				<div class="order-wizard-cartitems-module-ship-edit-cart-link-container">
					<a href="#" class="order-wizard-cartitems-module-ship-edit-cart-link" data-action="edit-module" data-touchpoint="viewcart">
						{{translate 'Edit Cart'}}
					</a>
				</div>
			{{/if}}
		</div>
	</div>
</section>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.addresses (Array)
	model.addresses.0 (Object)
	model.addresses.0.zip (String)
	model.addresses.0.country (String)
	model.addresses.0.company (undefined)
	model.addresses.0.internalid (String)
	model.shipmethods (Array)
	model.lines (Array)
	model.lines.0 (Object)
	model.lines.0.item (Object)
	model.lines.0.item.internalid (Number)
	model.lines.0.item.type (String)
	model.lines.0.quantity (Number)
	model.lines.0.internalid (String)
	model.lines.0.options (Array)
	model.lines.0.location (String)
	model.lines.0.fulfillmentChoice (String)
	model.paymentmethods (Array)
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
	model.billaddress (undefined)
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
	itemCount (Number)
	showOpenedAccordion (Boolean)
	isAccordionPrimary (Boolean)
	showEditCartButton (Boolean)
	showHeaders (Boolean)
	showMobile (Boolean)
	showAddress (Boolean)
	address (Object)
	address.zip (String)
	address.country (String)
	address.addr2 (undefined)
	address.addr1 (String)
	address.city (String)
	address.addr3 (undefined)
	address.isvalid (String)
	address.internalid (String)
	address.phone (String)
	address.defaultbilling (String)
	address.defaultshipping (String)
	address.isresidential (String)
	address.state (String)
	address.fullname (String)
	address.company (undefined)

----}}
