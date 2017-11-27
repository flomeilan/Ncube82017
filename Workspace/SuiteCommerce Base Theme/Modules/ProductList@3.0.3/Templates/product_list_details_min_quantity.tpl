{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#unless fulfillsMinQuantityRequirements}}
	<p class="product-list-details-min-quantity">
		<span class="product-list-details-min-quantity-label" style="white-space:normal">
			{{translate 'The minimum quantity to purchase this item is <b>$(0)</b>. Do you want to change it <b>from $(1) to $(0)?</b> ' minimumQuantity quantity}}
			<a href="#" class="product-list-details-min-quantity-button-update" data-id={{id}} data-action="update-item-quantity">{{translate 'Yes, update it'}}</a>
		</span>
	</p>
{{/unless}}



{{!----
Use the following context variables when customizing this template: 
	
	fulfillsMinQuantityRequirements (Boolean)
	minimumQuantity (Number)
	quantity (Number)
	id (String)

----}}
