{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<tr class="product-list-list-details-wrapper" data-action="navigate" data-product-list-id="{{internalId}}" data-id="{{internalId}}">
	<td class="product-list-list-details-main">

		<p class="product-list-list-details-text">
			<a class="product-list-list-details-anchor" href="/wishlist/{{#if internalId}}{{internalId}}{{else}}tmpl_{{templateId}}{{/if}}">
				{{#if isTypePredefined}}{{translate listName}}{{else}}{{listName}}{{/if}}
			</a>
		</p>

		<p>
			{{#if hasItems}}
				<span class="product-list-list-details-item-count">{{itemsLength}}</span>
				{{#if hasOneItem}}
					{{translate 'product'}}
				{{else}}
					{{translate 'products'}}
				{{/if}}

				{{#if hasLastItem}}
					({{translate 'last added'}} <a class="product-list-list-details-last-item" {{{lastProductItemUrl}}}>{{lastItemDisplayName}}</a>)
				{{/if}}
			{{else}}
				<span> {{translate 'No items yet'}}</span>
			{{/if}}
		</p>

		{{#if hasOutOfStockItems}}
			<p class="product-list-list-details-stock">
				<span class="product-list-list-details-not-purchasable-message">
					<i class="product-list-list-details-not-purchasable-message-icon"></i>
					{{translate 'Some products from this list are not available for purchase'}}
				</span>
			</p>
		{{/if}}

		{{#if hasMinimumQuantityItems}}
			<p class="product-list-list-details-minquantity">
				{{translate 'The quantity of some of the items needs to be updated to match the minimum required to purchase. Go to <a href="/wishlist/$(0)">$(1)</a>' internalId listName}}
			</p>
		{{/if}}
	</td>

	<td class="product-list-list-details-info">
		<p class="product-list-list-details-last-update">
			<span class="product-list-list-details-last-update-label">{{translate 'Last updated: '}}</span>
			<span class="product-list-list-details-last-update-value">{{lastModifiedDate}}</span>
		</p>
		{{#if hasListDescription}}
			<p class="product-list-list-details-description">
			<span class="product-list-list-details-description-label">{{translate 'Notes: '}}</span>
			<span class="product-list-list-details-description-value">
				{{#if isTypePredefined}}
						{{translate listDescription}}
				{{else}}
						{{listDescription}}
				{{/if}}
			</span>
			</p>
		{{/if}}
	</td>

	<td class="product-list-list-details-actions">
		<button data-action="add-to-cart" class="product-list-list-details-add-to-cart" {{#unless isAvailableForCart}}disabled{{/unless}}>{{translate 'Add List to Cart'}}</button>

		{{#unless isTypePredefined}}
			<div class="product-list-list-details-button-group">
				<button class="product-list-list-details-button-edit" data-action="edit-list">{{translate 'Edit List'}}</button>
				<button class="product-list-list-details-button-expander" data-toggle="dropdown" aria-expanded="false">
					<i></i>
				</button>
				<ul class="product-list-list-details-dropdown" role="menu">
					<li>
						<a href="#" data-action="delete-list">{{translate 'Delete List'}}</a>
					</li>
				</ul>
			</div>
		{{/unless}}

		{{#unless isListPrivate}}
			<button class="product-list-list-details-share" data-action="share-list">{{translate 'Email/Share List'}}</button>
		{{/unless}}
	</td>
</tr>




{{!----
Use the following context variables when customizing this template:

	internalId (String)
	isAvailableForCart (Number)
	templateId (String)
	isTypePredefined (Boolean)
	listName (String)
	hasItems (Boolean)
	itemsLength (Number)
	hasOneItem (Boolean)
	hasLastItem (Boolean)
	lastProductItemUrl (String)
	lastItemDisplayName (String)
	hasOutOfStockItems (Boolean)
	hasMinimumQuantityItems (Boolean)
	lastModifiedDate (String)
	listDescription (String)
	hasListDescription (Boolean)
	isListPrivate (Boolean)

----}}
