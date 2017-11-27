{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if hasValues}}
<div id="{{facetHtmlId}}" class="facets-facet-list" data-type="rendered-facet" data-facet-id="{{facetId}}">
	{{#if showHeading}}
		{{#if unCollapsible}}
			<h3 class="facets-facet-list-heading uncollapsible">
				{{#if hasSelectedFacetValues}}
					<a class="facets-facet-list-heading-link" href="{{facetUrl}}">
						<i class="facets-facet-list-heading-icon-remove"></i>
					</a>
				{{/if}}
				{{facetName}}
			</h3>
		{{else}}
			<h3 class="facets-facet-list-heading" data-toggle="collapse" data-target="#{{facetHtmlId}} .filters" data-type="collapse" title="{{facetName}}">
				{{#if hasSelectedFacetValues}}
					<a class="facets-facet-list-heading-link" href="{{facetUrl}}">
						<i class="facets-facet-list-heading-icon-remove"></i>
					</a>
				{{/if}}
				<i class="facets-facet-list-icon-down" data-collapsed="true"></i>
				<i class="facets-facet-list-icon-right" data-collapsed="false"></i>
				{{facetName}}
			</h3>
		{{/if}}
	{{else}}
		<h3 class="facets-facet-list-heading uncollapsible"></h3>
	{{/if}}
	<div class="facets-facet-list-filters {{#if isCollapsed}} collapse {{else}} in {{/if}}">
		<ul class="facets-facet-list-filters-nav">
			<div data-view="Facets.FacetValue.Values"></div>
		</ul>
		{{#if hasMoreValuesThanConfigMax}}
			<ul class="facets-facet-list-filters-nav-extra collapse">
				<div data-view="Facets.FacetValue.Extra"></div>
			</ul>

			<button class="facets-facet-list-filters-see-more-less collapsed" data-toggle="collapse" data-target="#{{facetHtmlId}} .extra" data-type="view-all">
				<span data-collapsed="false">
					{{translate 'See More'}}
				</span>
				<span data-collapsed="true">
					{{translate 'See Less'}}
				</span>
			</button>
		{{/if}}
	</div>
</div>
{{/if}}

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
