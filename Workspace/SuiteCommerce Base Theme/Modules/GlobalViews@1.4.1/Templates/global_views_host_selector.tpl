{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showHosts}}
<div class="global-views-host-selector">
	<span class="global-views-host-selector-addon">
		<i class="global-views-host-selector-globe-icon"></i>
	</span>
	<select data-toggle="host-selector" class="global-views-host-selector-select">
		{{#each availableHosts}}
		
			{{#if hasLanguages}}
				<optgroup label="{{title}}">
					{{#each languages}}
						<option value="{{host}}" {{#if isSelected}}selected{{/if}}>
							{{displayName}}
						</option>
					{{/each}}
				</optgroup>
			{{/if}}
			
		{{/each}}
	</select>
</div>
{{/if}}

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
