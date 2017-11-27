{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="store-locator-main">
	<div class="store-locator-main-title">
		<h1>{{title}}</h1>
	</div>

	<div class="store-locator-main-layout">
		<div class="store-locator-main-layout-left">
			<div class="store-locator-main-search" data-view="StoreLocatorSearch"></div>
			<div class="store-locator-main-results" data-view="StoreLocatorResults"></div>
			<div class="store-locator-main-see-all-stores">
				<a data-touchpoint="{{touchpoint}}" data-hashtag="stores/all" href="stores/all">{{translate 'See complete list of stores'}}</a>
			</div>
		</div>
		<div class="store-locator-main-layout-right">
			<div class="store-locator-main-map" data-view="StoreLocatorMap" data-type="map-view"></div>
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	touchpoint (String)

----}}
