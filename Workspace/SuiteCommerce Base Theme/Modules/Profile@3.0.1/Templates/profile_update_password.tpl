{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if showBackToAccount}}
	<a href="/" class="profile-update-password-button-back">
		<i class="profile-update-password-button-back-icon"></i>
		{{translate 'Back to Account'}}
	</a>
{{/if}}

<section class="profile-update-password">
	<h2 class="profile-update-password-form-title">{{pageHeader}}</h2>
	<div data-type="alert-placeholder"></div>
	<div class="profile-update-password-form-area">
		<form class="profile-update-password-form">
			<fieldset>
				<small class="profile-update-password-form-label">{{translate 'Required'}} <span class="profile-update-password-form-group-label-required">*</span></small>

				<div class="profile-update-password-form-group" data-input="current_password" data-validation="control-group">
					<label class="profile-update-password-form-group-label" for="current_password">{{translate 'Current Password'}} <span class="profile-update-password-form-group-label-required">*</span></label>
					<div  class="profile-update-password-group-form-controls" data-validation="control">
						<input type="password" class="profile-update-password-form-group-input" id="current_password" name="current_password" value="">
					</div>
				</div>

				<div class="profile-update-password-form-group" data-input="password" data-validation="control-group">
					<label class="profile-update-password-form-group-label" for="password">{{translate 'New Password'}} <span class="profile-update-password-form-group-label-required">*</span></label>
					<div  class="profile-update-password-group-form-controls" data-validation="control">
						<input type="password" class="profile-update-password-form-group-input" id="password" name="password" value="">
					</div>
				</div>

				<div class="profile-update-password-form-group" data-input="confirm_password" data-validation="control-group">
					<label class="profile-update-password-form-group-label" for="confirm_password">{{translate 'Confirm Password'}} <span class="profile-update-password-form-group-label-required">*</span></label>
					<div  class="profile-update-password-group-form-controls" data-validation="control">
						<input type="password" class="profile-update-password-form-group-input" id="confirm_password" name="confirm_password" value="">
					</div>
				</div>
			</fieldset>
			<div class="profile-update-password-form-actions">
				<button type="submit" class="profile-update-password-form-actions-update">{{translate 'Update'}}</button>
				<button type="reset" class="profile-update-password-form-actions-reset hide" data-action="reset">{{translate 'Reset'}}</button>
			</div>
		</form>
	</div>
</section>



{{!----
Use the following context variables when customizing this template:

	pageHeader (String)
	showBackToAccount (Boolean)

----}}
