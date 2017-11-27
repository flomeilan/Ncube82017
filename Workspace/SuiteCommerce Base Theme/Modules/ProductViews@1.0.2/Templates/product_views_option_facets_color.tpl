{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-facets-color" data-type="option" data-cart-option-id="{{cartOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		{{#if showLabel}}
			<div class="product-views-option-facets-color-label-header">
				<label class="product-views-option-facets-color-label" for="{{cartOptionId}}">
					{{label}}:
				</label>
				{{#if showSelectedValue}}
					<span class="product-views-option-facets-color-value" data-value="{{cartOptionId}}">{{selectedValue.label}}</span>
				{{/if}}
				{{#if isMandatory}}<span class="product-views-option-facets-color-label-required">*</span>{{/if}}
			</div>
		{{/if}}
		<div class="{{cartOptionId}}-controls product-views-option-facets-color-container-small" data-validation="control">
			{{#each values}}
				{{#if internalId}}
					<div class="product-views-option-facets-color-picker-small">
						<label class="product-views-option-facets-color-picker-label">
								<a class="product-views-option-facets-color-picker-anchor" href="{{url}}">
									{{#if isColorTile}}
										<span data-label="label-{{../cartOptionId}}" value="{{internalId}}" class="product-views-option-facets-color-picker-box {{#if isLightColor}}product-views-option-facets-color-picker-box-white-border{{/if}}"
										style="background: {{color}}"></span>
									{{else}}
										<img data-label="label-{{../cartOptionId}}" value="{{internalId}}"
											src="{{image.src}}"
											style="height:{{image.height}};width:{{image.width}}"
											alt="{{label}}"
											class="product-views-option-facets-color-picker-box-img">
									{{/if}}
								</a>
						</label>
					</div>
				{{/if}}
			{{/each}}
		</div>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
