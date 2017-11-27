{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="pickup-in-store-store-selector-list-row" data-id="{{location.internalid}}">
    <div class="pickup-in-store-store-selector-list-row-detail">
        <div class="pickup-in-store-store-selector-list-row-location">
            <p class="pickup-in-store-store-selector-list-row-location-name">{{location.name}}</p>
        </div>

        <div class="pickup-in-store-store-selector-list-row-dropdown">
            {{#if showServiceHours}}
                <a
                    id="pickup-in-store-store-selector-list-row-opening-hours"
                    class="pickup-in-store-store-selector-list-row-opening-hours"
                    data-toggle="dropdown">

                    <span class="pickup-in-store-store-selector-list-row-location-address">
                        {{location.distance}} {{location.distanceunit}} - {{location.address1}} {{#if areSetCityAndAddress}}, {{/if}} {{#if showCity}} {{location.city}}, {{#if showStoreState}} {{location.state}} {{/if}}{{#if showZipCode}} {{location.zip}}  {{/if}}{{/if}}
                    </span><br />

                    {{translate 'Opening & Pickup Hours'}} <i class="pickup-in-store-store-selector-list-row-icon-angle-down"></i>
                </a>

                <div
                    class="pickup-in-store-store-selector-list-row-opening-hours-flyout-content"
                    data-type="opening-hours-flyout"
                    aria-labelledby="pickup-in-store-store-selector-list-row-opening-hours" >
                    <div data-view="PickupInStore.StoreLocationInfo"></div>
                </div>
            {{else}}
                 <span class="pickup-in-store-store-selector-list-row-location-address">
                    {{location.distance}} {{location.distanceunit}} - {{location.address1}} {{#if areSetCityAndAddress}}, {{/if}} {{#if showCity}} {{location.city}}, {{#if showStoreState}} {{location.state}} {{/if}}{{#if showZipCode}} {{location.zip}}  {{/if}}{{/if}}
                </span><br />
            {{/if}}
        </div>
    </div>

    <div class="pickup-in-store-store-selector-list-row-stock">
        {{#if storeHasStock}}
            <span class="pickup-in-store-store-selector-list-row-stock-status-available">{{location.qtyavailableforstorepickup}} {{translate 'Available Today'}}</span>
        {{else}}
            <span class="pickup-in-store-store-selector-list-row-stock-status-out-of-stock">{{translate 'Out of Stock'}}</span>
        {{/if}}
    </div>

    <div class="pickup-in-store-store-selector-list-row-button-box">
        {{#if storeHasStock}}
            {{#if isStoreSelected}}
                <span class="pickup-in-store-store-selector-list-row-store-selected"><i></i> {{translate 'Pickup at this Store'}}</span>
            {{else}}
                <button type="button" name="button" data-store-id="{{location.internalid}}" data-action="select-store" class="pickup-in-store-store-selector-list-row-select-for-pickup">
                    {{translate 'Select for Pickup'}}
                </button>
            {{/if}}
        {{else}}
            <span class="pickup-in-store-store-selector-list-row-no-available">{{translate 'Not available for Pickup'}}</span>
        {{/if}}
    </div>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
