{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-details-options-selector">
	{{#if showPusher}}
		<div data-view="Pusher" data-type="sc-pusher" data-target="product-details-options"></div>
	{{/if}}

	<div {{#if showPusher}} class="product-details-options-selector-content" data-action="pushable" data-id="product-details-options" {{/if}}>

		{{#if showPusher}}
			<div class="product-details-options-selector-content-price" data-view="Item.Price"></div>

			<div class="product-details-options-selector-content-stock" data-view="Item.Stock"></div>

			<div data-view="StockDescription"></div>
		{{/if}}

		{{#if showRequiredLabel}}
			<div class="product-details-options-selector-reference-container">
				<small>{{translate 'Required'}} <span class="product-details-options-selector-reference">*</span></small>
			</div>
		{{/if}}

		<div data-view="Options.Collection" class="product-details-options-selector-option-container"></div>
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.item (Object)
	model.item.internalid (Number)
	model.item.type (String)
	model.quantity (Number)
	model.options (Array)
	model.options.0 (Object)
	model.options.0.cartOptionId (String)
	model.options.0.itemOptionId (String)
	model.options.0.label (String)
	model.options.0.type (String)
	model.location (String)
	model.fulfillmentChoice (String)
	showPusher (Boolean)
	showRequiredLabel (Boolean)

----}}
