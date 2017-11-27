{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="case-list-button-back">
		<i class="case-list-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="case-list">
	<header class="case-list-header">
		<h2 class="case-list-title">
			{{pageHeader}}
		</h2>
		<div data-confirm-message class="case-list-confirm-message"></div>

		<a class="case-list-header-button-new" href="#" data-touchpoint="customercenter" data-hashtag="#/newcase">{{translate 'Create New Case'}}</a>
	</header>

	<div data-view="List.Header" class="case-list-list-header-container"></div>

	<div class="case-list-results-container">
		{{#if hasCases}}
			<table class="case-list-recordviews-table">
				<thead class="case-list-content-table">
					<tr class="case-list-content-table-header-row">
						<th class="case-list-content-table-header-row-title">
							<span>{{translate 'Case No.'}}</span>
						</th>
						<th class="case-list-content-table-header-row-subject">
							<span>{{translate 'Subject'}}</span>
						</th>
						<th class="case-list-content-table-header-row-creation-date">
							<span>{{translate 'Creation date'}}</span>
						</th>
						<th class="case-list-content-table-header-row-date">
							<span>{{translate 'Last Message'}}</span>
						</th>
						<th class="case-list-content-table-header-row-status">
							<span>{{translate 'Status'}}</span>
						</th>
					</tr>
				</thead>
				<tbody data-view="Case.List.Items"></tbody>
			</table>
		{{else}}
			{{#if isLoading}}
				<p class="case-list-empty">{{translate 'Loading...'}}</p>
			{{else}}
				<p class="case-list-empty">{{translate 'No cases were found'}}</p>
			{{/if}}
		{{/if}}
	</div>

	{{#if showPagination}}
		<div class="case-list-paginator">
			<div data-view="GlobalViews.Pagination" class="case-list-global-views-pagination"></div>
			{{#if showCurrentPage}}
				<div data-view="GlobalViews.ShowCurrentPage" class="case-list-global-views-current-page"></div>
			{{/if}}
		</div>
	{{/if}}
</section>




{{!----
Use the following context variables when customizing this template: 
	
	pageHeader (String)
	hasCases (Number)
	isLoading (Boolean)
	showPagination (Boolean)
	showCurrentPage (Boolean)
	showBackToAccount (Boolean)

----}}
