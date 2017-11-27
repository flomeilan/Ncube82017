{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="order-wizard-paymentmethod-threedsecure-module">

    {{#if threeDSecureError}}

    <div class="alert alert-error">

        {{ threeDSecureError.errorMessage }}

    </div>

    {{else}}

        {{{iframe}}}

    {{/if}}

</div>