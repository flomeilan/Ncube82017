{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-tile" data-type="option" data-cart-option-id="{{cartOptionId}}" data-item-option-id="{{itemOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		{{#if showLabel}}
			<label class="product-views-option-tile-label">
				{{label}}
				{{#if showSelectedValue}}
					: <span data-value="{{cartOptionId}}">{{selectedValue.label}}</span>
				{{/if}}
				{{#if showRequiredLabel}}<span class="product-views-option-tile-label-required">*</span>{{/if}}
			</label>
		{{/if}}
		<div class="{{cartOptionId}}-controls product-views-option-tile-container" data-validation="control">
			{{#each values}}
				{{#if internalId}}
					<label
					data-label="label-{{../cartOptionId}}" value="{{internalId}}"
					class="product-views-option-tile-picker {{#if isActive}}active{{/if}} {{#if ../showSmall}}product-views-option-tile-picker-small{{/if}}">
						<input
							class="product-views-option-tile-input-picker"
							type="radio"
							name="{{../cartOptionId}}"
							data-action="changeOption"
							value="{{internalId}}"
							{{#if isActive}}checked{{/if}}
							data-toggle="set-option"
							data-active="{{isActive}}"
							data-available="{{isAvailable}}" />
						{{label}}
					</label>
				{{/if}}
			{{/each}}
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.cartOptionId (String)
	model.itemOptionId (String)
	model.label (String)
	model.type (String)
	values (Array)
	showSelectedValue (Boolean)
	showRequiredLabel (Boolean)
	itemOptionId (String)
	cartOptionId (String)
	label (String)
	selectedValue (Object)
	isTextArea (Boolean)
	isEmail (Boolean)
	isText (Boolean)
	isCheckbox (Boolean)
	isDate (Boolean)
	isSelect (Boolean)
	showLabel (Boolean)
	showSmall (Boolean)

----}}
