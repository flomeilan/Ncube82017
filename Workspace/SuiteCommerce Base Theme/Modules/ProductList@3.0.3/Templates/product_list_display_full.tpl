{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<tr class="{{#if isChecked}}active{{/if}}" data-id="{{lineId}}" data-item-id="{{itemId}}" data-action="product-list-item">
	{{#if showCheckbox}}
	<td class="product-list-display-full-select">
		<input type="checkbox" value="{{lineId}}" data-action="select" {{#if isChecked}}checked{{/if}}>
	</td>
	{{/if}}

	<td class="product-list-display-full-thumnail">
		<img src="{{resizeImage thumbnail.url 'thumbnail'}}" alt="{{thumbnail.altimagetext}}">
	</td>

	<td class="product-list-display-full-details">
		<p class="product-list-display-full-name">
			<a class="product-list-display-full-name-anchor" {{{linkAttributes}}}> {{productName}}</a>
		</p>

		<div class="product-list-display-full-price">
			<div data-view="ItemViews.Price"></div>
		</div>

		{{#if showRating}}
		<p class="product-list-display-full-rating" itemscope itemtype="https://schema.org/AggregateRating">
				<span data-view="GlobalViews.StarRating"></span>
			</p>
		{{/if}}

		<div data-view="Item.SelectedOptions"></div>

		<div class="product-list-display-full-stock">
			<div data-view="ItemViews.Stock"></div>
			
			<div data-view="StockDescription"></div>
		</div>

		<div data-view="ProductList.DetailsMinQuantity"></div>
	</td>

	<td class="product-list-display-full-extras">
		<p class="product-list-display-full-quantity">
			<span class="product-list-display-full-quantity-label">{{translate 'Desired Quantity: '}}</span>
			<span class="product-list-display-full-quantity-value">{{quantity}}</span>
		</p>

		<p class="product-list-display-full-priority">
			<span class="product-list-display-full-priority-label">{{translate 'Priority: '}}</span>
			<span class="product-list-display-full-priority-value">{{priorityName}}</span>
		</p>

		{{#if showAddedOn}}
			<p class="product-list-display-full-date">
				<span class="product-list-display-full-date-label">{{translate 'Added on: '}}</span>
				<span class="product-list-display-full-date-value">{{itemCreatedDate}}</span>
			</p>
		{{/if}}

		<p class="product-list-display-full-notes" data-type="item-details-notes">
			{{#if hasDescription}}
			<span class="product-list-display-full-notes-label">{{translate 'Notes: '}}</span>
			<span class="product-list-display-full-notes-value">{{description}}</span>
			{{/if}}
		</p>
	</td>

	<td class="product-list-display-full-actions">
		{{#if showEdit}}
			<button class="product-list-display-full-edit" data-action="edit-item" data-toggle="show-in-modal">{{translate 'Edit'}}</button>
		{{/if}}
		{{#if showMoveAction}}
			<div class="product-list-display-full-move" data-type="productlist-control-move"></div>
		{{/if}}
	</td>
</tr>



{{!----
Use the following context variables when customizing this template: 
	
	lineId (String)
	isChecked (Boolean)
	quantity (Number)
	description (String)
	hasDescription (Boolean)
	showEdit (Boolean)
	showMoveAction (Boolean)
	showAddedOn (Boolean)
	itemId (Number)
	isAvailableForCart (Boolean)
	showRating (Boolean)
	showCheckbox (Boolean)
	productName (String)
	priorityName (String)
	itemCreatedDate (String)
	linkAttributes (String)
	thumbnail (Object)
	thumbnail.url (String)
	thumbnail.altimagetext (String)

----}}
