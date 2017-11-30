{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<form method="POST">
	<div class="product-list-edit-item-modal-body" itemscope itemtype="https://schema.org/Product">
		<div class="product-list-edit-item-image">
			<img src="{{resizeImage thumbnail.url 'thumbnail'}}" alt="{{thumbnail.altimagetext}}">
		</div>

		<div class="product-list-edit-item-details">
			<div class="product-list-edit-item-basic">
				<h5 class="product-list-edit-item-name">
					<a class="product-list-edit-item-anchor-name" href="#" data-touchpoint="home" data-hashtag="product/{{productId}}"> {{productName}}</a>
				</h5>

				<div class="product-list-edit-item-added">
					<small>{{translate 'Added on'}}: {{itemCreatedDate}}</small>
				</div>

				{{#if showRating}}
				<div class="product-list-edit-item-rating" itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
					<div data-view="GlobalViews.StarRating"></div>
				</div>
				{{/if}}

				<div class="product-list-edit-item-price">
					<div data-view="ItemViews.Price"></div>
				</div>
			</div>

			<div class="product-list-edit-item-options">
				<div data-view="ItemDetails.Options"></div>
			</div>

			<div class="product-list-edit-item-quantity">
				<label class="product-list-edit-item-label" for="product-list-edit-item-quantity">{{translate 'Desired Quantity'}}</label>
				<button class="product-list-edit-item-button-quantity-minus" data-ui-action="minus">-</button>
				<input class="product-list-edit-item-input-quantity" type="number" min="1" name="quantity" id="product-list-edit-item-quantity" placeholder="{{translate 'Desired Quantity'}}" value="{{quantity}}">
				<button class="product-list-edit-item-button-quantity-add" data-ui-action="add">+</button>
			</div>
			{{#if showMinimumQuantity}}
				<small class="product-list-edit-item-quantity-help">
					{{translate '(Minimum of $(0) required)' minQuantity}}
				</small>
			{{/if}}

			<div class="product-list-edit-item-priority">
				<label class="product-list-edit-item-label" for="product-list-edit-item-priority">{{translate 'Priority'}}</label>
				<select class="product-list-edit-item-select-priority product-list-edit-item-priority-input" name="priority" id="product-list-edit-item-priority">
					<option value="1" {{#if isPriority1}}selected{{/if}}>{{translate 'High'}}</option>
					<option value="2" {{#if isPriority2}}selected{{/if}}>{{translate 'Medium'}}</option>
					<option value="3" {{#if isPriority3}}selected{{/if}}>{{translate 'Low'}}</option>
				</select>
			</div>

			<div class="product-list-edit-item-notes" data-validation="control-group">
				<label class="product-list-edit-item-label" for="product-list-edit-item-description">
					{{translate 'Notes for this item'}}
					<span class="product-list-edit-item-label-optional">{{translate '(optional)'}}</span>
				</label>
				<div data-validation="control">
					<textarea class="product-list-edit-item-textarea" name="description" id="product-list-edit-item-description" placeholder="{{translate 'Add a note or description for your item'}}">{{description}}</textarea>
				</div>
			</div>

		</div>
	</div>

	<div class="product-list-edit-item-modal-footer">
		<button type="submit" class="product-list-edit-item-button-edit" data-action="edit" {{#unless isSelectionCompleteForEdit}}disabled{{/unless}}>{{translate 'Save'}}</button>
		<button type="reset" class="product-list-edit-item-button-cancel" data-dismiss="modal" aria-hidden="true">{{translate 'Cancel'}}</button>
	</div>
</form>



{{!----
Use the following context variables when customizing this template: 
	
	quantity (Number)
	showMinimumQuantity (Boolean)
	minQuantity (Number)
	description (String)
	productId (Number)
	productName (String)
	itemCreatedDate (String)
	isSelectionCompleteForEdit (Boolean)
	isPriority1 (Boolean)
	isPriority2 (Boolean)
	isPriority3 (Boolean)
	thumbnail (Object)
	thumbnail.altimagetext (String)
	thumbnail.url (String)

----}}
