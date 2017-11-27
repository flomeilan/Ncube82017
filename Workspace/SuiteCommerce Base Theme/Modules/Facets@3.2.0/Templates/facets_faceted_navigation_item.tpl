{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showFacet}}
	<div class="facets-faceted-navigation-item-facet-group" id="{{htmlId}}" data-type="rendered-facet" data-facet-id="{{facetId}}">
		{{#if showHeading}}
			{{#if isUncollapsible}}
				<div class="facets-faceted-navigation-item-facet-group-expander">
					<h4 class="facets-faceted-navigation-item-facet-group-title">
						{{facetDisplayName}}
						{{#if showRemoveLink}}
						<a class="facets-faceted-navigation-item-filter-delete" href="{{removeLink}}">
							<i class="facets-faceted-navigation-item-filter-delete-icon"></i>
						</a>
						{{/if}}
					</h4>
				</div>
			{{else}}
				<a href="#" class="facets-faceted-navigation-item-facet-group-expander" data-toggle="collapse" data-target="#{{htmlId}} .facets-faceted-navigation-item-facet-group-wrapper" data-type="collapse" title="{{facetDisplayName}}">
					<i class="facets-faceted-navigation-item-facet-group-expander-icon"></i>
					<h4 class="facets-faceted-navigation-item-facet-group-title">{{facetDisplayName}}</h4>
					{{#if showRemoveLink}}
						<a class="facets-faceted-navigation-item-filter-delete" href="{{removeLink}}">
							<i class="facets-faceted-navigation-item-filter-delete-icon"></i>
						</a>
					{{/if}}
				</a>
			{{/if}}
		{{/if}}

		<div class="{{#if isCollapsed}} collapse {{else}} collapse in {{/if}} facets-faceted-navigation-item-facet-group-wrapper">
			<div class="facets-faceted-navigation-item-facet-group-content">
				<ul class="facets-faceted-navigation-item-facet-optionlist">
					{{#each displayValues}}
						<li>
							<a class="facets-faceted-navigation-item-facet-option {{#if isActive}}option-active{{/if}}" href="{{link}}" title="{{label}}">
								{{#if ../isMultiSelect}}
									<input type="checkbox" class="facets-faceted-navigation-item-facet-multi" {{#if isActive}}checked {{/if}} />
								{{/if}}

								<span>{{displayName}}</span>

								{{#unless ../isMultiSelect}}
									{{#if isActive}}
										<i class="facets-faceted-navigation-item-facet-option-circle"></i>
									{{/if}}
								{{/unless}}
							</a>
						</li>
					{{/each}}
				</ul>
				{{#if showExtraValues}}
					<ul class="facets-faceted-navigation-item-facet-optionlist-extra collapse">
						{{#each extraValues}}
							<li>
								<a class="facets-faceted-navigation-item-facet-option {{#if isActive}}option-active{{/if}}" href="{{link}}" title="{{label}}">
									{{#if ../isMultiSelect}}
										<input type="checkbox" class="facets-faceted-navigation-item-facet-multi" {{#if isActive}}checked {{/if}} />
									{{/if}}

									{{displayName}}

									{{#unless ../isMultiSelect}}
										{{#if isActive}}
											<i class="facets-faceted-navigation-item-facet-option-circle"></i>
										{{/if}}
									{{/unless}}
								</a>
							</li>
						{{/each}}
					</ul>
					<div class="facets-faceted-navigation-item-optionlist-extra-wrapper">
						<a class="facets-faceted-navigation-item-optionlist-extra-button" data-toggle="collapse" data-target="#{{htmlId}} .facets-faceted-navigation-item-facet-optionlist-extra" data-action="see-more">
							<span data-type="see-more">
								{{translate 'See More'}}
							</span>
							<span data-type="see-less" class="facets-faceted-navigation-item-alt-caption">
								{{translate 'See Less'}}
							</span>
						</a>
					</div>
				{{/if}}
			</div>
		</div>

	</div>
{{/if}}



{{!----
Use the following context variables when customizing this template:

	htmlId (String)
	facetId (String)
	showFacet (Boolean)
	showHeading (Boolean)
	isUncollapsible (Boolean)
	isMultiSelect (Boolean)
	showRemoveLink (Boolean)
	removeLink (String)
	facetDisplayName (String)
	values (Array)
	displayValues (Array)
	extraValues (Array)
	showExtraValues (Boolean)
	isRange (Boolean)
	rangeValues (Array)
	rangeMin (Number)
	rangeMax (Number)
	rangeFrom (Number)
	rangeFromLabel (String)
	rangeTo (Number)
	rangeToLabel (String)

----}}
