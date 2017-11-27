{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-history-packages-acordion-divider">
	<div class="order-history-packages-accordion-head">
		<div class="order-history-packages-accordion-head-toggle {{initiallyCollapsedArrow}}" data-toggle="collapse" data-target="#{{targetId}}" aria-expanded="true" aria-controls="unfulfilled-items">
			<div class="order-history-packages-header-container-title">
				<span class="order-history-packages-accordion-head-toggle-status">{{packageStatus}}</span>
				<span class="order-history-packages-accordion-head-toggle-auxiliar-text">
					{{#if isPackageInStore}}
						{{translate ' at'}}
					{{else}}
						{{translate ' to'}}
					{{/if}}
				</span>
				<a id="order-history-packages-address-dropdown" class="order-history-packages-address-data-link" data-toggle="dropdown" aria-expanded="false">
				{{#if isPackageInStore}}
					{{#if showOrderLocation}} {{orderLocation.name}} {{/if}}
				{{else}}
					{{orderAddress}}
				{{/if}}
					 <i class="order-history-packages-icon-angle-down"></i>
				</a>
				<div class="order-history-packages-dropdown-menu" aria-labelledby="order-history-packages-address-dropdown">
				{{#if isPackageInStore}}
					<div data-view="Address.StoreLocationInfo"></div>
					{{#if showGetDirectionButton}}
						<a class="order-history-packages-get-directions-button" href="{{getDirectionsUrl}}" target="_blank">
							{{translate 'Get Directions'}}
						</a>
					{{/if}}
				{{else}}
					<div data-view="Shipping.Address.View"></div>
				{{/if}}
				</div>
			</div>
			<i class="order-history-packages-accordion-toggle-icon"></i>
			{{#unless isPackageInStore}}
				<div class="order-history-packages-header-container">
					<div class="order-history-packages-header-container-left">
						{{#if showDeliveryStatus}}
							<div class="order-history-packages-header-col">
								<span class="order-history-packages-shipped-status-label">{{translate 'Status: '}}</span> 
								<span class="order-history-packages-shipped-status-value">{{packageStatus}}</span>
							</div>
						{{/if}}
						{{#if showDate}}
							<div class="order-history-packages-header-col">
								<span class="order-history-packages-shipped-date-label">{{translate 'Shipped on: '}}</span> 
								<span class="order-history-packages-shipped-date-value">{{date}}</span>
							</div>
						{{/if}}
					</div>
					<div class="order-history-packages-header-container-right">
						<div class="order-history-packages-header-col" data-view="TrackingNumbers"></div>
						{{#if showDeliveryMethod}}
							<div class="order-history-packages-header-col{{#if showTrackingNumbers}} order-history-packages-hide-from-head{{/if}}">
								<span class="order-history-packages-delivery-label">{{translate 'Delivery Method: '}}</span>
								<span class="order-history-packages-delivery-value">{{deliveryMethodName}}</span>
							</div>
						{{/if}}
					</div>
				</div>
			{{/unless}}
			<div class="order-history-packages-items-quantity">{{translate '$(0) Items' linesItemsAmount}}</div>
		</div>
	</div>
	<div class="order-history-packages-accordion-body collapse {{initiallyCollapsed}}" id="{{targetId}}" role="tabpanel" data-target="#{{targetId}}">
		<div class="order-history-packages-accordion-container" data-content="order-items-body">
			<table class="order-history-packages-items-table">
				<tbody data-view="Items.Collection">
				</tbody>
			</table>
		</div>
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.internalid (String)
	model.shipaddress (Object)
	model.shipaddress.internalid (String)
	model.shipaddress.country (String)
	model.shipaddress.state (String)
	model.shipaddress.city (String)
	model.shipaddress.zip (String)
	model.shipaddress.addr1 (String)
	model.shipaddress.addr2 (String)
	model.shipaddress.phone (String)
	model.shipaddress.fullname (String)
	model.shipaddress.company (undefined)
	model.shipaddress.isvalid (String)
	model.shipmethod (Object)
	model.shipmethod.internalid (String)
	model.shipmethod.name (String)
	model.shipmethod.rate (Number)
	model.shipmethod.rate_formatted (String)
	model.shipmethod.shipcarrier (String)
	model.packageGroup (String)
	model.status (Object)
	model.status.internalid (String)
	model.status.name (String)
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
	showOrderAddress (Boolean)
	orderAddress (String)
	showDeliveryMethod (Boolean)
	deliveryMethodName (String)
	showDeliveryStatus (Boolean)
	showPackageStatus (Boolean)
	packageStatus (String)
	showDate (Boolean)
	showTrackingNumbers (Boolean)
	isPackageInStore (Boolean)
	date (String)
	linesItemsAmount (Number)
	showOrderLocation (Boolean)
	getDirectionsUrl (String)
	showGetDirectionButton (Boolean)
	initiallyCollapsed (String)
	initiallyCollapsedArrow (String)
	targetId (String)

----}}
