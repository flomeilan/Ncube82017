{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showTitle}}
	<h3 class="order-wizard-msr-addresses-module-section-header">
		{{title}}
	</h3>
{{/if}}

<div data-type="alert-placeholder-module"></div>


{{#if showCollapsedView}}
	<a class="order-wizard-msr-addresses-module-address-link" data-action="add-edit-addreses-link">{{translate 'Add/Edit Addresses'}}</a>
{{else}}
	{{#if isAddressListLengthGreaterThan0}}
		<div id="address-module-list-placeholder" {{#if showManageValue}}data-manage="{{manageValue}}"{{/if}} class="order-wizard-msr-addresses-module-container">
			{{#if hasEnoughValidAddresses}}
				<p>
					<a class="order-wizard-msr-addresses-module-new-button" href="/addressbook/new" data-toggle="show-in-modal">
						{{translate 'Add New Address'}}
					</a>
				</p>
			{{/if}}

			<div data-view="Address.List"></div>

			{{#unless hasEnoughValidAddresses}}
				<p class="order-wizard-msr-addresses-module-new-address-title">{{translate 'New Address'}}</p>
				<div id="address-module-form-placeholder" {{#if showManageValue}}data-manage="{{manageValue}}"{{/if}} class="order-wizard-msr-addresses-module-form-placeholder">

					<div data-view="New.Address.Form"></div>

					{{#if showSaveButton}}
						<div class="form-actions">
							<button type="submit" class="order-wizard-msr-addresses-module-save-button" data-action="submit">
								{{translate 'Save Address'}}
							</button>
						</div>
					{{/if}}

				</div>
			{{/unless}}
		</div>
	{{else}}
		<p class="order-wizard-msr-addresses-module-new-address-title">{{translate 'New Address'}}</p>
		<div id="address-module-form-placeholder" {{#if showManageValue}}data-manage="{{manageValue}}"{{/if}} class="order-wizard-msr-addresses-module-form-placeholder">

			<div data-view="New.Address.Form"></div>

			{{#if showSaveButton}}
				<div class="form-actions">
					<button type="submit" class="order-wizard-msr-addresses-module-save-button" data-action="submit">
						{{translate 'Save Address'}}
					</button>
				</div>
			{{/if}}

		</div>
	{{/if}}
{{/if}}



{{!----
Use the following context variables when customizing this template: 
	
	showTitle (Boolean)
	title (String)
	showCollapsedView (Boolean)
	isAddressListLengthGreaterThan0 (Boolean)
	showManageValue (Boolean)
	manageValue (String)
	hasEnoughValidAddresses (Boolean)
	model (Object)
	model.addresses (Array)
	model.shipmethods (Array)
	model.lines (Array)
	model.lines.0 (Object)
	model.lines.0.item (Object)
	model.lines.0.item.internalid (Number)
	model.lines.0.item.type (String)
	model.lines.0.quantity (Number)
	model.lines.0.internalid (String)
	model.lines.0.options (Array)
	model.lines.0.shipaddress (undefined)
	model.lines.0.shipmethod (undefined)
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

----}}
