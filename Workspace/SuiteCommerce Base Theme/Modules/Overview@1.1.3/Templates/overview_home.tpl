{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="overview-home">
	<div data-view="Overview.Messages"></div>
	<div class="overview-home-orders" data-permissions="{{purchasesPermissions}}">
		<div class="overview-home-orders-title">
			<h3>{{translate 'Recent Purchases'}}</h3>
			<a href="/purchases" class="overview-home-orders-title-link">{{translate 'View Purchase History'}}</a>
		</div>
		<div class="overview-home-order-history-results-container">
		{{#if collectionLengthGreaterThan0}}

		<table class="overview-home-orders-list-table">
				<thead class="overview-home-content-table">
					<tr class="overview-home-content-table-header-row">
						<th class="overview-home-content-table-header-row-title">
							<span>{{translate 'Purchase No.'}}</span>
						</th>
						<th class="overview-home-content-table-header-row-date">
							<span>{{translate 'Date'}}</span>
						</th>
						<th class="overview-home-content-table-header-row-currency">
							<span>{{translate 'Amount'}}</span>
						</th>
						{{#if isSCISIntegrationEnabled}}
							<th class="overview-home-content-table-header-row-origin">
								<span>{{translate 'Origin'}}</span>
							</th>
						{{else}}
							<th class="overview-home-content-table-header-row-status">
								<span>{{translate 'Status'}}</span>
							</th>
						{{/if}}
						<th class="overview-home-content-table-header-row-track">
							<span>{{translate 'Track Items'}}</span>
						</th>
					</tr>
				</thead>
				<tbody class="overview-home-purchases-list" data-view="Order.History.Results"></tbody>
			</table>

		{{else}}
			<div class="overview-home-orders-empty-section">
				<h5>{{translate 'You don\'t have any purchases in your account right now.'}}</h5>
			</div>
		{{/if}}
		</div>
	</div>
</section>
<section class="overview-home-mysettings">
	<h3>{{translate 'My Settings'}}</h3>
	<div class="overview-home-mysettings-row">
		<div class="overview-home-mysettings-profile">
			<div data-view="Overview.Profile"></div>
		</div>
		<div class="overview-home-mysettings-shipping">
			<div data-view="Overview.Shipping"></div>
		</div>
		<div class="overview-home-mysettings-payment">
			<div data-view="Overview.Payment"></div>
		</div>
	</div>
</section>
<div data-view="Overview.Banner"></div>

{{#if hasCustomerSupportURL}}
	<div class="overview-home-header-links">
		{{translate 'Need Help? Contact <a href="$(0)">Customer Service</a>' customerSupportURL}}
	</div>
{{/if}}



{{!----
Use the following context variables when customizing this template:

	collectionLengthGreaterThan0 (Boolean)
	hasCustomerSupportURL (Boolean)
	customerSupportURL (String)
	firstName (String)
	isSCISIntegrationEnabled (Boolean)
	purchasesPermissions (String)

----}}
