{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="profile-information-button-back">
		<i class="profile-information-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<div class="profile-information">
<h2 class="profile-information-header">{{pageHeader}}</h2>

<div data-type="alert-placeholder"></div>
<section class="profile-information-row-fluid">

	<div class="profile-information-col">
		<form class="contact_info">
			<fieldset>
				{{#if isNotCompany}}

					<small class="profile-information-form-label">{{translate 'Required'}} <span class="profile-information-form-group-label-required">*</span></small>

					<div class="profile-information-row" data-input="firstname" data-validation="control-group">
						<label class="profile-information-label" for="firstname">{{translate 'First Name'}}
							<span class="profile-information-input-required">*</span>
						</label>
						<div class="profile-information-group-form-controls" data-validation="control">
							<input type="text" class="profile-information-input-large" id="firstname" name="firstname" value="{{firstName}}">
						</div>
					</div>

					<div class="profile-information-row" data-input="lastname" data-validation="control-group">
						<label class="profile-information-label" for="lastname">{{translate 'Last Name'}}
							<span class="profile-information-input-required">*</span>
						</label>
						<div class="profile-information-group-form-controls" data-validation="control">
							<input type="text" class="profile-information-input-large" id="lastname" name="lastname" value="{{lastName}}">
						</div>
					</div>
				{{/if}}

				{{#if isCompanyAndShowCompanyField}}
					<div class="profile-information-row" data-input="companyname" data-validation="control-group">
						<label class="profile-information-label" for="companyname">
							{{translate 'Company Name'}}
							{{#if isCompanyFieldRequired}}
								<small class="profile-information-input-required">*</small>
							{{else}}
								<small class="profile-information-input-optional">{{translate '(optional)'}}</small>
							{{/if}}
						</label>
						<div class="profile-information-group-form-controls" data-validation="control">
							<input type="text" class="profile-information-input-large" id="companyname" name="companyname" value="{{companyName}}">
						</div>
					</div>
				{{/if}}

				<div class="profile-information-row" data-input="phone" data-validation="control-group">
					<label class="profile-information-label" for="phone">
						{{#if phoneFormat}}
							{{translate 'Phone Number (ex/$(0))' phoneFormat}}
						{{else}}
							{{translate 'Phone Number'}}
						{{/if}}
						{{#if isPhoneFieldRequired}}
							<small class="profile-information-input-required">*</small>
						{{else}}
							<small class="profile-information-input-optional">{{translate '(optional)'}}</small>
						{{/if}}
					</label>
					<div class="profile-information-group-form-controls" data-validation="control">
						<input type="tel" class="profile-information-input-large" id="phone" name="phone" data-type="phone" value="{{phone}}">
					</div>
				</div>

				<div class="profile-information-row">
					<label class="profile-information-label">{{translate 'Email'}}</label>
						<p class="profile-information-input-email" id="email">{{email}} | <a class="profile-information-change-email-address" data-action="change-email">{{translate 'Change Address'}}</a></p>
				</div>

			</fieldset>
			<div class="profile-information-form-actions">
				<button type="submit" class="profile-information-button-update">{{translate 'Update'}}</button>
			</div>
		</form>
	</div>
</section>
</div>




{{!----
Use the following context variables when customizing this template:

	pageHeader (String)
	isNotCompany (Boolean)
	phoneFormat (undefined)
	isCompanyAndShowCompanyField (Boolean)
	isCompanyFieldRequired (Boolean)
	isPhoneFieldRequired (Boolean)
	firstName (String)
	lastName (String)
	companyName (String)
	email (String)
	phone (String)
	showBackToAccount (Boolean)

----}}
