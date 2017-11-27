{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="return-authorization-confirmation">
	<h2 class="return-authorization-confirmation-title">{{pageTitle}}</h2>

	<div class="return-authorization-confirmation-module">
		<h2 class="return-authorization-confirmation-module-title">{{translate 'Thank you!'}}</h2>
		<p class="return-authorization-confirmation-module-body">
		<a href="returns/returnauthorization/{{internalId}}" class="return-authorization-confirmation-module-body-return-id">{{translate 'Return request #$(0)' model.tranid}}</a></p>
		<p class="return-authorization-confirmation-module-body">
			{{translate 'Your request was successfully submitted and a representative will contact you briefly.'}}
			{{translate 'An email was sent to you with a copy of this request.'}}
		</p>
		<a href="/returns" class="return-authorization-confirmation-module-continue">{{translate 'Go to list of requests'}}</a>
	</div>

	<h3>
		<span>{{translate 'From:'}}</span>{{translate 'Purchase #$(0)'  model.createdfrom.tranid}}
		<span class="return-authorization-confirmation-amount">{{totalFormatted}}</span>
	</h3>
	
	<div class="return-authorization-confirmation-row" name="return-content-layout">
		<div class="return-authorization-confirmation-content-col">

			<div class="return-authorization-confirmation-accordion-divider">
				<div class="return-authorization-confirmation-accordion-head">	
					<a href="#" class="return-authorization-confirmation-head-toggle collapsed" data-toggle="collapse" data-target="#return-products" aria-expanded="true" aria-controls="return-products">
						{{translate 'Items ($(0))' linesLength}}
						<i class="return-authorization-confirmation-head-toggle-icon"></i>
					</a>
				</div>

				<div class="return-authorization-confirmation-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="return-products" role="tabpanel" data-target="#return-products">
					<table class="return-authorization-confirmation-products-table">
						<thead class="return-authorization-confirmation-headers">
							<tr>
								<th class="return-authorization-confirmation-headers-image"></th>
								<th class="return-authorization-confirmation-headers-product">{{translate 'Item'}}</th>
								<th class="return-authorization-confirmation-headers-amount">{{translate 'Amount'}}</th>
								<th class="return-authorization-confirmation-headers-quantity">{{translate 'Qty to return'}}</th>
								<th class="return-authorization-confirmation-headers-reason">{{translate 'Reason for Return'}}</th>
							</tr>
				      	</thead>
		      			<tbody data-view="Items.Collection"></tbody>
					</table>
				</div>
			</div>
			
			{{#if showComments}}
				<div class="return-authorization-confirmation-comments-row">
					<div class="return-authorization-confirmation-comments">
						<p>{{translate 'Comments:'}}</p>
						<blockquote>{{model.memo}}</blockquote>
					</div>
				</div>
			{{/if}}

		</div>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
