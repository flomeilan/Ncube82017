{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="payment-wizard-showinvoices-module">
	<div class="payment-wizard-showinvoices-module-expander-head">
		<a class="payment-wizard-showinvoices-module-expander-head-toggle" data-toggle="collapse" data-target="#payment-wizard-showinvoices-module-body" aria-expanded="false" aria-controls="payment-wizard-showinvoices-module-body">
			{{translate 'Invoices (<span class="payment-wizard-showinvoices-module-invoices-count">$(0)</span>)' invoicesLength}}
			<i class="payment-wizard-showinvoices-module-expander-head-toggle-icon"></i>
		</a>
	</div>

	<div class="payment-wizard-showinvoices-module-expander-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="payment-wizard-showinvoices-module-body">
		<div class="payment-wizard-showinvoices-module-expander-body-wrapper">

			<table class="payment-wizard-showinvoices-module-records">
				<thead class="payment-wizard-showinvoices-module-records-head">
					<tr>
						<th class="payment-wizard-showinvoices-module-header-number">
							<span class="payment-wizard-showinvoices-module-header-number-value">{{translate 'Number'}}</span>
						</th>
						<th class="payment-wizard-showinvoices-module-header-amount">
							{{translate 'Amount'}}
						</th>
					</tr>
				</thead>
				<tbody>
					{{#each invoices}}
						<tr data-id="{{id}}" class="payment-wizard-showinvoices-module-invoice">
							<td>
								<span class="payment-wizard-showinvoices-module-value-title">
									{{title}}
								</span>
								<span class="payment-wizard-showinvoices-module-amount">
									<span class="payment-wizard-showinvoices-module-mobile-header-amount">
										{{translate 'Amount:'}}
									</span>
									<span class="payment-wizard-showinvoices-module-value-amount">
										{{amountFormatted}}
									</span>
								</span>
							</td>
						</tr>
					{{/each}}
					<tr class="payment-wizard-showinvoices-module-subtotal">
						<td>
							<span class="payment-wizard-showinvoices-module-subtotal-label">{{translate 'Invoices Subtotal: '}}</span>
							<span class="payment-wizard-showinvoices-module-value-subtotal">{{ invoicesTotalFormatted}}</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	invoicesLength (Number)
	invoicesTotalFormatted (String)
	invoices (Array)
	showOpenedAccordion (Boolean)

----}}
