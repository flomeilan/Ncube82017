{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="wizard-step-navigation">

	{{#if showBackButton}}
	<a data-action="previous-step" class="wizard-step-navigation-back">
		<i class="wizard-step-navigation-back-icon"></i>
		{{translate 'Previous'}}
	</a>
	{{/if}}

	<ol class="wizard-step-navigation-menu">
	{{#each stepGroups}}
		{{#unless @first}}
			<li class="wizard-step-navigation-divider wizard-step-navigation-divider-{{@index}}">/</li>
		{{/unless}}

		<li class="wizard-step-navigation-step wizard-step-navigation-step-{{@index}}">
			<a class="wizard-step-navigation-step-anchor {{listItemClass}}" href="{{linkUrl}}">

				{{counter}}<span class="wizard-step-navigation-step-anchor-label">{{name}}</span>
			</a>
		</li>
	{{/each}}
	</ol>

</div>



{{!----
Use the following context variables when customizing this template: 
	
	stepGroups (Array)
	errors (Array)
	showBackButton (Boolean)

----}}
