{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="login-register" >

	<header class="login-register-header">
		{{#if showRegister}}
		<h1 class="login-register-title"> {{translate 'Log in | Register'}}</h1>
		{{else}}
		<h1 class="login-register-title"> {{translate 'Log in'}}</h1>
		{{/if}}
	</header>

	<div data-view="Messages"></div>

	<div {{#if showRegister}} class="login-register-body" {{else}} class="login-register-body-colored" {{/if}}>

		{{#if showLogin}}
			<div class="login-register-wrapper-column-login">
				<div class="login-register-wrapper-login" data-view="Login"></div>
			</div>
		{{/if}}

		{{#if showRegisterOrGuest}}
			<div class="login-register-wrapper-column-register">
				<div class="login-register-wrapper-register">
					<h2 class="login-register-title-register">{{translate 'New customer'}}</h2>

					{{#if showCheckoutAsGuest}}
						<div class="login-register-wrapper-guest" data-view="CheckoutAsGuest"></div>
					{{/if}}

					{{#if showRegister}}
						<div class="{{#if showCheckoutAsGuest}}collapse{{/if}} " data-view="Register" id="register-view"></div>
					{{/if}}
				</div>
			</div>
		{{/if}}

	</div>
</section>



{{!----
Use the following context variables when customizing this template:

	showRegister (Boolean)
	showCheckoutAsGuest (Boolean)
	showLogin (Boolean)
	showRegisterOrGuest (Boolean)

----}}
