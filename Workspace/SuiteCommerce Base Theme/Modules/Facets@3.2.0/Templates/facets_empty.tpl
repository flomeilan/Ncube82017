{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="facets-empty">
    <h1 class="facets-empty-title">{{translate 'Sorry, we couldn´t find any products.'}}</h1>
    <p>
        {{#if keywords}}
            {{translate 'We were unable to find results for <strong>$(0)</strong>. Please check your spelling or try searching for similar terms.' keywords}}
        {{/if}}
    </p>
    <div class="facets-empty-merchandising-zone">
        <div data-type="merchandising-zone" data-id="newArrivals"></div>
    </div>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	keywords (undefined)

----}}
