{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-line-sku-container">
	<span class="product-line-sku-label">
		{{translate 'SKU:'}}
	</span>
	<span class="product-line-sku-value" itemprop="sku">
		{{sku}}
	</span>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.item (Object)
	model.item.internalid (Number)
	model.item.type (String)
	model.quantity (Number)
	model.internalid (String)
	model.options (Array)
	model.shipaddress (undefined)
	model.shipmethod (undefined)
	model.location (String)
	model.fulfillmentChoice (String)
	sku (String)

----}}
