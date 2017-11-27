{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="quick-add-box">
	<form novalidate action="#">
		<div class="quick-add-box-left" data-input="quickaddSearch" data-validation="control-group">
			<label for="quickaddSearch">{{itemTitle}}</label>
			<div class="quick-add-box-input" data-validation="control">
				<div class="quick-add-box-input-search" data-view="ItemsSearcher"></div>
				<a class="quick-add-box-input-search-reset" data-type="quick-add-reset">
					<i class="quick-add-box-input-search-reset-icon"></i>
				</a>
			</div>
		</div>
		<div class="quick-add-box-right" data-input="quickaddSearch" data-validation="control-group">
			<label for="quantity" class="quick-add-input-quantity">{{quantityTitle}}</label>
			<div class="quick-add-box-right-main">
				<div class="quick-add-box-right-input" data-validation="control">
					<div class="quick-add-box-right-actionable-input-qty">
						<button type="button" class="quick-add-box-right-quantity-remove" data-action="minus">-</button>
						<input data-type="quantity-input" type="number" name="quantity" id="quantity" class="quick-add-box-right-quantity-value" min="1">
						<button type="button" class="quick-add-box-right-quantity-add" data-action="plus">+</button>
					</div>
					<small class="quick-add-box-minimum-top" data-type="minimum-quantity"></small>
				</div>

				<button class="quick-add-box-button" type="submit">{{translate 'Add Item'}}</button>
				<small class="quick-add-box-minimum-bottom" data-type="minimum-quantity"></small>
			</div>
		</div>
	</form>
</div>



{{!----
Use the following context variables when customizing this template:

	itemTitle (String)
	quantityTitle (String)

----}}
