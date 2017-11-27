{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-msr-shipmethod-package" data-type="package" data-address-id="{{addressId}}">
	<div class="order-wizard-msr-shipmethod-package-row">
		<div class="order-wizard-msr-shipmethod-package-address">
			<h3 class="order-wizard-msr-shipmethod-package-title">
				{{translate 'Shipping Address'}}
			</h3>
			<div data-view="Shipping.Address"></div>
			{{#if showEditAddressButton}}
				<a data-action="edit-module" href="{{{editUrl}}}?force=true" class="order-wizard-msr-shipmethod-package-address-link">
					{{translate 'Back to edit shipping information'}}
				</a>
			{{/if}}

		</div>

		<div class="order-wizard-msr-shipmethod-package-delivery-method">
			<h3 class="order-wizard-msr-shipmethod-package-title">
				{{translate 'Delivery Method'}}
			</h3>

			{{#if showDeliveryMethods}}
				{{#if showActions}}
					<select data-address-id="{{addressId}}" data-type="address-selector" data-action="edit-module" class="order-wizard-msr-shipmethod-package-option-select">
						{{#unless showSelectedShipmethod}}
							<option>{{translate 'Please select a delivery method'}}</option>
						{{/unless}}
						{{#each shippingMethods}}
							<option value="{{internalid}}" data-type="delivery-method-option" {{#if isActive}}selected{{/if}} >
								{{rate_formatted}} - {{name}}
							</option>
						{{/each}}
					</select>
				{{else}}
					{{#if showSelectedShipmethod}}
						<div class="order-wizard-msr-shipmethod-package-delivery-option">
							<p class="order-wizard-msr-shipmethod-package-shipmethod-name">
								{{selectedShipmethod.name}}

								<span class="order-wizard-msr-shipmethod-package-shipmethod-rate">
									{{selectedShipmethod.rate_formatted}}
								</span>
							</p>
						</div>
					{{/if}}
				{{/if}}
			{{else}}
				<div class="order-wizard-msr-shipmethod-package-message">
					<i class="order-wizard-msr-shipmethod-package-message-icon"></i>
					{{translate 'Warning: No Delivery Methods are available for this address'}}
				</div>
			{{/if}}
		</div>
	</div>

	<div class="order-wizard-msr-shipmethod-package-items">

		{{#if showAccordion}}

			{{#if showItems}}
				<div class="order-wizard-msr-shipmethod-package-item-accordion">
					<div class="order-wizard-msr-shipmethod-package-accordion-head">
						<a class="order-wizard-msr-shipmethod-package-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#order-wizard-msr-shipmethod-package-accordion-body-{{addressId}}" aria-controls="order-wizard-msr-shipmethod-package-accordion-body-{{addressId}}">

							{{#if totalItemsGreaterThan1}}
								{{translate '<span class="order-wizard-msr-shipmethod-package-items-count">$(0)</span> Items' totalItems}}
							{{else}}
								{{translate '1 Item'}}
							{{/if}}
							<i class="order-wizard-msr-shipmethod-package-accordion-header-icon"></i>
						</a>
					</div>

					<div class="order-wizard-msr-shipmethod-package-accordion-body collapse" id="order-wizard-msr-shipmethod-package-accordion-body-{{addressId}}">
						{{#if showEditShipmentButton}}
							<a class="order-wizard-msr-shipmethod-package-edit-shipment" data-type="edit-shipment-link" href="{{editShipmentUrl}}?force=true">
								{{translate 'Edit Shipment'}}
							</a>
						{{/if}}
						<div class="order-wizard-msr-shipmethod-package-accordion-body-wrapper">
							<table class="order-wizard-msr-shipmethod-package-accordion-container-table">
								<thead class="order-wizard-msr-shipmethod-package-accordion-container-table-header" item-id="" data-id="">
									<tr>
										<th class="order-wizard-msr-shipmethod-package-accordion-container-table-header-image" name="item-image"></th>
										<th class="order-wizard-msr-shipmethod-package-accordion-container-table-header-details" name="item-details"></th>
										<th class="order-wizard-msr-shipmethod-package-accordion-container-table-header-totalprice" name="item-totalprice">{{translate 'Unit Price'}}</th>
										<th class="order-wizard-msr-shipmethod-package-accordion-container-table-header-quantity" name="item-quantity"> {{translate 'Qty'}} </th>
										<th class="order-wizard-msr-shipmethod-package-accordion-container-table-header-amount" name="item-amount">{{translate 'Amount'}}</th>
										</tr>
									</thead>
								<tbody data-view="Items.Collection"></tbody>
							</table>
						</div>
					</div>
				</div>

			{{else}}
				<p class="order-wizard-msr-shipmethod-package-item-count-label">
					{{#if totalItemsGreaterThan1}}
						{{translate '<span class="order-wizard-msr-shipmethod-package-item-count">$(0)</span> Items' totalItems}} {{translate 'in this shippment'}}
					{{else}}
						{{translate '<span class="order-wizard-msr-shipmethod-package-item-count">1</span> Item'}} {{translate 'in this shippment'}}
					{{/if}}
				</p>
			{{/if}}
		{{/if}}
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	addressId (String)
	showEditAddressButton (Boolean)
	showDeliveryMethods (Boolean)
	shippingMethods (Array)
	selectedShipmethod (Object)
	selectedShipmethod.name (String)
	selectedShipmethod.rate_formatted (String)
	selectedShipmethod.internalid (Number)
	selectedShipmethod.isActive (Boolean)
	showSelectedShipmethod (Boolean)
	showActions (Boolean)
	showAccordion (Boolean)
	showItems (Boolean)
	showLines (Boolean)
	lines (Array)
	totalItems (Number)
	totalItemsGreaterThan1 (Boolean)
	collapseElements (Boolean)
	showEditShipmentButton (Boolean)
	editUrl (String)
	showCombo (Boolean)
	editShipmentUrl (String)

----}}
