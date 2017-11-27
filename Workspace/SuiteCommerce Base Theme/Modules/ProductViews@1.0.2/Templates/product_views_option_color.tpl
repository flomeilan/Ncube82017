{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-color" data-type="option" data-cart-option-id="{{cartOptionId}}" data-item-option-id="{{itemOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		{{#if showLabel}}
			<div class="product-views-option-color-label-header">
				<label class="product-views-option-color-label" for="{{cartOptionId}}">
					{{label}}:
				</label>
				{{#if showSelectedValue}}
					<span class="product-views-option-color-value" data-value="{{cartOptionId}}">{{selectedValue.label}}</span>
				{{/if}}
				{{#if showRequiredLabel}}<span class="product-views-option-color-label-required">*</span>{{/if}}
			</div>
		{{/if}}
		<div class="{{cartOptionId}}-controls product-views-option-color-container {{#if showSmall}}product-views-option-color-container-small{{/if}}" data-validation="control">
			{{#each values}}
				{{#if internalId}}
					<div class="product-views-option-color-picker">
						<label class="product-views-option-color-picker-label">
							<input
								class="product-views-option-color-picker-input"
								type="radio"
								name="{{../cartOptionId}}"
								id="{{../cartOptionId}}"
								data-action="changeOption"
								value="{{internalId}}"
								{{#if isActive}}checked{{/if}}
								data-toggle="set-option"
								data-active="{{isActive}}"
								data-available="{{isAvailable}}" />
							{{#if isColorTile}}
								<span data-label="label-{{../cartOptionId}}" value="{{internalId}}"
									class="product-views-option-color-picker-box {{#if isActive}}active{{/if}} {{#if isLightColor}}product-views-option-color-picker-box-white-border{{/if}}"
									style="background: {{color}}"></span>
							{{else}}
								<img data-label="label-{{../cartOptionId}}" value="{{internalId}}"
									src="{{resizeImage image.src 'tinythumb'}}"
									style="height:{{image.height}};width:{{image.width}}"
									alt="{{label}}"
									class="product-views-option-color-picker-box-img">
							{{/if}}
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
