{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div itemprop="itemListElement" data-item-id="{{itemId}}" data-track-productlist-list="{{track_productlist_list}}" data-track-productlist-category="{{track_productlist_category}}" data-track-productlist-position="{{track_productlist_position}}" data-sku="{{sku}}">
	<a class="item-relations-related-item-thumbnail" {{{itemURL}}}>
		<img src="{{resizeImage thumbnail.url 'thumbnail'}}" alt="{{thumbnail.altimagetext}}" />
	</a>
	<a {{{itemURL}}} class="item-relations-related-item-title">
		<span itemprop="name">{{itemName}}</span>
	</a>
	<div class="item-relations-related-item-price" data-view="Item.Price">
	</div>

	{{#if showRating}}
		<div class="item-relations-related-item-rate" data-view="Global.StarRating">
		</div>
	{{/if}}
</div>




{{!----
Use the following context variables when customizing this template: 
	
	itemURL (String)
	thumbnail (Object)
	thumbnail.url (String)
	thumbnail.altimagetext (String)
	sku (String)
	model (Object)
	model.itemsIds (Number)
	model.options (Array)
	model._matrixParent (Object)
	model._matrixParent.options (Array)
	model._url (String)
	model._name (String)
	model._thumbnail (Object)
	model._thumbnail.url (String)
	model._thumbnail.altimagetext (String)
	model._sku (String)
	model._rating (Number)
	model._ratingsCount (Number)
	model._matrixChilds (Array)
	model._inStockMessage (String)
	model._showInStockMessage (Boolean)
	model._showStockDescription (Boolean)
	model._stockDescriptionClass (String)
	model._quantityavailableforstorepickup_detail (Array)
	model._showQuantityAvailable (Boolean)
	showRating (Boolean)
	itemName (String)
	itemId (Number)

----}}
