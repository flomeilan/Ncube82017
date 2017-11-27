{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="store-locator-details">
	<div class="store-locator-details-title">
		<h1>{{title}}</h1>
	</div>
	<div class="store-locator-details-layout">
		<div class="store-locator-details-layout-left">
			<div class="store-locator-details-main-details-info">
				<div class="store-locator-details-main-nav-back" data-type="sc-pusher-header">
					<a href="{{redirectUrl}}" data-action="sc-pusher-dismiss">{{translate 'Back to list of stores'}}</a>
				</div>

				<div class="store-locator-details-store-info">
					<div data-view="StoreLocationInfo"></div>

					<a class="store-locator-details-get-directions-link" target="_blank" href={{directionUrl}}>{{translate 'Get directions'}}</a>
				</div>
			</div>
		</div>
		<div class="store-locator-details-layout-right">
			<div class="store-locator-details-map" data-view="LocatorMap" data-type="map-view"></div>
			<div class="store-locator-details-get-directions-button-container">
				<a class="store-locator-details-get-directions-button" target="_blank" href={{directionUrl}}>{{translate 'Get directions'}}</a>
			</div>
		</div>
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	directionUrl (String)
	redirectUrl (String)

----}}
