{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="creditcard-list-button-back">
		<i class="creditcard-list-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="creditcard-list">
	<h2>{{pageHeader}}</h2>
	<div class="creditcard-list-button-container">
        <a class="creditcard-list-button" href="/creditcards/new" data-toggle="show-in-modal">{{translate 'Add Credit Card'}}</a>
    </div>

	<div class="creditcard-list-collection" data-view="CreditCards.Collection"></div>
</section>



{{!----
Use the following context variables when customizing this template: 
	
	pageHeader (String)
	showBackToAccount (Boolean)

----}}
