{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="pickup-in-store-store-selector-list-divider"></div>

<div class="pickup-in-store-store-selector-list-result">
	<div class="pickup-in-store-store-selector-list-result-item-selected-detail-mobile" data-view="Line.Item.Information"></div>

	<h4 class="pickup-in-store-store-selector-list-result-title">
		<span>{{storesLength}}
			{{#if isOneStore}}
				{{translate 'Store'}}
			{{else}}
				{{translate 'Stores'}}
			{{/if}}
		</span> {{translate 'near'}} {{myPosition}}
	</h4>

	{{#if isEmptyStores}}
		<div data-view="GlobalMessageStoresUnavailable"></div>
	{{else}}
		{{#unless stockPickup}}
			<div data-view="GlobalMessageStoresStockUnavailable"></div>
		{{/unless}}

	{{/if}}

	<a href="#" class="pickup-in-store-store-selector-list-refine-search" data-action="refine-search">{{translate 'Refine Search'}}</a>

	<div class="pickup-in-store-store-selector-list-result-rows" data-type="store-row" style="max-height: {{maxHeight}}px; {{#if isOneStore}} overflow: visible;{{/if}}">
		<div data-view="StoresList.Rows"></div>
	</div>

	<div class="pickup-in-store-store-selector-list-result-item-selected-detail-desktop" data-view="Line.Item.Information"></div>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
