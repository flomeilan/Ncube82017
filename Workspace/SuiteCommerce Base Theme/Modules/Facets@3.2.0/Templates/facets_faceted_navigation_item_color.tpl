{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showFacet}}
	<div class="facets-faceted-navigation-item-color-facet-group" id="{{htmlId}}" data-type="rendered-facet" data-facet-id="{{facetId}}">
		{{#if showHeading}}
			{{#if isUncollapsible}}
				<div class="facets-faceted-navigation-item-color-facet-group-expander">
					<i class="facets-faceted-navigation-item-color-facet-group-expander-icon"></i>
					<h4 class="facets-faceted-navigation-item-color-facet-group-title">
						{{facetDisplayName}}
						{{#if showRemoveLink}}
						<a class="facets-faceted-navigation-item-color-filter-delete" href="{{removeLink}}">
							<i class="facets-faceted-navigation-item-color-filter-delete-icon"></i>
						</a>
						{{/if}}
					</h4>
				</div>
			{{else}}
				<a href="#" class="facets-faceted-navigation-item-color-facet-group-expander" data-toggle="collapse" data-target="#{{htmlId}} .facets-faceted-navigation-item-color-facet-group-wrapper" data-type="collapse" title="{{facetDisplayName}}">
					<i class="facets-faceted-navigation-item-color-facet-group-expander-icon"></i>
					<h4 class="facets-faceted-navigation-item-color-facet-group-title">{{facetDisplayName}}</h4>
					{{#if showRemoveLink}}
						<a class="facets-faceted-navigation-item-color-filter-delete" href="{{removeLink}}">
							<i class="facets-faceted-navigation-item-color-filter-delete-icon"></i>
						</a>
					{{/if}}
				</a>
			{{/if}}
		{{/if}}

		{{#if isUncollapsible}}
		<div class="facets-faceted-navigation-item-color-facet-group-wrapper">
		{{else}}
		<div class="facets-faceted-navigation-item-color-facet-group-wrapper {{#if isCollapsed}} collapse {{else}} in{{/if}}">
		{{/if}}
			<div class="facets-faceted-navigation-item-color-facet-group-content">
				<ul class="facets-faceted-navigation-item-color-picker">
					{{#each displayValues}}
						<li >
							<a href="{{link}}" title="{{label}}" data-color="{{label}}" class="facets-faceted-navigation-item-color-option {{#if isLightColor}}white-border{{/if}} {{#if isActive}}active{{/if}}">
								{{#if isImageTile}}
									<img
										src="{{image.src}}"
										alt="{{label}}"
										width="{{image.width}}"
										height="{{image.height}}">
								{{else}}
									<span style="background: {{color}}"></span>
								{{/if}}
							</a>
						</li>
					{{/each}}
				</ul>
				{{#if showExtraValues}}
					<ul class="facets-faceted-navigation-item-color-picker-extra collapse">
						{{#each extraValues}}
							<li >
								<a href="{{link}}" title="{{label}}" data-color="{{label}}" class="facets-faceted-navigation-item-color-extra-option {{#if isLightColor}}white-border{{/if}} {{#if isActive}}active{{/if}}">
									{{#if isImageTile}}
										<img
											src="{{image.src}}"
											alt="{{label}}"
											width="{{image.width}}"
											height="{{image.height}}">
									{{else}}
										<span style="background: {{color}}"></span>
									{{/if}}
								</a>
							</li>
						{{/each}}
					</ul>

					<div class="facets-faceted-navigation-item-color-optionlist-extra-wrapper">
						<a class="facets-faceted-navigation-item-color-optionlist-extra-button" data-toggle="collapse" data-target="#{{htmlId}} .facets-faceted-navigation-item-color-picker-extra" data-action="see-more">
							<span data-type="see-more">
								{{translate 'See More'}}
							</span>
							<span data-type="see-less" class="facets-faceted-navigation-item-color-alt-caption">
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
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
