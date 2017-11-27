{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="pickup-in-store-store-selector-item-detail-list-divider"></div>

<div class="pickup-in-store-store-selector-item-detail" data-item-type="{{itemType}}">
	<div class="pickup-in-store-store-selector-item-detail-item-image" name="item-image">
		<img src="{{resizeImage thumbnail.url 'thumbnail'}}" alt="{{thumbnail.altimagetext}}">
	</div>

	<div class="pickup-in-store-store-selector-item-detail-details" name="item-details">
		<p class="pickup-in-store-store-selector-item-detail-product-name">
			<span class="pickup-in-store-store-selector-item-detail-product-title">
				{{itemName}}
			</span>
		</p>

        <div data-view="Item.Price"></div>

        <div data-view="Item.Sku"></div>
	</div>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
