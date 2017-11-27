{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showCurrencySelector}}
	<div class="global-views-currency-selector">
		<span class="global-views-currency-selector-addon">
			{{currentCurrencySymbol}}
		</span>
		<select data-toggle="currency-selector" class="global-views-currency-selector-select">
			{{#each availableCurrencies}}
				<option value="{{code}}" {{#if isSelected}}selected{{/if}}>
					{{displayName}}
				</option>
			{{/each}}
		</select>
	</div>
{{/if}}



{{!----
Use the following context variables when customizing this template: 
	
	showCurrencySelector (Boolean)
	availableCurrencies (Array)
	currentCurrencyCode (String)
	currentCurrencySymbol (String)

----}}
