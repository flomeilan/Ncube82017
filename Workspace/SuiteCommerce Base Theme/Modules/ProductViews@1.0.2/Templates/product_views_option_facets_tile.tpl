{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-facets-tile" data-type="option" data-cart-option-id="{{cartOptionId}}" data-item-option-id="{{itemOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		{{#if showLabel}}
			<label class="product-views-option-facets-tile-label">
				{{label}}
				{{#if showSelectedValue}}
					: <span data-value="{{cartOptionId}}">{{selectedValue.label}}</span>
				{{/if}}
				{{#if showRequiredLabel}}<span class="product-views-option-facets-tile-label-required">*</span>{{/if}}
			</label>
		{{/if}}
		<div class="{{cartOptionId}}-controls product-views-option-facets-tile-container" data-validation="control">
			{{#each values}}
				{{#if internalId}}
					<a class="product-views-option-facets-tile-picker-anchor" href="{{url}}">
						<label
						data-label="label-{{../cartOptionId}}" value="{{internalId}}"
						class="product-views-option-facets-tile-picker{{#if ../showSmall}}-small{{/if}}">
							{{label}}
						</label>
					</a>
				{{/if}}
			{{/each}}
		</div>
	</div>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
