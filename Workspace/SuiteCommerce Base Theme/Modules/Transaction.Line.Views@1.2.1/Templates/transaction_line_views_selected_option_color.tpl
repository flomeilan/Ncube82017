{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="transaction-line-views-selected-option-color" name="{{label}}">
	<ul class="transaction-line-views-selected-option-color-tiles-container">
		<li class="transaction-line-views-selected-option-color-label">
			<label class="transaction-line-views-selected-option-color-label-text">{{label}}:</label>
		</li>
		<li>
			<span class="transaction-line-views-selected-option-color-tile">
				{{#if selectedValue.isImageTile}}
					<img
						src="{{selectedValue.image.src}}"
						alt="{{selectedValue.label}}"
						width="{{selectedValue.image.width}}"
						height="{{selectedValue.image.height}}">
				{{else}}
					<span class="transaction-line-views-selected-option-color-tile-color {{#if selectedValue.isLightColor}}white-border{{/if}}" title="{{selectedValue.label}}" style="background: {{selectedValue.color}}"></span>
				{{/if}}
			</span>
		</li>
		<li class="transaction-line-views-selected-option-color-text">
			{{selectedValue.label}}
		</li>
	</ul>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
