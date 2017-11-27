{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-checkbox" data-type="option" data-cart-option-id="{{cartOptionId}}" data-item-option-id="{{itemOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		{{#if showLabel}}
			<label class="product-views-option-checkbox-label" for="{{cartOptionId}}">
				{{label}}
			</label>
		{{/if}}
		<div data-validation="control">			
			<input
				name="{{cartOptionId}}"
				type="checkbox"
				id="{{cartOptionId}}"
				class="product-views-option-checkbox-input"
				value="T"
				{{#if isActive}}checked{{/if}}				
				>			
		</div>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
