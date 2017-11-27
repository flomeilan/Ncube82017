{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-line-stock">
	{{#if isNotAvailableInStore}}
		<div class='product-line-stock-msg-not-available'>{{translate 'This item is no longer available'}}</div>
	{{else}}
		{{#if showOutOfStockMessage}}
			<p class="product-line-stock-msg-out">
				<span class="product-line-stock-icon-out">
					<i></i>
				</span>
				<span class="product-line-stock-msg-out-text">{{stockInfo.outOfStockMessage}}</span>
			</p>
		{{/if}}
		{{#if showInStockMessage}}
			<p class="product-line-stock-msg-in">
				<span class="product-line-stock-icon-in">
					<i></i>
				</span>
				{{stockInfo.inStockMessage}}
			</p>
		{{/if}}
	{{/if}}
</div>




{{!----
Use the following context variables when customizing this template: 
	
	showOutOfStockMessage (Boolean)
	stockInfo (Object)
	stockInfo.isInStock (Boolean)
	stockInfo.outOfStockMessage (String)
	stockInfo.showOutOfStockMessage (Boolean)
	stockInfo.inStockMessage (String)
	stockInfo.showInStockMessage (Boolean)
	stockInfo.stockDescription (String)
	stockInfo.showStockDescription (Boolean)
	stockInfo.stockDescriptionClass (String)
	stockInfo.isNotAvailableInStore (Boolean)
	stockInfo.stockPerLocation (Array)
	stockInfo.isAvailableForPickup (Boolean)
	stockInfo.showQuantityAvailable (Boolean)
	model (Object)
	model.item (Object)
	model.item.internalid (Number)
	model.item.type (String)
	model.quantity (Number)
	model.internalid (String)
	model.options (Array)
	model.options.0 (Object)
	model.options.0.cartOptionId (String)
	model.options.0.itemOptionId (String)
	model.options.0.label (String)
	model.options.0.type (String)
	model.options.0.values (Array)
	model.location (String)
	model.fulfillmentChoice (String)
	model.description (String)
	model.priority (Object)
	model.priority.id (String)
	model.priority.name (String)
	model.created (String)
	model.createddate (String)
	model.lastmodified (String)
	showInStockMessage (Boolean)
	isNotAvailableInStore (Boolean)

----}}
