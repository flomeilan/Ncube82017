{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if isAvailableForShip}}
	<div class="pickup-in-store-fulfillment-options-ship pickup-in-store-fulfillment-options">
		<i class="pickup-in-store-fulfillment-options-ship-icon" aria-hidden="true"></i>
		{{translate 'Ship'}}
	</div>
{{/if}}

{{#if isAvailableForPickup}}
	<div class="pickup-in-store-fulfillment-options-pickup pickup-in-store-fulfillment-options">
		<i class="pickup-in-store-fulfillment-options-pickup-icon" aria-hidden="true"></i>
		{{translate 'Pick up in Store'}}
	</div>
{{/if}}

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
