{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<span class="payment-wizard-invoice-subject">
{{#if isOverdue}}
	<span class="payment-wizard-invoice-subject-date-overdue">
		{{dueDate}}
	</span>
	<i class="payment-wizard-invoice-subject-icon-flag"></i>
{{else}}
	{{dueDate}}
{{/if}}

{{#if isDiscountApplied}}
	<br>
	<small class="payment-wizard-invoice-subject-text-success">
		{{translate 'Applied Discount: $(0) - until $(1)' discountFormatted discDate}}
	</small>
{{/if}}

{{#if isPaid}}
	<br>
	<small class="payment-wizard-invoice-subject-text-success">
		{{translate 'Processing Payments'}}
	</small>
{{/if}}
</span>



{{!----
Use the following context variables when customizing this template: 
	
	isOverdue (Boolean)
	dueDate (String)
	isDiscountApplied (Boolean)
	discountFormatted (String)
	discDate (String)
	isPaid (Boolean)

----}}
