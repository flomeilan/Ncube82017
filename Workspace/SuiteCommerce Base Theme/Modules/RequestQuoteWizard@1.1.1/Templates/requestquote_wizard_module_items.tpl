{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="requestquote-wizard-module-items">
	{{#if showTitle}}
		<h3 class="requestquote-wizard-module-items-title">
			{{title}}
		</h3>
	{{/if}}

	{{#if hasItems}}
		<table class="requestquote-wizard-module-items-table">
			{{#if showHeaders}}
				<thead class="requestquote-wizard-module-items-header" item-id="{{itemId}}" data-id="{{itemId}}">
					<th class="requestquote-wizard-module-items-header-image" name="item-image">
						{{translate 'Item'}}
					</th>
					<th class="requestquote-wizard-module-items-header-totalprice" name="item-totalprice">
						<!-- {{translate 'List Price'}} -->
					</th>
					<th class="requestquote-wizard-module-items-header-quantity" name="item-quantity">
						{{translate 'Quantity'}}
					</th>
					<th class="requestquote-wizard-module-items-header-actions" name="item-actions">
						<!-- {{translate 'Quantity'}} -->
					</th>
				</thead>
			{{/if}}
			<tbody data-view="Items.Collection" data-generalClass="requestquote-wizard-module-items-item"></tbody>
		</table>
	{{/if}}
</div>



{{!----
Use the following context variables when customizing this template: 
	
	showTitle (Boolean)
	title (String)
	showHeaders (Boolean)
	hasItems (Boolean)

----}}
