{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="error-management-page-not-found">
    <div class="error-management-page-not-found-header">
	{{#if pageHeader}}
		<h1>{{pageHeader}}</h1>
	{{/if}}

	   <div id="main-banner" class="error-management-page-not-found-main-banner"></div>
    </div>
    <div id="page-not-found-content" class="error-management-page-not-found-content">
    	{{translate 'Sorry, we could not load the content you requested.'}}
    </div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	title (String)
	pageHeader (String)

----}}
