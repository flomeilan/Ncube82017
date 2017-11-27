{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<i class="header-mini-cart-summary-icon-cart"></i>
<span class="header-mini-cart-summary-item-count{{#if isLoading}} loading{{/if}}">
	{{#if isLoading}}
		<span class="header-mini-cart-summary-cart-ellipsis"></span>
	{{else}}
		{{#if showPluraLabel}}
			{{translate '<b>$(0)</b> items' itemsInCart}}
		{{else}}
			{{translate '<b>1</b> item'}}
		{{/if}}
	{{/if}}
</span>



{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
