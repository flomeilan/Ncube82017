{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="error-management-internal-error">
    <div class="error-management-internal-error-header">
			{{#if pageHeader}}
				<h1>{{pageHeader}}</h1>
			{{/if}}

    	<div id="main-banner" class="error-management-internal-error-main-banner"></div>
    </div>
    <div id="internal-error-content" class="error-management-internal-error-content">
    	{{{message}}}
    </div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	pageHeader (String)
	message (String)

----}}
