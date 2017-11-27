{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<input data-type="search-input" class="itemssearcher-input typeahead"
	placeholder="{{placeholderLabel}}"
	type="search" autocomplete="off"
	{{#if showId}} id="{{id}}" {{/if}} {{#if showName}} name="{{name}}" {{/if}}
	maxlength="{{maxLength}}"/>




{{!----
Use the following context variables when customizing this template: 
	
	placeholderLabel (String)
	maxLength (Number)
	showId (Boolean)
	showName (Boolean)
	id (String)
	name (String)

----}}
