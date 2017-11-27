{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBanner}}
	<div class="cookie-warning-banner-view alert" role="alert">
		<div>
			{{{cookieMessage}}}
			{{#if showLink}}
			 <a href="https://system.netsuite.com{{linkHref}}" data-toggle="show-in-modal" data-page-header="{{linkContent}}">{{linkContent}}</a>
			{{/if}}
		</div>
		{{#if closable}}
			<button class="cookie-warning-banner-view-close-button" data-action="close-message" type="button" data-dismiss="alert">&times;</button>
		{{/if}}
	</div>
{{/if}}




{{!----
Use the following context variables when customizing this template: 
	
	showBanner (Boolean)
	cookieMessage (String)
	showLink (Boolean)
	linkHref (String)
	linkContent (String)
	closable (Boolean)

----}}
