{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showDividerLines}}
	<div class="pickup-in-store-divider-desktop"></div>
{{/if}}

<div class="pickup-in-store">
	{{#if isAvailable}}

		{{#unless isAvailableForPickupOnly }} <!-- only available for pickup -->
			<div class="pickup-in-store-option">

				{{#if isAvailableForShipOnly }} <!-- only available for shipping -->
					<div>
						<p class="pickup-in-store-option-status-message">
							<i class="pickup-in-store-option-status-message-icon"></i>
							<span>{{translate 'Only available for Shipping'}}</span>
						</p>
					</div>
				{{else}}
					<div class="pickup-in-store-option-column" data-action="selectShip">
						<input
							type="radio"
							name="ship-pickup-{{itemInternalId}}"
							class="pickup-in-store-option-ship"
							id="pickup-in-store-option-ship-{{itemInternalId}}"
							{{#if isShipSelected}} checked="checked" {{/if}} />
					</div>
				{{/if}}

				<div class="pickup-in-store-option-column">
					{{#unless isAvailableForShipOnly }}
						<label for="pickup-in-store-option-ship-{{itemInternalId}}"> {{translate 'Ship'}}</label>
					{{/unless}}

					<div>
						{{#if stockInfo.isInStock }}
							{{#if showQuantityAvailable }}
								<p class="pickup-in-store-option-ship-status pickup-in-store-option-status-available">
									{{translate '$(0) Available' stockInfo.stock }}
								</p>
							{{else}}
								<p class="pickup-in-store-option-ship-status pickup-in-store-option-status-available">
									{{translate 'Available'}}
								</p>
							{{/if}}
						{{/if}}
						{{#if stockInfo.showOutOfStockMessage}}
							<span class="pickup-in-store-option-ship-status pickup-in-store-option-status-not-available">{{stockInfo.outOfStockMessage}}</span>
							<span class="pickup-in-store-option-status-pre-order"> - {{translate 'Pre-order now!'}}</span>
						{{/if}}
					</div>
				</div>
			</div>
		{{/unless}}

		{{#unless isAvailableForShipOnly}}
			<div class="pickup-in-store-option">
				{{#if isAvailableForPickupOnly }}
					<div>
						<p class="pickup-in-store-option-status-message">
							<i class="pickup-in-store-option-status-message-icon"></i>
							<span>{{translate 'Only available for Pickup'}}</span>
						</p>
					</div>
				{{else}}
					<div class="pickup-in-store-option-column">
						<input
							id="pickup-in-store-option-pickup-{{itemInternalId}}"
							type="radio"
							data-action="selectPickup"
							name="ship-pickup-{{itemInternalId}}"
							class="pickup-in-store-option-pickup"
							data-type="sc-pusher"
							data-target="pickup-in-store-select-store-pusher"
                            {{#if isLocationSelected}}
                                {{#if locationHasStock}}
                                    {{#if isPickupSelected}}
                                        checked="checked"
                                    {{/if}}
                                {{else}}
                                    disabled
                                {{/if}}
                            {{/if}} />
					</div>
				{{/if}}

				<div class="pickup-in-store-option-column">
					<label class="pickup-in-store-option-pickup-label {{#if isLocationSelected}}{{#unless locationHasStock}}disabled{{/unless}}{{/if}}" for="pickup-in-store-option-pickup-{{itemInternalId}}">
						{{translate 'Pickup in Store'}} -
						<span class="pickup-in-store-option-pickup-label-free">
							{{translate 'FREE'}}!
						</span>
					</label>

					<div>
						{{#if isLocationSelected}}
							<div class="pickup-in-store-after-select-location">
								{{#if locationHasStock}}

									<div class="pickup-in-store-dropdown">
										<a id="pickup-in-store-view-location-dropdown" class="pickup-in-store-view-location-data-link" data-toggle="dropdown" aria-expanded="true">
											<span class="pickup-in-store-option-pickup-status pickup-in-store-option-status-available">
											{{#if showQuantityAvailable }}
												{{#if showCutoffTime}}
													{{#if nextPickupDayIsToday}}
														{{translate '$(0) available today' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsTomorrow}}
														{{translate '$(0) available tomorrow' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsSunday}}
														{{translate '$(0) available on Sunday' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsMonday}}
														{{translate '$(0) available on Monday' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsTuesday}}
														{{translate '$(0) available on Tuesday' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsWednesday}}
														{{translate '$(0) available on Wednesday' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsThursday}}
														{{translate '$(0) available on Thursday' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsFriday}}
														{{translate '$(0) available on Friday}' locationStock}}
													{{/if}}
													{{#if nextPickupDayIsSaturday}}
														{{translate '$(0) available on Saturday' locationStock}}
													{{/if}}
												{{else}}
													{{translate '$(0) available' locationStock}}
												{{/if}}
											{{else}}
												{{#if showCutoffTime}}
													{{#if nextPickupDayIsToday}}
														{{translate 'Available today'}}
													{{/if}}
													{{#if nextPickupDayIsTomorrow}}
														{{translate 'Available tomorrow'}}
													{{/if}}
													{{#if nextPickupDayIsSunday}}
														{{translate 'Available on Sunday'}}
													{{/if}}
													{{#if nextPickupDayIsMonday}}
														{{translate 'Available on Monday'}}
													{{/if}}
													{{#if nextPickupDayIsTuesday}}
														{{translate 'Available on Tuesday'}}
													{{/if}}
													{{#if nextPickupDayIsWednesday}}
														{{translate 'Available on Wednesday'}}
													{{/if}}
													{{#if nextPickupDayIsThursday}}
														{{translate 'Available on Thursday'}}
													{{/if}}
													{{#if nextPickupDayIsFriday}}
														{{translate 'Available on Friday}'}}
													{{/if}}
													{{#if nextPickupDayIsSaturday}}
														{{translate 'Available on Saturday'}}
													{{/if}}
												{{else}}
													{{translate 'Available'}}
												{{/if}}
											{{/if}}
											</span>

											<span class="pickup-in-store-select-store-label"> {{translate 'at'}} </span>

											<span class="pickup-in-store-select-store-location-name">{{location.name}}</span> <i class="pickup-in-store-icon-angle-down"></i>
										</a>

										<div class="pickup-in-store-view-location-data pickup-in-store-dropdown-menu" aria-labelledby="pickup-in-store-view-location-dropdown">
											<div data-view="PickupInStore.StoreLocationInfo"></div>

											<div class="pickup-in-store-store-selected-details-buttons">
												<a class="pickup-in-store-store-selected-details-get-directions-button" href="{{getDirectionsUrl}}" target="_blank">
													{{translate 'Get Directions'}}
												</a>
												<button class="pickup-in-store-store-selected-details-change-store-button" data-action="changeStore" type="button">
													{{translate 'Change Store'}}
												</button>
											</div>
										</div>
									</div>
								{{else}} <!-- available for pickup but the item is out of stock -->
									<p>
										<span class="pickup-in-store-option-pickup-status pickup-in-store-option-status-not-available">{{translate 'Not available'}}</span>
										<span class="pickup-in-store-select-store-label"> {{translate 'at'}} </span>
										<span>{{location.name}}</span>
									</p>
									<p>
										<a data-action="selectPickupLink" class="pickup-in-store-change-store-link">{{translate 'Change Store'}}</a>
									</p>
								{{/if}}
							</div>
						{{else}}
							<div class="pickup-in-store-select-location" data-action="selectPickupLink">
								<a class="pickup-in-store-select-store-link">{{translate 'Select Store'}}</a>
								<span class="pickup-in-store-select-store-label"> {{translate 'to check availability'}}.</span>
							</div>
						{{/if}}
					</div>
				</div>
		</div>
		{{/unless}}

	{{else}}
		<p class="pickup-in-store-option-status-message-out">
			<i class="pickup-in-store-option-status-message-icon"></i>
			<span>{{translate 'Not available'}}</span>
		</p>
	{{/if}}
</div>

{{#if showDividerLines}}
	<div class="pickup-in-store-divider-desktop"></div>
{{/if}}


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
