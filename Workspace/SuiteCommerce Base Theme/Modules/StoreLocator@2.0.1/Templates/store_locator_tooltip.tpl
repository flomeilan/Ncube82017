{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<li class="store-locator-tooltip-box">
	<a href="stores/details/{{storeId}}">
		<span class="store-locator-tooltip-box-count">
			<span>{{index}}</span>
		</span>
		<ul class="store-locator-tooltip-box-info">
			<li class="store-locator-tooltip-store-name"><strong>{{storeName}}</strong></li>
			<li class="store-locator-tooltip-box-details">
				{{#if showStoreDistance}}
					<span class="store-locator-tooltip-box-distance">{{storeDistance}} {{distanceUnit}} </span>
				{{/if}}
				{{#if showStoreAddress}}
					<span class="store-locator-tooltip-box-address">{{storeAddress}} </span>
				{{/if}}
			</li>
		</ul>
		<a href="stores/details/{{storeId}}" class="store-locator-tooltip-box-arrow-container">
			<i class="store-locator-tooltip-box-arrow-icon"></i>
		</a>
	</a>
</li>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
