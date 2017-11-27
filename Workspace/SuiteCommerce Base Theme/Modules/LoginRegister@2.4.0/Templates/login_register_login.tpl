{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<h2 class="login-register-login-title">{{translate 'Returning customer'}}</h2>
<p class="login-register-login-description">
	{{#if isSkipLogin}}
		{{translate 'Login below or <a class="login-register-login-register-now" href="register" data-toggle="show-in-modal" data-type="register-now">create an account</a>'}}
	{{else}}
		{{translate 'Login below to checkout with an existing account'}}
	{{/if}}
</p>

<small class="login-register-login-required">{{translate 'Required <span class="login-register-login-form-required">*</span>'}}</small>

<form class="login-register-login-form" novalidate>
	<fieldset class="login-register-login-form-fieldset">
		<div class="login-register-login-form-controls-group" data-validation="control-group">
			<label class="login-register-login-form-label" for="login-email">
				{{translate 'Email Address <small class="login-register-login-form-required">*</small>'}}
			</label>
			<div class="login-register-login-form-controls" data-validation="control">
				<input {{#if hasAutoFocus}} autofocus {{/if}} type="email" name="email" id="login-email" class="login-register-login-form-input" placeholder="{{translate 'your@email.com'}}"/>
			</div>
		</div>

		<div class="login-register-login-form-controls-group" data-validation="control-group">
			<label class="login-register-login-form-label" for="login-password">
				{{translate 'Password <small class="login-register-login-form-required">*</small>'}}
			</label>
			<div class="login-register-login-form-controls" data-validation="control">
				<input type="password" name="password" id="login-password" class="login-register-login-form-input">
			</div>
		</div>

		{{#if isRedirect}}
			<div class="login-register-login-form-controls-group" data-validation="control-group">
				<div class="login-register-login-form-controls" data-validation="control">
					<input value="true" type="hidden" name="redirect">
				</div>
			</div>
		{{/if}}

		<div data-type="alert-placeholder" class="login-register-login-form-messages">
			{{#if isUserSessionTimedOut}}
				<div data-view="GlobalMessageSessionTimeout"></div>
			{{/if}}
		</div>

		<div class="login-register-login-form-controls-group" data-type="form-login-action">

			<button type="submit" class="login-register-login-submit" data-action="login-button">
				{{translate 'Log In'}}
			</button>

			<a class="login-register-login-forgot" data-action="forgot-password" href="/forgot-password">
				{{translate 'Forgot password?'}}
			</a>
		</div>
	</fieldset>
</form>




{{!----
Use the following context variables when customizing this template: 
	
	isRedirect (Boolean)
	hasAutoFocus (Boolean)
	isUserSessionTimedOut (Boolean)
	isSkipLogin (Boolean)

----}}
