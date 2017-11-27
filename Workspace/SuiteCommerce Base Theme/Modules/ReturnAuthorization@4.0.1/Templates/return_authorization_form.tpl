{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="return-authorization-form-button-back">
		<i class="return-authorization-form-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="return-authorization-form">
	<header>
		<h2 class="return-authorization-form-title">{{pageHeader}}</h2>
	</header>

	<div data-type="alert-placeholder"></div>

	<form class="return-authorization-form-form">
		<fieldset class="return-authorization-form-items-fieldset">

			<p class="return-authorization-form-items-info">
				{{translate '<label class="return-authorization-form-items-fieldset-from-label">From: </label><a href="$(0)">Purchase #$(1)</a>' createdFromURL model.tranid}}
			</p>
			<input type="hidden" name="type" value="{{model.recordtype}}">


			<h5 class="return-authorization-form-products-title">{{translate 'Select products to return'}}</h5>
			<input type="hidden" name="id" value="{{model.internalid}}">
			<div data-view="ListHeader"></div>

			<div class="return-authorization-form-list">
				<table class="return-authorization-form-returnable-products-table md2sm">
						<tbody data-view="Returnable.Lines.Collection"></tbody>
				</table>
			</div>
			<p>
				<small class="return-authorization-form-counter-legend">
					{{#if activeLinesLengthGreaterThan1}}
						{{translate '<b>$(0)</b> products selected' activeLinesLength}}
					{{else}}
						{{translate '<b>$(0)</b> product selected' activeLinesLength}}
					{{/if}}
				</small>
			</p>
			<p>
				<small class="return-authorization-form-counter-legend">
					{{#if itemsToReturnLengthGreaterThan1}}
						{{translate '<b>$(0)</b> items in total to return' itemsToReturnLength}}
					{{else}}
						{{translate '<b>$(0)</b> item in total to return' itemsToReturnLength}}
					{{/if}}
				</small>
			</p>
		</fieldset>

		{{#if showInvalidLines}}
			<div class="return-authorization-form-accordion-divider">
				<div class="return-authorization-form-accordion-head">
					<a class="return-authorization-form-accordion-head-toggle collapsed" data-toggle="collapse" data-target="#return-authorization-form-products" aria-expanded="true" aria-controls="return-authorization-form-products">
						{{translate 'Products from original order not eligible for return ($(0))' invalidLinesLength}}
					<i class="return-authorization-form-accordion-toggle-icon"></i>
					</a>
				</div>
				<div class="return-authorization-form-accordion-body collapse" id="return-authorization-form-products" role="tabpanel" data-target="#return-authorization-form-products">
					<div data-content="items-body">
							<table class="return-authorization-form-products-list">
								<thead class="return-authorization-form-table-products-header">
									<th class="return-authorization-form-table-products-header-image"></th>
									<th class="return-authorization-form-table-products-header-product">{{translate 'Product'}}</th>
									<th class="return-authorization-form-table-products-header-qty">{{translate 'Qty'}}</th>
									<th class="return-authorization-form-table-products-header-unit-price">{{translate 'Unit price'}}</th>
									<th class="return-authorization-form-table-products-header-amount">{{translate 'Amount'}}</th>
								</thead>
								<tbody data-view="Invalid.Lines.Collection"></tbody>
							</table>
					</div>
				</div>
			</div>
		{{/if}}

		<fieldset class="return-authorization-form-comment-fieldset">
			<label class="return-authorization-form-comment-label" for="comment">{{translate 'Add a comment <span class="return-authorization-form-comment-label-optional">(optional)</span>'}}</label>
			<textarea data-action="comments"  class="return-authorization-form-comment" rows="4">{{comments}}</textarea>
		</fieldset>
		<div class="form-actions">
			<button type="submit" class="return-authorization-form-submit-button" {{#unless hasAtLeastOneActiveLine}}disabled{{/unless}}>{{translate 'Submit Request'}}</button>
		</div>
	</form>
</section>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
