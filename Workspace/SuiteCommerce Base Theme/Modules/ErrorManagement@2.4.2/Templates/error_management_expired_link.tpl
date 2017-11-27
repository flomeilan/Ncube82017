{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="error-management-expired-link-header">
	{{#if pageHeader}}
		<h1 class="error-management-expired-link-header-title">{{pageHeader}}</h1>
	{{/if}}

	<div id="main-banner" class="error-management-expired-link-main-banner"></div>
</div>
<div id="internal-error-content" class="error-management-expired-link-content">
	{{{message}}}
</div>
<hr>
<div>
	<a class="error-management-expired-link-login-button" href="#" data-touchpoint="login">{{translate 'Login'}}</a>
	<a class="error-management-expired-link-register-button" href="#" data-touchpoint="register">{{translate 'Register'}}</a>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
