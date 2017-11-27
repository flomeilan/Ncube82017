{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if hasBanner}}
	{{#if hasLink}}
		<a href="{{linkUrl}}" target="{{linkTarget}}"><img src="{{imageSource}}"></a>
	{{else}}
		<img src="{{imageSource}}">
	{{/if}}

	<hr>
{{/if}}



{{!----
Use the following context variables when customizing this template: 
	
	hasBanner (Boolean)
	hasLink (Boolean)

----}}
