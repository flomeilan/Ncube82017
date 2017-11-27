{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div>
	{{#if isAnyUnsetLine}}
		<div class="order-wizard-msr-package-creation-header">
			<h5 class="order-wizard-msr-package-creation-header-subtitle"> 
				{{translate 'Select shipping address'}} 
			</h5>
		</div>
		<div class="order-wizard-msr-package-creation-header-row" >
			<div class="order-wizard-msr-package-creation-shipping-left">
				<select data-action="set-shipments-address-selector" class="order-wizard-msr-package-creation-multishipto-address-selector" >
					{{#each addresses}}
						<option value="{{addressId}}" {{#if isSelected}}selected{{/if}} >
							{{addressText}}
						</option>
					{{/each}}
				</select>
			</div>
			<div class="order-wizard-msr-package-creation-shipping-right" >
				<a href="{{editAddressesUrl}}"  class="order-wizard-msr-package-creation-shipping-add-edit-link"> {{translate 'Add / Edit Addresses'}} </a>
			</div>
		</div>
		<div>
			<h5 class="order-wizard-msr-package-creation-header-subtitle">
				{{translate 'Select products for this address'}} 
			</h5>
		</div>
		<div data-type="items-selection-control" class="order-wizard-msr-package-creation-items-remaining-list">
			<div class="order-wizard-msr-package-creation-row">
				<div class="order-wizard-msr-package-creation-multishipto-table-container">
					<table class="order-wizard-msr-package-creation-multishipto-table">
						<th colspan="3" data-action="select-unselect-all" class="order-wizard-msr-package-creation-multishipto-table-header-select">
							{{#if hasMultipleUnsetLines}}
							    <input type="checkbox" data-type="selectunselect-all-checkbox" {{#if areAllItemSelected}}checked{{/if}} />
							    <label style="display:inline;"> {{#if areAllItemSelected}} {{translate 'Unselect all'}} {{else}} {{translate 'Select all (<span data-type="item-remaining-count">$(0)<span>)' allItemsLength}} {{/if}} </label>
							{{/if}}
						</th>
						<th class="order-wizard-msr-package-creation-multishipto-table-header-qty">{{translate 'Qty'}}</th>
						<th class="order-wizard-msr-package-creation-multishipto-table-header-unit-price">{{translate 'Unit Price'}}</th>
						<th class="order-wizard-msr-package-creation-multishipto-table-header-amount">{{translate 'Amount'}}</th>
					</table> 
				</div>

				<div data-type="items-remaining-list">
					<table class="order-wizard-msr-package-creation-products-table md2sm" data-view="ShippableItems.Collection"></table>
				</div>
			</div>
		</div>
		<div data-type="module-footer">
			{{#if isAnySelectedItem}}
				<div class="order-wizard-msr-package-creation-ship-address">
					<p class="order-wizard-msr-package-creation-item-count">
						{{#if isSelectedItemsLengthGreaterThan1}}
							{{translate 'The <span data-type="item-selected-count">$(0)</span> products you selected will be shipped to:' selectedItemsLength}}
						{{else}}
							{{translate '<span data-type="item-selected-count" class="hidden">$(0)</span>The product you selected will be shipped to:' selectedItemsLength}}
						{{/if}}
					</p>

					<div data-type="multishipto-address-selected" class="order-wizard-msr-package-creation-multishipto-address-selected" >
						<div data-view="Address.Details" class="order-wizard-msr-package-creation-single-address"></div>
					</div>
				</div>
			{{else}}
				<p class="order-wizard-msr-package-creation-item-count">{{translate '<span data-type="item-selected-count">$(0)</span> products selected' selectedItemsLength}}</p>
			{{/if}}
				
			<button data-action="create-shipments" class="order-wizard-msr-package-creation-button-create" {{#unless isCreateShipmentEnabled}}disabled="disabled"{{/unless}}>
				{{createShipmentLabel}}
			</button>
		</div>
	{{/if}}
</div>



{{!----
Use the following context variables when customizing this template: 
	
	isAnyUnsetLine (Boolean)
	addresses (Array)
	areAllItemSelected (Boolean)
	allItemsLength (Number)
	isAnySelectedItem (Boolean)
	isSelectedItemsLengthGreaterThan1 (Boolean)
	selectedItemsLength (Number)
	isCreateShipmentEnabled (Boolean)
	createShipmentLabel (String)
	editAddressesUrl (String)
	hasMultipleUnsetLines (Boolean)
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
	model.tempshipaddress (undefined)

----}}
