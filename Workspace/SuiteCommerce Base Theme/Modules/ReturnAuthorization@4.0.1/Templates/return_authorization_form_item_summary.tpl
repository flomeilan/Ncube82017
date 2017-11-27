{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if isLineActive}}
	<label class="return-authorization-form-item-summary-quantity-label">{{translate 'Quantity to return:'}}</label>
	{{#if isQuantityGreaterThan1}}
		<input class="return-authorization-form-item-summary-quantity-field" data-action="quantity" type="number" name="quantity" data-toggle="false" value="{{selectedQuantity}}" min="1" max="{{maxQuantity}}">{{translate 'of $(0)' maxQuantity}}
		<p><small class="return-authorization-form-item-summary-edit-text">{{translate 'Edit quantity to return'}}</small></p>
	{{ else }}
		<label class="return-authorization-form-item-summary-quantity-label">
			<br>
			{{ maxQuantity }}
		</label>
	{{/if}}
{{else}}
	<label class="return-authorization-form-item-summary-quantity-label">
		{{translate 'Quantity to return:'}} <br>
		<b>
		{{#if isQuantityGreaterThan1}}
			{{translate '$(0) of $(0)' maxQuantity}}
		{{ else }}
			{{maxQuantity}}
		{{/if}}
		</b>
	</label>
{{/if}}

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
