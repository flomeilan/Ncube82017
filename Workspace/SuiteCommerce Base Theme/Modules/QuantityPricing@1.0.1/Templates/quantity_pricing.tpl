{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}


	<div class="quantity-pricing {{#unless showContent}}quantity-pricing-hidden{{/unless}}">
		<div class="quantity-pricing-container">
			{{#if isAccordion}}
				<div class="quantity-pricing-expander-head">
				 	<a class="quantity-pricing-expander-head-toggle {{#unless isOpen}}collapsed{{/unless}}" data-toggle="collapse" data-target="#expander-body-container-{{itemKey}}" aria-expanded="true" aria-controls="expander-body" data-action="toggle">
				 		{{translate 'Quantity discounts available'}} <i class="quantity-pricing-expander-toggle-icon"></i>
				 	</a>
				</div>
			<div class="quantity-pricing-expander-body collapse {{#if isOpen}}in{{/if}}" data-nonprefix='true' id="expander-body-container-{{itemKey}}" aria-expanded="true">
			{{else}}
				<a class="quantity-pricing-flyout-head-toggle" data-toggle="dropdown" aria-expanded="false"> {{translate 'Quantity discounts available'}} <i class="quantity-pricing-flyout-toggle-icon"></i></a>
			<div class="quantity-pricing-flyout-content collapsed">
			{{/if}}
				<!-- content -->
				<div class="quantity-pricing-expander-body-container">
					<table>
						<thead>
							<tr>
								<th class="quantity-pricing-table-header-quantity">{{translate 'Quantity'}}</th>
								<th class="quantity-pricing-table-header-price">{{translate 'Price'}}</th>
							</tr>
						</thead>
						<tbody>
							{{#each priceSchedule}}
								<tr>
									{{#if maximumquantity}}
										<td class="quantity-pricing-table-body-quantity">{{minimumquantity}} – {{maximumquantity}}</td>
										{{#if is_range}}
											<td class="quantity-pricing-table-body-price">{{price_range.min_formatted}} - {{price_range.max_formatted}}</td>
										{{else}}
											<td class="quantity-pricing-table-body-price">{{price_formatted}}</td>
										{{/if}}
									{{else}}										
										<td class="quantity-pricing-table-body-quantity">{{minimumquantity}} +</td>
										{{#if is_range}}
											<td class="quantity-pricing-table-body-price">{{price_range.min_formatted}} - {{price_range.max_formatted}}</td>
										{{else}}
											<td class="quantity-pricing-table-body-price">{{price_formatted}}</td>				
										{{/if}}
									{{/if}}
								</tr>
							{{/each}}
						</tbody>
					</table>
				</div>
				<!-- /content -->
			</div>
		</div>
	</div>




{{!----
Use the following context variables when customizing this template: 
	
	isAccordion (Boolean)
	showContent (Boolean)
	priceSchedule (Boolean)
	isOpen (Boolean)
	itemKey (String)

----}}
