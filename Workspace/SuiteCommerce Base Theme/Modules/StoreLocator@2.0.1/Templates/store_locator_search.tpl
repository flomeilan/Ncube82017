{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<form class="store-locator-search">
	<div class="store-locator-search-search-view">
		<div class="store-locator-search-enter-location">
			
			<div class="store-locator-search-group" data-input="city" data-validation="control-group">
				<label class="store-locator-search-group-label" for="city">
					{{translate 'Enter Address, Zip Code or City'}} 
				</label>
				<div class="store-locator-search-group-form-controls" data-validation="control">
					<input id="autocomplete" type="text" name="city" data-type="autocomplete-input" class="store-locator-search-input-autocomplete"/>
				</div>
				<div class="store-locator-search-buttons-container">
					<div class="store-locator-search-buttons-container-find">
						<button class="store-locator-search-button-find {{#if showResults}}store-locator-search-button-after-find{{/if}}" type="submit">{{translate 'Find Stores'}}</button>
					</div>
					{{#if showUseCurrentLocationButton}}
						<div class="store-locator-search-buttons-container-or-wrap">
							<div class="store-locator-search-buttons-container-or" data-type="geolocation-or"><span>{{translate 'or'}}</span></div>
						</div>
						<div class="store-locator-search-buttons-container-geolocalization" data-type="geolocation-button">
							<button type="button" class="store-locator-search-button-current" data-action="use-geolocation">
								<i class="store-locator-search-button-current-icon"></i> {{translate 'Use Current Location'}}
							</button>
						</div>
					{{/if}}
				</div>
			</div>

			
			<div class="store-locator-search-geolocation" data-type="location-geolocation">
				<div class="store-locator-search-geolocation-message-warning" data-action="message-warning"></div>
			</div>
		</div>
	</div>
</form>



{{!----
Use the following context variables when customizing this template: 
	
	showUseCurrentLocationButton (Boolean)
	showResults (Boolean)

----}}
