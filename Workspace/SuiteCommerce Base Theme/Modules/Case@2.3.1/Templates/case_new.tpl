{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="case-new-button-back">
		<i class="case-new-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="case-new">
	<header class="case-new-header">
		<h2 class="case-new-title">{{pageHeader}}</h2>
	</header>

	<div class="case-new-alert-placeholder" data-type="alert-placeholder"></div>
	<small class="case-new-required">
		{{translate 'Required'}}<span class="case-new-form-required">*</span>
	</small>

	<form action="#" class="case-new-form" novalidate>
		<div class="case-new-form-controls-group" data-validation="control-group">
			<label class="case-new-form-label" for="title">
				{{translate 'Subject <small class="case-new-form-required">*</small>'}}
			</label>
			<div class="case-new-form-controls" data-validation="control">
				<input data-action="text" type="text" name="title" id="title" class="case-new-form-input" value="" maxlength="300"/>
			</div>
		</div>

		<div class="case-new-form-controls-group" data-validation="control-group">
			<label class="case-new-form-label" for="category">
				{{translate 'Type of inquiry'}}
			</label>

			<div class="case-new-form-controls" data-validation="control">
				<select name="category" id="category" class="case-new-form-case-category">
					{{#each categories}}
						<option value="{{id}}">
							{{text}}
						</option>
					{{/each}}
				</select>
			</div>
		</div>

		<div class="case-new-form-controls-group" data-validation="control-group">
			<label  class="case-new-form-label" for="message">
				{{translate 'Message <small class="case-new-form-required">*</small>'}}
			</label>
			<div class="case-new-form-controls" data-validation="control">
				<textarea name="message" id="message" class="case-new-form-textarea"></textarea>
			</div>
		</div>

		<div class="case-new-form-controls-group">
			<label class="case-new-form-label">
				<input data-action="include_email" type="checkbox" name="include_email" id="include_email" class="case-new-form-include-email"/>
				{{translate 'I want to use another email address for this case'}}
				
			</label>
		</div>

		<div class="collapse" data-collapse-content data-validation="control-group">
			<label for="email" class="case-new-form-label">
				{{translate 'Email <small class="case-new-form-required">*</small>'}}
			</label>
			<div class="case-new-form-controls" data-validation="control">
				<input type="email" autofocus name="email" id="email" placeholder="{{translate 'yourname@company.com'}}" data-case-email class="case-new-form-input" value="" disabled maxlength="300"/>
			</div>
		</div>

		<div class="case-new-form-controls-group">
			<button type="submit" class="case-new-button-submit">{{translate 'Submit'}}</button>
		</div>
	</form>
</section>



{{!----
Use the following context variables when customizing this template: 
	
	pageHeader (String)
	categories (Array)
	showBackToAccount (Boolean)

----}}
