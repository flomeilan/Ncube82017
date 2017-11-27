{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showStockDescription}}
	<p class="product-line-stock-description-msg-description {{stockInfo.stockDescriptionClass}}">
		<i class="product-line-stock-description-icon-description"></i>
		{{stockInfo.stockDescription}}
	</p>
{{/if}}




{{!----
Use the following context variables when customizing this template: 
	
	showStockDescription (Boolean)
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

----}}
