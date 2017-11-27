{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<label class="global-views-countriesDropdown-group-label" for="{{manage}}country">
    {{translate 'Country'}} <span class="global-views-countriesDropdown-input-required">*</span>
</label>
<div  class="global-views-countriesDropdown-form-controls" data-validation="control">
    <select class="{{#if showCSSclass}} {{cssclass}} {{else}} global-views-countriesDropdown-select {{/if}}" id="{{id}}country" name="country" data-action="selectcountry">
        <option value="">
            {{translate '-- Select --'}}
        </option>
        {{#each countries}}
            <option value="{{code}}">
                {{name}}
            </option>
        {{/each}}
    </select>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	cssclass (String)
	showCSSclass (Boolean)
	id (String)
	countries (Array)

----}}
