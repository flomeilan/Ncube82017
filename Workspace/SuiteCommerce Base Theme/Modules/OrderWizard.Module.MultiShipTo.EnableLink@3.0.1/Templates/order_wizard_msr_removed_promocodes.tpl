{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-msr-removed-promocodes">
{{translate 'Sorry, we don\'t currently support the following promotions and will be removed when shipping to multiple addresses:'}}
<br />
<span class="order-wizard-msr-removed-promocodes-list">
{{#each invalidPromocodes}}
	{{code}}&nbsp;
{{/each}}
</span>
<br /><br />
<span class="order-wizard-msr-removed-promocodes-question">{{translate 'How would you like to proceed?'}}</span>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
