{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="order-wizard-cartitems-module-pickup-in-store-package">
	<div class="order-wizard-cartitems-module-pickup-in-store-package-accordion-head">
		<a class="order-wizard-cartitems-module-pickup-in-store-package-accordion-head-toggle {{#unless showOpenedAccordion}}collapsed{{/unless}} {{#if isAccordionPrimary}} order-wizard-cartitems-module-pickup-in-store-package-accordion-primary{{/if}}" data-toggle="collapse" data-target="#unfulfilled-items-{{model.location}}" aria-controls="unfulfilled-items">
		{{#if showLocation}}
			<span>{{translate 'Pick Up at '}}</span>
			<span class="order-wizard-cartitems-module-pickup-in-store-package-accordion-head-toggle-location-name">{{location.name}}</span>
			<span> ({{itemCount}})</span>
		{{else}}
			{{translate 'Items to Pick Up ($(0))' itemCount}}
		{{/if}}
		<i class="order-wizard-cartitems-module-pickup-in-store-package-accordion-toggle-icon"></i>
		</a>
	</div>
	<div class="order-wizard-cartitems-module-pickup-in-store-package-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="unfulfilled-items-{{model.location}}" role="tabpanel">
		<div class="order-wizard-cartitems-module-pickup-in-store-package-accordion-container" data-content="order-items-body">
			{{#if showLocation}}
				<div class="order-wizard-cartitems-module-pickup-in-store-package-dropdown">
					<a id="order-wizard-cartitems-module-pickup-in-store-package-view-location-dropdown" class="order-wizard-cartitems-module-pickup-in-store-package-view-location-data-link" data-toggle="dropdown" aria-expanded="true">
						<span class="order-wizard-cartitems-module-pickup-in-store-package-location-label"> {{translate 'Pick up at'}} </span>
						{{location.name}} <i class="order-wizard-cartitems-module-pickup-in-store-package-icon-angle-down"></i>
					</a>

					<div class="order-wizard-cartitems-module-pickup-in-store-package-dropdown-menu" aria-labelledby="order-wizard-cartitems-module-pickup-in-store-package-view-location-dropdown">
						<div data-view="PickupInStore.StoreLocationInfo"></div>
					</div>
				</div>
			{{/if}}
			<div class="order-wizard-cartitems-module-pickup-in-store-package-products-scroll">
				<table class="{{#if showMobile}}lg2sm-first{{/if}} order-wizard-cartitems-module-pickup-in-store-package-table">
					<tbody data-view="Items.Collection"></tbody>
				</table>
			</div>
			{{#if showEditCartButton}}
				<div class="order-wizard-cartitems-module-pickup-in-store-package-edit-cart-label">
					<a href="#" class="order-wizard-cartitems-module-pickup-in-store-package-edit-cart-link" data-action="edit-module" data-touchpoint="viewcart">
						{{translate 'Edit Cart'}}
					</a>
				</div>
			{{/if}}
		</div>
	</div>
</section>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
