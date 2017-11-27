{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}


{{#if showFacet}}
<div class="facets-faceted-navigation-item-category">
	{{#if isUncollapsible}}
		<div class="facets-faceted-navigation-item-category-facet-group-expander">
			<h3 class="facets-faceted-navigation-item-category-title">{{parentName}}</h3>
		</div>
	{{else}}
		<a href="#" class="facets-faceted-navigation-item-category-facet-group-expander" data-toggle="collapse" data-target="#{{htmlId}} .facets-faceted-navigation-item-category-facet-group-wrapper" data-type="collapse" title="{{translate 'Category'}}">
			<i class="facets-faceted-navigation-item-category-facet-group-expander-icon"></i>
			<h3 class="facets-faceted-navigation-item-category-title">{{parentName}}</h3>
		</a>
	{{/if}}

	<div class="facets-faceted-navigation-item-category-facet-group" data-type="rendered-facet" data-facet-id="{{facetId}}"  id="{{htmlId}}">

		<div class="{{#if isCollapsed}} collapse {{else}} collapse in {{/if}} facets-faceted-navigation-item-category-facet-group-wrapper">
			<div class="facets-faceted-navigation-item-category-facet-group-content">
				<ul class="facets-faceted-navigation-item-category-facet-optionlist">
					{{#each displayValues}}
						<li>
							<a class="facets-faceted-navigation-item-category-facet-option {{#if isActive}}option-active{{/if}}" href="{{link}}" title="{{label}}">
								{{displayName}}
							</a>
						</li>
					{{/each}}
				</ul>

				{{#if showExtraValues}}
					<ul class="facets-faceted-navigation-item-category-facet-optionlist-extra collapse">
						{{#each extraValues}}
							<li>
								<a class="facets-faceted-navigation-item-category-facet-option {{#if isActive}}option-active{{/if}}" href="{{link}}" title="{{label}}">
									{{displayName}}
								</a>
							</li>
						{{/each}}
					</ul>

					<div class="facets-faceted-navigation-item-category-optionlist-extra-wrapper">
						<button class="facets-faceted-navigation-item-category-optionlist-extra-button" data-toggle="collapse" data-target="#{{htmlId}} .facets-faceted-navigation-item-category-facet-optionlist-extra" data-action="see-more">
							<span data-type="see-more">
								{{translate 'See More'}}
							</span>
							<span data-type="see-less" class="facets-faceted-navigation-item-category-alt-caption">
								{{translate 'See Less'}}
							</span>
						</button>
					</div>
				{{/if}}


			</div>
		</div>
	</div>
</div>
{{/if}}




{{!----
Use the following context variables when customizing this template: 
	
	htmlId (String)
	facetId (String)
	showFacet (Boolean)
	values (Array)
	displayValues (Array)
	extraValues (Array)
	showExtraValues (Boolean)
	isUncollapsible (Boolean)
	isCollapsed (Boolean)
	parentName (String)

----}}
