{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="quick-order">
	<div class="quick-order-divider">
		<div class="quick-order-expander-head">
			<a class="quick-order-expander-head-toggle {{#unless showOpenedAccordion}}collapsed{{/unless}}" data-toggle="collapse" data-target="#quick-order" aria-expanded="true" aria-controls="quick-order">
				{{translate 'Quick Add'}}
				<i class="quick-order-expander-toggle-icon"></i>
			</a>
		</div>
		<div class="quick-order-expander-body collapse {{#if showOpenedAccordion}}in{{/if}}" id="quick-order" data-target="#quick-order">
			<div class="quick-order-expander-container">
				<div data-view="QuickAddView"></div>
			</div>
		</div>
	</div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	showOpenedAccordion (Boolean)

----}}
