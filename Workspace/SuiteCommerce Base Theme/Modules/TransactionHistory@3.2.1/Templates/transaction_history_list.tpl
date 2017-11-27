{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="transaction-history-list-button-back">
		<i class="transaction-history-list-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="transaction-history-list">
	<header class="transaction-history-list-header">
		<h2>{{pageHeader}}</h2>		
	</header>

	{{#if hasTerms}}
		<div data-view="ListHeader.View"></div>

		<div class="transaction-history-list-results-container">
			{{#if isThereAnyResult}}
				<table class="transaction-history-list-results-table">
					<thead class="transaction-history-list-headers">
						<tr>
							<th class="transaction-history-list-headers-number">
								<span>{{translate 'Number'}}</span>
							</th>
							<th class="transaction-history-list-headers-date">
								<span>{{translate 'Date'}}</span>
							</th>
							<th class="transaction-history-list-headers-amount">
								<span>{{translate 'Amount'}}</span>
							</th>
							<th class="transaction-history-list-headers-status">
								<span>{{translate 'Status'}}</span>
							</th>
						</tr>
					</thead>
					<tbody data-view="Records.Collection"></tbody>
				</table>
			{{else}}
				{{#if isLoading}}
					<p class="transaction-history-list-empty">{{translate 'Loading...'}}</p>
				{{else}}
					<div class="transaction-history-list-empty-section">
						<h5>{{translate 'No transactions were found'}}</h5>
					</div>
				{{/if}}
			{{/if}}
		</div>

		{{#if showPagination}}
			<div class="transaction-history-list-paginator">
				<div data-view="GlobalViews.Pagination"></div>
				{{#if showCurrentPage}}
					<div data-view="GlobalViews.ShowCurrentPage"></div>
				{{/if}}
			</div>
		{{/if}}
	{{else}}
		<div class="transaction-history-list-results-container">
			<p class="transaction-history-list-empty">{{translate 'No transactions were found'}}</p>
		</div>
	{{/if}}
</section>




{{!----
Use the following context variables when customizing this template: 
	
	pageHeader (String)
	hasTerms (Boolean)
	isThereAnyResult (Boolean)
	isLoading (Boolean)
	showPagination (Boolean)
	showBackToAccount (Boolean)

----}}
