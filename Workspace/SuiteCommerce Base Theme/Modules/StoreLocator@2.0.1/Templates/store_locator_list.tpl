{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<li class="store-locator-list-box" data-id={{storeId}}>
	<a data-hashtag="stores/details/{{storeId}}" data-touchpoint="{{touchpoint}}" data-toggle="show-in-pusher">
		<div class="store-locator-list-box-count">
			<div>{{index}}</div>
		</div>
		<ul class="store-locator-list-box-info">
			<li>
				<strong class="store-locator-list-box-info-name">{{storeName}}</strong>
			</li>
			<li class="store-locator-list-box-details">
			<div class="store-locator-list-box-distance">{{storeDistance}} {{distanceUnit}}</div>
			<div class="store-locator-list-box-address">{{storeAddress}}</div>
			</li>
		</ul>
		<span class="store-locator-list-box-arrow-container">
			<i class="store-locator-list-box-arrow-icon"></i>
		</span>
	</a>
</li>




{{!----
Use the following context variables when customizing this template: 
	
	storeName (String)
	storeDistance (Number)
	distanceUnit (String)
	storeAddress (String)
	storeId (String)
	index (Number)
	model (Object)
	model.recordtype (String)
	model.internalid (String)
	model.address1 (String)
	model.address2 (String)
	model.address3 (String)
	model.city (String)
	model.country (String)
	model.state (String)
	model.isoffice (String)
	model.makeinventoryavailable (String)
	model.makeinventoryavailablestore (String)
	model.name (String)
	model.phone (String)
	model.zip (String)
	model.location (Object)
	model.location.latitude (String)
	model.location.longitude (String)
	model.locationtype (String)
	model.distance (Number)
	model.distanceunit (String)
	touchpoint (String)

----}}
