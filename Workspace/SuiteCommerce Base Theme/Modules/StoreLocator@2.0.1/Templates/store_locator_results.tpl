{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="store-locator-results">
	<div class="store-locator-results-nav-back" data-action="refine-search" data-type="sc-pusher-header">
		<a data-action="sc-pusher-dismiss" class="store-locator-results-nav-back-link">{{translate 'Back to Refine Search'}}</a>
	</div>
	<div class="store-locator-results-nav-button-container">
		<div class="store-locator-results-nav-button-container-grid">
			<button class="store-locator-results-nav-button-list active" data-action="show-list"> {{translate 'List View'}} </button>
		</div>
		<div class="store-locator-results-nav-button-container-grid">
			<button class="store-locator-results-nav-button-map" data-action="show-map"> {{translate 'Map View'}} </button>
		</div>
	</div>
	<div class="store-locator-results-nav-description">
		<span class="store-locator-results-nav-description-highlight">{{totalStores}} {{translate 'stores'}}</span> {{translate 'near'}}
		<span class="store-locator-results-nav-description-geolocation">"{{myposition}}"</span>
	</div>
	<div data-id="list-view" data-type="list-view">
		<div class="store-locator-results-list active" >
			<ul class="store-locator-results-list-container" data-view="LocatorList"></ul>
		</div>

		<div class="store-locator-results-see-all-stores">
			<a data-touchpoint="{{touchpoint}}" data-hashtag="stores/all" href="stores/all">{{translate 'See complete list of stores'}}</a>
		</div>
	</div>
	{{#if showMap}}
		<div class="store-locator-results-map" data-id="map-view" data-type="map-view" data-view="ResultStoreLocatorMap"></div>
	{{/if}}
</div>




{{!----
Use the following context variables when customizing this template: 
	
	myposition (String)
	totalStores (Number)
	showLocalizationMap (Boolean)
	showMap (Boolean)
	touchpoint (String)

----}}
