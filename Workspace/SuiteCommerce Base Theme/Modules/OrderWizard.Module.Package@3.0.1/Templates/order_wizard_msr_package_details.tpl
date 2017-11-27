{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-msr-package-details">
	<div class="order-wizard-msr-package-details-accordion-divider">
		<div class="order-wizard-msr-package-details-accordion-head">
			<a class="order-wizard-msr-package-details-accordion-head-toggle-secondary {{#unless showOpenedAccordion}}collapsed{{/unless}}" data-toggle="collapse" data-target="#package-details-products-{{addressId}}" aria-expanded="true" aria-controls="package-details-products-{{addressId}}">
				<div class="order-wizard-msr-package-details-accordion-head-title-container">
					<span class="order-wizard-msr-package-details-accordion-head-address-name">
						{{ addressName }} 
					</span>
					<i class="order-wizard-msr-package-details-accordion-toggle-icon-secondary"></i>
					<span class="order-wizard-msr-package-details-accordion-head-count">
						{{#if itemCountGreaterThan1}}
							{{ translate '$(0) Items' itemCount}}
						{{else}}
							{{ translate '1 Item'}}
						{{/if}}
					</span>
				</div>
				<p class="order-wizard-msr-package-details-accordion-head-address">
					{{ address }}		
				</p>
			</a>
		</div>
		<div class="order-wizard-msr-package-details-accordion-body collapse" id="package-details-products-{{addressId}}" role="tabpanel" data-target="#package-details-products-{{addressId}}">
			<div class="order-wizard-msr-package-details-accordion-container" data-content="order-items-body">
				<div class="order-wizard-msr-package-details-row-fluid" data-type="package" >
					<div data-type="package-style" class="order-wizard-msr-package-details-multishipto-package">
							<div>

								<div class="order-wizard-msr-package-details-address-container" data-type="address-container">
									<div class="order-wizard-msr-package-details-address-container-addresses">
										<div data-view="Address.Details" class="order-wizard-msr-package-details-address-card"></div>
									</div>
								</div>

								<div class="order-wizard-msr-package-details-address-items-container" data-type="accordion">
									<table>
										<tbody class="order-wizard-msr-package-details-actionable-table" data-view="Items.Collection">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	packageTitle (String)
	itemCountGreaterThan1 (Boolean)
	itemCount (Number)
	isPackageExpanded (Boolean)
	addressId (String)
	addressName (String)
	address (String)

----}}
