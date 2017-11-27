{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-float" data-type="option" data-cart-option-id="{{cartOptionId}}" data-item-option-id="{{itemOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		{{#if showLabel}}
			<label class="product-views-option-float-label" for="{{cartOptionId}}">
				{{label}} {{#if showRequiredLabel}}<span class="product-views-option-float-label-required">*</span>{{/if}}
			</label>
		{{/if}}
		<div data-validation="control">			
			<input
				name="{{cartOptionId}}"
				type="number"
				id="{{cartOptionId}}"
				step="0.01"				
				class="product-views-option-float-input"
				value="{{#if showSelectedValue}}{{selectedValue.internalId}}{{/if}}"
				>
		</div>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
