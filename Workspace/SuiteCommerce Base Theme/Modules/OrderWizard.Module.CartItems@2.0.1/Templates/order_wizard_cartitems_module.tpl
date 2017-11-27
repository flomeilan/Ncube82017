{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="order-wizard-cartitems-module">
	<div class="order-wizard-cartitems-module-accordion-head">
		<a class="order-wizard-cartitems-module-accordion-head-toggle {{#unless showOpenedAccordion}}collapsed{{/unless}}" data-toggle="collapse" data-target="#unfulfilled-items" aria-controls="unfulfilled-items">
		{{#if itemCountGreaterThan1}}
			{{translate '$(0) Items' itemCount}}
		{{else}}
			{{translate '1 Item'}}
		{{/if}}
		<i class="order-wizard-cartitems-module-accordion-toggle-icon"></i>
		</a>
	</div>
	<div class="order-wizard-cartitems-module-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="unfulfilled-items" role="tabpanel">
		<div class="order-wizard-cartitems-module-accordion-container" data-content="order-items-body">
			{{#if showEditCartButton}}
				<div class="order-wizard-cartitems-module-edit-cart-label">
					<a href="#" class="order-wizard-cartitems-module-edit-cart-link" data-action="edit-module" data-touchpoint="viewcart">
						{{translate 'Edit Cart'}}
					</a>
				</div>
			{{/if}}
			<div class="order-wizard-cartitems-module-products-scroll">
				<table class="{{#if showMobile}}lg2sm-first{{/if}} order-wizard-cartitems-module-table">
					{{#if showHeaders}}
						<thead class="order-wizard-cartitems-module-accordion-container-table-header" item-id="{{itemId}}" data-id="{{itemId}}">
							<th class="order-wizard-cartitems-module-accordion-container-table-header-image" name="item-image">
							</th>
							<th class="order-wizard-cartitems-module-accordion-container-table-header-details" name="item-details">
							</th>
							<th class="order-wizard-cartitems-module-accordion-container-table-header-totalprice" name="item-totalprice">
								{{translate 'Unit Price'}}
							</th>
							<th class="order-wizard-cartitems-module-accordion-container-table-header-quantity" name="item-quantity">
								{{translate 'Quantity'}}
							</th>
							<th class="order-wizard-cartitems-module-accordion-container-table-header-amount" name="item-amount">
								{{translate 'Amount'}}
							</th>
						</thead>
					{{/if}}
					<tbody data-view="Items.Collection"></tbody>
				</table>
			</div>

		</div>
	</div>
</section>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
