{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="requestquote-wizard-permission-error">
	<div class="requestquote-wizard-permission-error-header">
		<h1 class="requestquote-wizard-permission-error-header-title">
			{{pageHeader}}
		</h1>
	</div>
	<div class="requestquote-wizard-permission-error-message">
		 <p class="requestquote-wizard-permission-error-message-disclaimer">{{translate 'Sorry, you don\'t have sufficient permissions to request a quote online. <br/> For immediate assistance <strong>call us at $(0)</strong> or email us to <strong>$(1)</strong>' salesrepPhone salesrepEmail}}</p>
		<a href="/" data-touchpoint="home" class="requestquote-wizard-permission-error-button">{{translate 'Go to Home Page'}}</a>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	pageHeader (String)
	salesrepPhone (String)
	salesrepEmail (String)

----}}
