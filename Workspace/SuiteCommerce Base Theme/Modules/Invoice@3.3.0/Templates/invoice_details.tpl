{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a href="/invoices" class="invoice-details-back-btn">{{translate '&lt; Back to Invoices'}}</a>
<section class="invoice-details">
	<div class="content invoice-details-view">
		{{#unless showInModal}}
			<header>
				<h2 class="invoice-details-invoice-title">
				 	{{translate 'Invoice <span class="invoice-details-invoice-number">#$(0)</span>' model.tranid}}
					<span class="invoice-details-invoice-amount">
						{{#if isOpen}}
							<span class="invoice-details-amount">{{model.amountDue_formatted}}</span>
						{{else}}
							<span class="invoice-details-amount">{{model.summary.total_formatted}}</span>
						{{/if}}
					</span>
				</h2>
			</header>
		{{/unless}}

		<div class="invoice-details-header-information">
			<div class="invoice-details-header-row">
				<div class="invoice-details-header-col-left">
					<p class="invoice-details-header-date-info">
						<span class="invoice-details-header-date-label">{{translate 'Invoice Date: '}}</span>
						<span class="invoice-details-header-date-value">{{model.trandate}}</span>
					</p>
					{{#if showCreatedFrom}}
						<p class="invoice-details-header-created-from">
							<span class="invoice-details-header-created-from-label">{{translate 'Created from: '}}</span>
							 <a href="/purchases/view/{{model.createdfrom.recordtype}}/{{model.createdfrom.internalid}}" class="invoice-details-header-created-from-value">
							 	{{translate 'Purchase #$(0)' model.createdfrom.tranid}}
							 </a>
						</p>
					{{/if}}
					<p class="invoice-details-header-due-date-info">
						{{#if showDueDate}}
							<span class="invoice-details-header-due-date-label">{{translate 'Due Date: '}}</span>
							<span class="invoice-details-header-due-date-value">{{ model.dueDate}}</span>
						{{else}}
							<span class="invoice-details-header-due-date-label">{{translate 'Due Date: '}}</span>
							<span class="invoice-details-header-due-date-value">{{translate ' N/A'}}</span>
						{{/if}}

					</p>
				</div>
				<div class="invoice-details-header-col-right">
					<p class="invoice-details-header-status-info">
						<span class="invoice-details-header-status-label">{{translate 'Status: '}}</span>
						<span class="invoice-details-header-status-value">{{ model.status.name}}</span>
					</p>
				</div>
				<div class="invoice-details-header-amount">
					<p class="invoice-details-header-amount-info">
						{{#if isOpen}}
						<span class="invoice-details-header-amount-label">{{translate 'Amount:'}}</span>
							{{ model.amountDue_formatted}}
						{{else}}
						<span class="invoice-details-header-amount-label">{{translate 'Amount:'}}</span>
							{{ model.summary.total_formatted}}
						{{/if}}
					</p>
				</div>
			</div>
		</div>

		<div class="invoice-details-row" name="invoice-content-layout">
			{{#unless showInModal}}
				<div class="invoice-details-content-col">
					<div class="invoice-details-accordion-divider">
						<div class="invoice-details-accordion-head">
							<a class="invoice-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#invoice-details-products" aria-expanded="true" aria-controls="invoice-details-products">{{#if linesLengthGreaterThan1}}
									{{translate 'Products ($(0))' lines.length}}
							{{else}}
								{{translate 'Product ($(0))' lines.length}}
							{{/if}}
							<i class="invoice-details-accordion-toggle-icon"></i>
							</a>
						</div>
						<div class="invoice-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="invoice-details-products" role="tabpanel" data-target="#invoice-details-products">
							<div data-content="items-body">
									<table class="invoice-details-products-table lg2sm-first">
										<thead class="invoice-details-table-products-header">
											<th class="invoice-details-table-products-header-image"></th>
											<th class="invoice-details-table-products-header-product">{{translate 'Product'}}</th>
											<th class="invoice-details-table-products-header-qty">{{translate 'Qty'}}</th>
											<th class="invoice-details-table-products-header-unit-price">{{translate 'Unit price'}}</th>
											<th class="invoice-details-table-products-header-amount">{{translate 'Amount'}}</th>
										</thead>
										<tbody data-view="Items.Collection"></tbody>
									</table>
							</div>
						</div>
					</div>


					<!-- SALES REP -->
					{{#if showSaleRep}}
					<div class="invoice-details-accordion-divider">
						<div class="invoice-details-accordion-head">
							<a class="invoice-details-accordion-head-toggle-secondary collapsed" data-toggle="collapse" data-target="#invoice-salesrep" aria-expanded="true" aria-controls="invoice-salesrep">
								{{translate 'Sales Rep'}}
								<i class="invoice-details-accordion-toggle-icon-secondary"></i>
							</a>
						</div>
						<div class="invoice-details-accordion-body collapse" id="invoice-salesrep" role="tabpanel" data-target="#invoice-salesrep">
							<div class="invoice-details-accordion-container">
								<div class="invoice-details-row">
									<div class="invoice-details-info-card-grid">
										<div class="invoice-details-info-card">
											<p class="invoice-details-info-card-name-title">{{model.salesrep.name}}</p>
											<p>{{siteName}}</p>
										</div>
									</div>
									<div class="invoice-details-info-card-grid">
										<div class="invoice-details-info-card">
										{{#if showSaleRepPhone}}
										<p class="invoice-details-info-card-tel-title">{{translate 'Tel:'}}</p>
										<p>{{model.salesrep.phone}}</p>
										{{/if}}

										{{#if showSaleRepEmail}}
											<p class="invoice-details-info-card-email-title">{{translate 'Email:'}}</p>
											<p>{{model.salesrep.email}}</p>
										{{/if}}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					{{/if}}

					<!-- BILLING -->
					<div class="invoice-details-accordion-divider">
						<div class="invoice-details-accordion-head">
							<a class="invoice-details-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#invoice-billing" aria-expanded="true" aria-controls="invoice-billing">
								{{translate 'Billing'}}
								<i class="invoice-details-accordion-toggle-icon"></i>
							</a>
						</div>
						<div class="invoice-details-accordion-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="invoice-billing" role="tabpanel" data-target="#invoice-billing">
							<div class="invoice-details-accordion-container">
								<div class="invoice-details-row">
									<div class="invoice-details-info-card-grid">
										{{#if showBillingAddress}}
											<div data-view="Billing.Address"></div>
										{{/if}}
									</div>
									<div class="invoice-details-info-card-grid">
										<div class="invoice-details-info-card">
											<div class="invoice-details-info-card-terms-container">
												<p class="invoice-details-info-card-terms-title">{{translate 'Terms:'}}</p>
												{{#if showTerms}}
													<span> {{termsName}}</span>
													{{else}}
													<span>{{translate 'N/A'}}</span>
												{{/if}}
											</div>

											{{#if showMemo}}
												<div class="invoice-details-info-card-memo-container">
													<p class="invoice-details-info-card-memo-title">{{translate 'Memo:'}}</p>
													<span>{{model.memo}}</span>
												</div>
											{{/if}}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			{{/unless}}


			<div class="{{#if showInModal}}invoice-details-summary-col-modal{{else}}invoice-details-summary-col{{/if}}" name="summary-container">
				<div class="invoice-details-row-fluid">
					<div class="invoice-details-summary-container">
						<h3 class="invoice-details-summary-title">
							{{translate 'SUMMARY'}}
						</h3>
						<p class="invoice-details-summary-grid-float">
							<span class="invoice-details-summary-items-number">
								{{model.summary.subtotal_formatted}}
							</span>
							{{translate 'Subtotal'}}
							<span class="invoice-details-summary-subtotal-items">
								{{#if linesitemsNumberGreaterThan1}}
									{{itemsQuantityNumber}} {{translate 'Items'}}
								{{else}}
									{{itemsQuantityNumber}} {{translate 'Item'}}
								{{/if}}
							</span>
						</p>

						{{#if showDiscountSummary}}
							<p class="invoice-details-summary-grid-float">
								<span class="invoice-details-summary-discount">
									{{model.summary.discounttotal_formatted}}
								</span>
									{{translate 'Discount'}}
							</p>
						{{/if}}

						<p class="invoice-details-summary-grid-float">
							<span class="invoice-details-summary-tax-total">
								{{model.summary.taxtotal_formatted}}
							</span>
								{{translate 'Tax Total'}}
						</p>

						<p class="invoice-details-summary-grid-float">
							<span class="invoice-details-summary-shipping-cost">
								{{model.summary.shippingcost_formatted}}
							</span>
								{{translate 'Shipping'}}
						</p>
						<p class="invoice-details-summary-grid-float">
							<span class="invoice-details-summary-handling-value">
								{{model.summary.handlingcost_formatted}}
							</span>
							{{translate 'Handling'}}
						</p>

						{{#if showGiftcerticate}}
							<p class="invoice-details-summary-grid-float">
								<span class="invoice-details-summary-gift-certificate">
									{{model.summary.giftcertapplied_formatted}}
								</span>
									{{translate 'Gift Certificate'}}
							</p>
						{{/if}}

						{{#if showAdjustments}}
							<div class="invoice-details-summary-total-container">
								<p class="invoice-details-summary-grid-float">
									<span class="invoice-details-summary-subtotal">
										{{model.summary.total_formatted}}
									</span>
										{{translate 'Total'}}
								</p>
							</div>
							<div class="invoice-details-adjustments-title">
								<h5>
									{{translate 'ADJUSTMENTS'}}
								</h5>
							</div>
							{{#if showPayments}}
								<!-- PAYMENTS -->
								{{#each payments}}
									<p class="invoice-details-summary-grid-float">
										<span class="invoice-details-summary-payment">
											({{amount_formatted}})
										</span>
										<a href="/transactionhistory/customerpayment/{{internalid}}" data-action="update-layout">
											{{translate 'Payment #$(0)' tranid}}
										</a>
									</p>
								{{/each}}
							{{/if}}

							{{#if showCreditMemos}}
								<!-- CREDIT MEMOS -->
								{{#each creditMemos}}
									<p class="invoice-details-summary-grid-float">
										<span class="invoice-details-summary-credit-memo">
											({{amount_formatted}})
										</span>
										<a href="/transactionhistory/creditmemo/{{internalid}}" data-action="update-layout">
											{{translate 'Credit Memo #$(0)' tranid}}
										</a>
									</p>
								{{/each}}
							{{/if}}

							<!-- DEPOSIT APPLICATIONS -->
							{{#if showDepositApplications}}
								{{#each depositApplications}}
									<p class="invoice-details-summary-grid-float">
										<span class="invoice-details-summary-deposit">
											({{amount_formatted}})
										</span>
										<a href="/transactionhistory/depositapplication/{{internalid}}" data-action="update-layout">
											{{translate 'Deposit Applications #$(0)' tranid}}
										</a>
									</p>
								{{/each}}
							{{/if}}

						{{/if}}

						<p class="invoice-details-summary-grid-float">
							<span class="invoice-details-summary-amount-due">
								{{model.amountDue_formatted}}
							</span>
								{{translate 'Amount Due'}}
						</p>
					</div>
				</div>

				<div class="invoice-details-buttons-container">
					{{#if showMakeAPaymentButton}}
						<div class="invoice-details-button-make-a-payment-container">
							<a data-permissions="{{makeAPaymentPermissions}}" href="/make-a-payment" data-type="make-a-payment" class="invoice-details-button-make-a-payment">
								{{translate 'Make a Payment'}}
							</a>
						</div>
					{{/if}}

					{{#if showInModal}}
					<a href="invoices/{{model.internalid}}" class="invoice-details-link-goto" data-action="update-layout">{{translate 'Go to detailed page'}}</a>
						<a href="#" class="invoice-details-button-close" data-dismiss="modal">{{translate 'Close'}}</a>
					{{else}}
						<a target="_blank" class="invoice-details-button-download-as-pdf" href="{{donwloadPdfUrl}}">
							{{translate 'Download as PDF'}}
						</a>
					{{/if}}

				</div>
			</div>
		</div>
	</div>
</section>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.internalid (String)
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
	model.shipmethods.0.internalid (String)
	model.shipmethods.0.name (String)
	model.shipmethods.0.rate (Number)
	model.shipmethods.0.rate_formatted (String)
	model.shipmethods.0.shipcarrier (String)
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
	model.paymentmethods.0 (Object)
	model.paymentmethods.0.type (String)
	model.paymentmethods.0.primary (Boolean)
	model.paymentmethods.0.name (undefined)
	model.paymentmethods.0.paymentterms (Object)
	model.paymentmethods.0.paymentterms.internalid (String)
	model.paymentmethods.0.paymentterms.name (String)
	model.adjustments (Array)
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
	model.shipmethod (String)
	model.dueDate (String)
	model.amountDue (Number)
	model.amountDue_formatted (String)
	model.options (Object)
	makeAPaymentPermissions (String)
	showInModal (Boolean)
	donwloadPdfUrl (String)
	pageTitle (String)
	isOpen (Boolean)
	showCreatedFrom (Boolean)
	showDueDate (Boolean)
	showSaleRep (Boolean)
	showSaleRepPhone (Boolean)
	showSaleRepEmail (Boolean)
	siteName (String)
	showMemo (Boolean)
	showTerms (Boolean)
	termsName (String)
	showGiftcerticate (Boolean)
	showAdjustments (Number)
	showMakeAPaymentButton (Boolean)
	showBillingAddress (Boolean)
	payments (Array)
	showPayments (Boolean)
	creditMemos (Array)
	showCreditMemos (Boolean)
	depositApplications (Array)
	showDepositApplications (Boolean)
	showLines (Boolean)
	linesLengthGreaterThan1 (Boolean)
	itemsQuantityNumber (Number)
	linesitemsNumberGreaterThan1 (Boolean)
	lines (Array)
	showOpenedAccordion (Boolean)

----}}
