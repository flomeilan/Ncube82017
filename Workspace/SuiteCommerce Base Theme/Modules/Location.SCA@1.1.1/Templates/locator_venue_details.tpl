{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="locator-venue-details">
	<div class="locator-venue-details-container">
		{{#if showAddress}}
			<div class="locator-venue-details-container-address">
				<h5 class="locator-venue-details-title">{{location.name}}</h5>
				{{#if showStoreAddress}}
					<p class="locator-venue-details-address">{{location.address1}}</p>
				{{/if}}
				{{#if showCity}}
					<p>
						<span class="locator-venue-details-city">{{location.city}}</span>{{#if showStoreState}}, <span class="locator-venue-details-state">{{location.state}}</span> {{/if}}
						{{#if showZipCode}} <span class="locator-venue-details-zipcode">{{location.zip}}</span>{{/if}}
					</p>
				{{/if}}
				{{#if showPhone}}
					<p>
						<span class="locator-venue-details-phone-label">{{translate 'Phone:'}} </span> 
						<a href="tel:{{location.phone}}" class="locator-venue-details-phone">{{location.phone}}</a>
					</p>
				{{/if}}
			{{/if}}
		</div>

		{{#if showServiceHours}}
			<div class="locator-venue-details-container-services-hours">
				<p class="locator-venue-details-container-service-hours-title">{{translate 'Store Hours:'}}</p>

				{{#each serviceHours}}
					<p class="locator-venue-details-container-service-hours-row">{{ row }}</p>
				{{/each}}


				{{#if showCutoffTime}}
					<p class="locator-venue-details-container-services-hours-next-pickup-day-information">

						{{#if nextPickupDayIsToday}}
							{{translate 'Order before $(0) to pick up today' location.nextpickuphour}}
						{{/if}}
						{{#if nextPickupDayIsTomorrow}}
							{{translate 'Order now to pick up tomorrow'}}
						{{/if}}
						{{#if nextPickupDayIsSunday}}
							{{translate 'Order now to pick on Sunday'}}
						{{/if}}
						{{#if nextPickupDayIsMonday}}
							{{translate 'Order now to pick on Monday'}}
						{{/if}}
						{{#if nextPickupDayIsTuesday}}
							{{translate 'Order now to pick on Tuesday'}}
						{{/if}}
						{{#if nextPickupDayIsWednesday}}
							{{translate 'Order now to pick on Wednesday'}}
						{{/if}}
						{{#if nextPickupDayIsThursday}}
							{{translate 'Order now to pick on Thursday'}}
						{{/if}}
						{{#if nextPickupDayIsFriday}}
							{{translate 'Order now to pick on Friday}'}}
						{{/if}}
						{{#if nextPickupDayIsSaturday}}
							{{translate 'Order now to pick on Saturday'}}
						{{/if}}

					</p>
				{{/if}}
			</div>
		{{/if}}

	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	location (Object)
	location.recordtype (String)
	location.internalid (String)
	location.address1 (String)
	location.address2 (String)
	location.address3 (String)
	location.city (String)
	location.country (String)
	location.state (String)
	location.isoffice (String)
	location.makeinventoryavailable (String)
	location.makeinventoryavailablestore (String)
	location.name (String)
	location.phone (String)
	location.zip (String)
	location.location (Object)
	location.location.latitude (String)
	location.location.longitude (String)
	location.locationtype (String)
	showAddress (Boolean)
	showStoreAddress (Boolean)
	showCity (Boolean)
	showZipCode (Boolean)
	showStoreState (Boolean)
	showPhone (Boolean)
	showServiceHours (Boolean)
	serviceHours (Array)
	showCutoffTime (Boolean)
	nextPickupDayIsToday (Boolean)
	nextPickupDayIsTomorrow (Boolean)
	nextPickupDayIsSunday (Boolean)
	nextPickupDayIsMonday (Boolean)
	nextPickupDayIsTuesday (Boolean)
	nextPickupDayIsWednesday (Boolean)
	nextPickupDayIsThursday (Boolean)
	nextPickupDayIsFriday (Boolean)
	nextPickupDayIsSaturday (Boolean)

----}}
