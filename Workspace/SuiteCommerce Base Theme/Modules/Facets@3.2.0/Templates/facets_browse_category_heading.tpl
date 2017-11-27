{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="facets-browse-category-heading-list-header">
	<div class="facets-browse-category-heading-main-description">
		<h1>{{pageheading}}</h1>
		{{#if showDescription}}	
			<p>{{{description}}}</p>
		{{/if}}
	</div>
	{{#if hasBanner}}
		<div class="facets-browse-category-heading-main-image">
			<img src="{{resizeImage banner 'categorybanner'}}" alt="{{pageheading}}" />
		</div>
	{{/if}}
</section>




{{!----
Use the following context variables when customizing this template: 
	
	name (String)
	banner (String)
	description (String)
	pageheading (String)
	hasBanner (Boolean)
	showDescription (Boolean)

----}}
