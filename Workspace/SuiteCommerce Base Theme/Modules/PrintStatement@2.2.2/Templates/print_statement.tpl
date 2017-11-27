{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="print-statement-button-back">
	<i class="print-statement-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="print-statement">

	<h2 class="print-statement-title">{{pageHeader}}</h2>
	<div class="print-statement-alert-placeholder" data-type="alert-placeholder"></div>

	<form class="print-statement-form">

		<small class="print-statement-form-label">
			{{translate 'Required'}}
			<span class="print-statement-form-label-required">*</span>
		</small>

		<div class="print-statement-form-group" data-validation="control-group">
			<label class="print-statement-form-group-label" for="statementDate">
				{{translate 'Statement date'}}
				<span class="print-statement-form-label-required">*</span>
			</label>
			<div  class="print-statement-form-controls" data-validation="control">
				<input type="date" data-format="yyyy-mm-dd" id="statementDate" name="statementDate" class="print-statement-form-group-input" autocomplete="off" data-todayhighlight="true"/>
				<i class="print-statement-form-input-icon"></i>
			</div>
		</div>

		<div class="print-statement-form-group" data-validation="control-group">
			<label class="print-statement-form-group-label" for="startDate">
				{{translate 'Start date'}}
				<span class="print-statement-form-group-label-optional">{{translate '(optional)'}}</span>
			</label>
			<div  class="print-statement-form-controls" data-validation="control">
				<input type="date" data-format="yyyy-mm-dd" id="startDate" name="startDate" class="print-statement-form-group-input" autocomplete="off" data-todayhighlight="true"/>
				<i class="print-statement-form-input-icon"></i>
			</div>
		</div>

		<div class="print-statement-form-group">
			<div class="print-statement-form-controls">
				<label class="print-statement-form-checkbox-label">
					<input type="checkbox" name="inCustomerLocale"/>
					{{translate 'Print in customer\'s locale'}}
				</label>
				<label class="print-statement-form-checkbox-label">
					<input type="checkbox" name="openOnly"/>
					{{translate 'Show only Open Transactions'}}
				</label>
				<label class="print-statement-form-checkbox-label">
					<input type="checkbox" name="consolidatedStatement"/>
					{{translate 'Consolidated Statement'}}
				</label>
			</div>
		</div>

		<div class="print-statement-form-actions">
			<button type="submit" class="print-statement-form-actions-print">{{translate 'Download as PDF'}}</button>
			<button type="button" class="print-statement-form-actions-email" data-action="email">{{translate 'Email'}}</button>
		</div>

	</form>

</section>



{{!----
Use the following context variables when customizing this template:

	pageHeader (String)
	showBackToAccount (Boolean)

----}}
