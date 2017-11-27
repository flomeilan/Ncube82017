{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a href="/returns" class="return-authorization-detail-back">{{translate '&lt; Back to Returns'}}</a>

<article class="return-authorization-detail">
	<header>
		<h2 class="return-authorization-detail-title">
			{{translate 'Return <span class="return-authorization-detail-number">#$(0)</span>' model.tranid}}
			<span class="return-authorization-detail-header-total"> {{model.summary.total_formatted}} </span>
		</h2>
	</header>

	<div data-type="alert-placeholder"></div>

	<div class="return-authorization-detail-header-info">
		<div class="return-authorization-detail-header-row">
			<div class="return-authorization-detail-header-info-left">
				{{#if showCreatedFrom}}
					<p class="return-authorization-detail-header-info-from">
						<span class="return-authorization-detail-header-info-from-label">
							{{translate 'Created from:'}} 
						</span>
						{{#if showCreatedFromLink}}
						<a href="/purchases/view/{{model.createdfrom.recordtype}}/{{model.createdfrom.internalid}}">
							{{translate 'Purchase #$(0)' model.createdfrom.tranid}}
						</a>
						{{else}}
							{{translate 'Purchase #$(0)' model.createdfrom.name}}
						{{/if}}
					</p>
				{{/if}}
				<p class="return-authorization-detail-header-info-return-date">
					{{translate 'Date:'}} 
					<span class="return-authorization-detail-header-info-return-date-value">{{model.trandate}}</span>
				</p>
				<p class="return-authorization-detail-header-info-amount">
					{{translate 'Amount: <span class="return-authorization-detail-header-info-amount-value">$(0)</span>' model.summary.total_formatted}}
				</p>
			</div>
			<div class="return-authorization-detail-header-info-right">
				<p class="return-authorization-detail-status">
					<span class="return-authorization-detail-header-info-status-label">
						{{translate 'Status:'}}
					</span>
					<span class="return-authorization-detail-header-info-status-value">
						{{model.status.name}}
					</span>
				</p>
			</div>
		</div>
	</div>

	<div class="return-authorization-detail-row" name="return-content-layout">
		<div class="return-authorization-detail-content-col">

			<div class="return-authorization-detail-accordion-divider">
				<div class="return-authorization-detail-accordion-head">	
					<a href="#" class="return-authorization-detail-head-toggle {{initiallyCollapsedArrow}}" data-toggle="collapse" data-target="#return-products" aria-expanded="true" aria-controls="return-products">
						{{#if linesLengthGreaterThan1}}
							{{translate 'Returned Products ($(0))' linesLength}}
						{{else}}
							{{translate 'Returned Product'}}
						{{/if}}
						<i class="return-authorization-detail-head-toggle-icon"></i>
					</a>
				</div>
				<div class="return-authorization-detail-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="return-products" role="tabpanel" data-target="#return-products">

					<table class="return-authorization-detail-products-table lg2sm-first">
						<thead class="return-authorization-detail-headers">
					        <tr>
					          	<th class="return-authorization-detail-headers-image"></th>
								<th class="return-authorization-detail-headers-product">{{translate 'Product'}}</th>
								<th class="return-authorization-detail-headers-quantity">{{translate 'Qty'}}</th>
								<th class="return-authorization-detail-headers-reason">{{translate 'Reason'}}</th>
								<th class="return-authorization-detail-headers-amount">{{translate 'Amount'}}</th>
					        </tr>
				      	</thead>
				      	<tbody data-view="Items.Collection"></tbody>
					</table>
				</div>
			</div>

			{{#if showComments}}
				<div class="return-authorization-detail-comments-row">
					<div class="return-authorization-detail-comments">
						<p>{{translate 'Comments:'}}</p>
					
							<blockquote>{{breaklines model.memo}}</blockquote>
						
					</div>
				</div>
			{{/if}}

			{{#if showAppliesSection}}
			<div class="return-authorization-detail-creditmemo-accordion-row">
				<div class="return-authorization-detail-creditmemo-accordion-divider">
					<div class="return-authorization-detail-creditmemo-accordion-head">
						<a class="return-authorization-detail-creditmemo-accordion-head-toggle {{initiallyCollapsedArrow}}" data-toggle="collapse" data-target="#creditmemo-applied-invoices" aria-expanded="true" aria-controls="creditmemo-applied-invoices">
							{{translate 'Applied to Transactions'}}
						<i class="return-authorization-detail-creditmemo-accordion-toggle-icon"></i>
						</a>
					</div>
					<div class="return-authorization-detail-creditmemo-accordion-body collapse {{initiallyCollapsed}}" id="creditmemo-applied-invoices" role="tabpanel" data-target="#creditmemo-applied-invoices">
						<div data-content="items-body">
						{{#if showInvoicesDetails}}

							<table class="return-authorization-detail-creditmemo-table-product">
								<thead class="return-authorization-detail-creditmemo-table-invoices-header">
									<th class="return-authorization-detail-creditmemo-table-invoices-header-title-record"></th>
									<th class="return-authorization-detail-creditmemo-table-invoices-header-date-record">{{translate 'Date'}}</th>
									<th class="return-authorization-detail-creditmemo-table-invoices-header-amount-record">{{translate 'Amount'}}</th>
								</thead>


								<tbody data-view="Invoices.Collection"></tbody>

								<tfoot>
								<tr>
								<td class="return-authorization-detail-creditmemo-accordion-body-container-payment-total" colspan="3">
									<p>
										<span class="return-authorization-detail-creditmemo-accordion-body-container-payment-total-label">{{translate 'Applied Subtotal: '}}</span> 
										<span class="return-authorization-detail-creditmemo-accordion-body-container-payment-subtotal-value">{{model.amountpaid_formatted}}</span>
									</p>
									<p>
										<span class="return-authorization-detail-creditmemo-accordion-body-container-payment-total-label">{{translate 'Remaining subtotal: '}}</span> 
										<span class="return-authorization-detail-creditmemo-accordion-body-container-payment-total-value-remaining">{{ model.amountremaining_formatted}}</span>
									</p>
								</td>
								</tr>
								</tfoot>
							</table>
						{{else}}
							<div class="return-authorization-detail-creditmemo-accordion-body-container-message">
								<p>{{translate 'This return has not been applied yet.'}}</p>
							</div>
						{{/if}}
						</div>
					</div>
				</div>
			</div>
			{{/if}}
		</div>

		<div class="return-authorization-detail-summary-col">
			<div class="return-authorization-detail-summary-container">
				<h3 class="return-authorization-detail-summary-title">
					{{translate 'ITEMS SUMMARY'}}
				</h3>

				<p class="return-authorization-detail-summary-grid-float">
					<span class="return-authorization-detail-summary-subtotal">
						{{model.summary.subtotal_formatted}}
					</span>
					{{translate 'Subtotal'}}
					<span class="return-authorization-detail-summary-subtotal-items">
						{{#if linesitemsNumberGreaterThan1}}
							{{itemsQuantityNumber}} {{translate 'Items'}}
						{{else}}
							{{itemsQuantityNumber}} {{translate 'Item'}}
						{{/if}}
					</span>
				</p>
				
				{{#if showDiscountTotal}}
				<p class="return-authorization-detail-summary-grid-float">
					<span class="return-authorization-detail-summary-amount-discount">
						{{model.summary.discounttotal_formatted}}
					</span>
						{{translate 'Discount Total'}}
				</p>
				{{/if}}

				<p class="return-authorization-detail-summary-grid-float">
					<span class="return-authorization-detail-summary-amount-tax">
						{{model.summary.taxtotal_formatted}}
					</span>
						{{translate 'Tax Total'}}
				</p>
				{{#if showHandlingTotal}}
				<p class="return-authorization-detail-summary-grid-float">
					<span class="return-authorization-detail-summary-amount-handling">
						{{model.summary.handlingcost_formatted}}
					</span>
						{{translate 'Handling Cost'}}
				</p>
				{{/if}}

				{{#if showShippingTotal}}
				<p class="return-authorization-detail-summary-grid-float">
					<span class="return-authorization-detail-summary-amount-shipping">
						{{model.summary.shippingcost_formatted}}
					</span>
						{{translate 'Shipping Cost'}}
				</p>
				{{/if}}

				<div class="return-authorization-detail-summary-total">
					<p class="return-authorization-detail-summary-grid-float">
						<span class="return-authorization-detail-summary-amount-total">
							{{model.summary.total_formatted}}
						</span>
						{{translate 'TOTAL'}}
					</p>
				</div>
			</div>
				<!-- DOWNLOAD AS PDF -->
				<div class="return-authorization-detail-summary-pdf">
					<a class="return-authorization-detail-summary-pdf-download-button" data-stdnav target="_blank" href="{{downloadPDFURL}}">
						{{translate 'Download as PDF'}}
					</a>
				</div>

				{{#if isCancelable}}
					<div class="return-authorization-detail-summary-cancel-request">
						<button class="return-authorization-detail-summary-cancel-request-button" data-action="cancel">{{translate 'Cancel Request'}}</button>
					</div>
				{{/if}}
			</div>
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.addresses (Array)
	model.addresses.0 (Object)
	model.addresses.0.internalid (String)
	model.addresses.0.country (String)
	model.addresses.0.state (String)
	model.addresses.0.city (String)
	model.addresses.0.zip (String)
	model.addresses.0.addr1 (String)
	model.addresses.0.addr2 (String)
	model.addresses.0.phone (String)
	model.addresses.0.fullname (String)
	model.addresses.0.company (undefined)
	model.addresses.0.isvalid (String)
	model.shipmethods (Array)
	model.shipmethods.0 (Object)
	model.shipmethods.0.internalid (undefined)
	model.shipmethods.0.name (undefined)
	model.shipmethods.0.rate (Number)
	model.shipmethods.0.rate_formatted (String)
	model.shipmethods.0.shipcarrier (undefined)
	model.lines (Array)
	model.lines.0 (Object)
	model.lines.0.item (Object)
	model.lines.0.item.internalid (Number)
	model.lines.0.item.type (String)
	model.lines.0.quantity (Number)
	model.lines.0.internalid (String)
	model.lines.0.options (Array)
	model.lines.0.shipaddress (undefined)
	model.lines.0.shipmethod (undefined)
	model.lines.0.location (String)
	model.lines.0.fulfillmentChoice (String)
	model.paymentmethods (Array)
	model.applies (Array)
	model.internalid (String)
	model.recordtype (String)
	model.tranid (String)
	model.memo (String)
	model.trandate (String)
	model.currency (Object)
	model.currency.internalid (String)
	model.currency.name (String)
	model.createdfrom (Object)
	model.createdfrom.internalid (String)
	model.createdfrom.name (String)
	model.createdfrom.recordtype (String)
	model.createdfrom.tranid (String)
	model.status (Object)
	model.status.internalid (String)
	model.status.name (String)
	model.summary (Object)
	model.summary.subtotal (Number)
	model.summary.subtotal_formatted (String)
	model.summary.taxtotal (Number)
	model.summary.taxtotal_formatted (String)
	model.summary.tax2total (Number)
	model.summary.tax2total_formatted (String)
	model.summary.shippingcost (Number)
	model.summary.shippingcost_formatted (String)
	model.summary.handlingcost (Number)
	model.summary.handlingcost_formatted (String)
	model.summary.estimatedshipping (Number)
	model.summary.estimatedshipping_formatted (String)
	model.summary.taxonshipping (Number)
	model.summary.taxonshipping_formatted (String)
	model.summary.discounttotal (Number)
	model.summary.discounttotal_formatted (String)
	model.summary.taxondiscount (Number)
	model.summary.taxondiscount_formatted (String)
	model.summary.discountrate (Number)
	model.summary.discountrate_formatted (String)
	model.summary.discountedsubtotal (Number)
	model.summary.discountedsubtotal_formatted (String)
	model.summary.giftcertapplied (Number)
	model.summary.giftcertapplied_formatted (String)
	model.summary.total (Number)
	model.summary.total_formatted (String)
	model.promocodes (Array)
	model.purchasenumber (undefined)
	model.shipaddress (String)
	model.billaddress (String)
	model.shipmethod (undefined)
	model.isCancelable (Boolean)
	model.options (Object)
	downloadPDFURL (String)
	isCancelable (Boolean)
	showCreatedFrom (Boolean)
	showCreatedFromLink (Boolean)
	isElementCollapsed (Boolean)
	linesLength (Number)
	showComments (Boolean)
	showOpenedAccordion (Boolean)
	initiallyCollapsed (String)
	initiallyCollapsedArrow (String)
	linesLengthGreaterThan1 (Boolean)
	itemsQuantityNumber (Number)
	linesitemsNumberGreaterThan1 (Boolean)
	showAppliesSection (Boolean)
	showDiscountTotal (Boolean)
	showHandlingTotal (Boolean)
	showShippingTotal (Boolean)
	showInvoicesDetails (Boolean)

----}}
