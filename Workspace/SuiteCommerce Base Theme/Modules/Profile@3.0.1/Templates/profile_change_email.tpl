{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="profile-change-email">
	<div data-type="alert-placeholder"></div>
	<div class="profile-change-email-form-area">
		<form class="profile-change-email-form">
			<fieldset>
				<small class="profile-change-email-form-label">{{translate 'Required'}} <span class="profile-change-email-form-group-label-required">*</span></small>

				<div class="profile-change-email-form-group" data-input="new_email" data-validation="control-group">
					<label class="profile-change-email-form-group-label" for="new_email">{{translate 'New Email'}} <span class="profile-change-email-form-group-label-required">*</span></label>
					<div  class="profile-change-email-group-form-controls" data-validation="control">
						<input type="email" class="profile-change-email-form-group-input" id="new_email" name="new_email" value="" placeholder="{{translate 'your@email.com'}}">
					</div>
				</div>

				<div class="profile-change-email-form-group" data-input="confirm_email" data-validation="control-group">
					<label class="profile-change-email-form-group-label" for="confirm_email">{{translate 'Confirm New Email'}} <span class="profile-change-email-form-group-label-required">*</span></label>
					<div  class="profile-change-email-group-form-controls" data-validation="control">
						<input type="email" class="profile-change-email-form-group-input" id="confirm_email" name="confirm_email" value="" placeholder="{{translate 'your@email.com'}}">
					</div>
				</div>

				<div class="profile-change-email-form-group" data-input="current_email" data-validation="control-group">
					<label class="profile-change-email-form-group-label" for="current_password">{{translate 'Password'}} <span class="profile-change-email-form-group-label-required">*</span></label>
					<div  class="profile-change-email-group-form-controls" data-validation="control">
						<input type="password" class="profile-change-email-form-group-input" id="current_password" name="current_password" value="">
					</div>
				</div>
			</fieldset>
			<p class="profile-change-email-form-info-block"><small> {{translate 'You will still be able to login with your current email address and password until your new email address is verified.'}} </small></p>
			<div class="profile-change-email-form-actions">
				<button type="submit" class="profile-change-email-form-actions-change">{{translate 'Send Verification Email'}}</button>
			</div>
		</form>
	</div>
</section>