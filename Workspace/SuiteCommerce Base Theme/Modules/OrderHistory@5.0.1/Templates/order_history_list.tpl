{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="order-history-list-button-back">
		<i class="order-history-list-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="order-history-list">
	<header class="order-history-list-header">
		<h2>{{pageHeader}}</h2>
	</header>

	
	<div class="order-history-list-header-nav">
		<div class="order-history-list-header-button-group">
			{{#if openIsActive}}
				<span class="order-history-list-header-button-open-active">{{translate 'Open'}}</span>					
			{{else}}
				<a href="/open-purchases" class="order-history-list-header-button-open">{{translate 'Open'}}</a>
			{{/if}}

			{{#if isSCISIntegrationEnabled}}
				{{#if inStoreIsActive}}
					<span class="order-history-list-header-button-instore-active">{{translate 'In Store'}}</span>					
				{{else}}
					<a href="/instore-purchases" class="order-history-list-header-button-instore">{{translate 'In Store'}}</a>
				{{/if}}
			{{/if}}

			{{#if allIsActive}}
				<span class="order-history-list-header-button-all-active">{{translate 'All'}}</span>					
			{{else}}
				<a href="/purchases" class="order-history-list-header-button-all">{{translate 'All'}}</a>
			{{/if}}
		</div>
	</div>

	<div data-view="ListHeader" {{#if openIsActive}}style="display:none;"{{/if}}></div>

	{{#if collectionLengthGreaterThan0}}
	<div class="order-history-list-recordviews-container">
		<table class="order-history-list-recordviews-actionable-table">
			<thead class="order-history-list-recordviews-actionable-header">
				<tr>
					<th class="order-history-list-recordviews-actionable-title-header">
						<span>{{translate 'Purchase No.'}}</span>
					</th>
					<th class="order-history-list-recordviews-actionable-date-header">
						<span>{{translate 'Date'}}</span>
					</th>
					<th class="order-history-list-recordviews-actionable-currency-header">
						<span>{{translate 'Amount'}}</span>
					</th>
					{{#if isSCISIntegrationEnabled}}
						{{#unless inStoreIsActive}}
							<th class="order-history-list-recordviews-actionable-origin-header">
								<span>{{translate 'Origin'}}</span>
							</th>
						{{/unless}}
					{{else}}
						<th class="order-history-list-recordviews-actionable-status-header">
							<span>{{translate 'Status'}}</span>
						</th>
					{{/if}}
					<th class="order-history-list-recordviews-actionable-actions-header">
						<span>{{translate 'Track Items'}}</span>
					</th>
				</tr>
			</thead>
			<tbody class="order-history-list" data-view="Order.History.Results"></tbody>
		</table>
	</div>

	{{else}}
		{{#if isLoading}}
			<p class="order-history-list-empty">{{translate 'Loading...'}}</p>
		{{else}}
			<div class="order-history-list-empty-section">
				<h5>{{translate 'You don\'t have any purchases in your account right now.'}}</h5>
				
				{{#unless allIsActive}}
					<p>{{translate 'To see a list of all your past purchases, you can go to the tab <a href="/purchases" class="">All</a>.'}}</p>
				{{/unless}}

				{{#if isSCISIntegrationEnabled}}
					{{#if openIsActive}}
						<p>{{translate 'If you are looking to review some past purchases made in one of our brick and mortar stores, please check the tab <a href="/instore-purchases" class="">In Store</a>.'}}</p>
					{{/if}}	
				{{/if}}
			</div>
		{{/if}}

	{{/if}}

	{{#if showPagination}}
		<div class="order-history-list-case-list-paginator">
			<div data-view="GlobalViews.Pagination"></div>
			{{#if showCurrentPage}}
				<div data-view="GlobalViews.ShowCurrentPage"></div>
			{{/if}}
		</div>
	{{/if}}
</section>



{{!----
Use the following context variables when customizing this template: 
	
	pageHeader (String)
	collectionLengthGreaterThan0 (Boolean)
	isLoading (Boolean)
	showPagination (Boolean)
	showBackToAccount (Boolean)
	isSCISIntegrationEnabled (Boolean)
	allIsActive (Boolean)
	openIsActive (Boolean)
	inStoreIsActive (Boolean)

----}}
