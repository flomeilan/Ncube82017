{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<form action="#" class="product-list-new">
	{{#if inModal}}
	<div class="product-list-new-modal-body">
	{{/if}}

		<small class="product-list-new-required">
			{{translate 'Required <span class="product-list-new-form-required">*</span>'}}
		</small>

		<div data-type="alert-placeholder"></div>

		<div data-validation="control-group">
			<label for="product-list-new-name" class="product-list-new-form-label">
				{{#if isEdit}}
					{{translate 'Your list name <small class="product-list-new-form-required">*</small>'}}
				{{else}}
					{{translate 'Name your new list <small class="product-list-new-form-required">*</small>'}}
				{{/if}}
			</label>
			<div class="product-list-new-form-controls"  data-validation="control">
				<input id="product-list-new-name" type="text" name="name" data-action="prevent-enter" class="product-list-new-form-input" placeholder="{{#if isEdit}}{{translate 'List name'}}{{else}}{{translate 'New list name'}}{{/if}}" value="{{#if isEdit}}{{name}}{{/if}}">
			</div>
		</div>

		<div class="product-list-new-form-controls-group" data-validation="control-group">
			<label for="product-list-new-description" class="product-list-new-form-label">
				{{translate 'Notes for the list'}}
				<span class="product-list-new-form-label-optional">{{translate '(optional)'}}</span>
			</label>
			<div class="product-list-new-form-controls"  data-validation="control">
				<textarea id="product-list-new-description" class="product-list-new-form-textarea" name="description" placeholder="{{translate 'Add a note or description for your list'}}">{{#if isEdit}}{{description}}{{/if}}</textarea>
			</div>
		</div>

	{{#if inModal}}
	</div>
	{{/if}}

	<div class="{{#if inModal}}product-list-new-modal-footer{{/if}} product-list-new-form-controls-group">

		<button type="submit" class="product-list-new-form-submit">
			{{#if isEdit}}{{translate 'Save'}}{{else}}{{translate 'Create List'}}{{/if}}
		</button>
		{{#if inModal}}
			<button class="product-list-new-form-cancel" data-dismiss="modal">{{translate 'Cancel'}}</button>
		{{/if}}
	</div>
</form>



{{!----
Use the following context variables when customizing this template: 
	
	inModal (Boolean)
	isEdit (Boolean)
	name (String)
	description (String)

----}}
