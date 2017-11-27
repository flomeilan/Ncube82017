{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="header-sidebar-wrapper">
	<div data-view="Header.Profile"></div>

	<div class="header-sidebar-menu-wrapper" data-type="header-sidebar-menu">

		<ul class="header-sidebar-menu">
			{{#each categories}}
				{{#if text}}
					<li class="{{#if @last}}header-sidebar-menu-lastoption{{/if}}">
						<a {{objectToAtrributes this}} {{#if categories}}data-action="push-menu"{{/if}} name="{{text}}">
							{{text}}
							{{#if categories}}<i class="header-sidebar-menu-push-icon"></i>{{/if}}
						</a>
						{{#if categories}}
							<ul>
								<li>
									<a href="#" class="header-sidebar-menu-back" data-action="pop-menu" name="back-sidebar">
										<i class="header-sidebar-menu-pop-icon"></i>
										{{translate 'Back'}}
									</a>
								</li>

								<li>
									<a {{objectToAtrributes this}}>
										{{translate 'Browse $(0)' text}}
									</a>
								</li>

								{{#each categories}}
								<li>
									<a {{objectToAtrributes this}} {{#if categories}}data-action="push-menu"{{/if}}>
									{{text}}
									{{#if categories}}<i class="header-sidebar-menu-push-icon"></i>{{/if}}
									</a>

									{{#if categories}}
									<ul>
										<li>
											<a href="#" class="header-sidebar-menu-back" data-action="pop-menu">
												<i class="header-sidebar-menu-pop-icon"></i>
												{{translate 'Back'}}
											</a>
										</li>

										<li>
											<a {{objectToAtrributes this}}>
												{{translate 'Browse $(0)' text}}
											</a>
										</li>

										{{#each categories}}
										<li>
											<a {{objectToAtrributes this}} name="{{text}}">{{text}}</a>
										</li>
										{{/each}}
									</ul>
									{{/if}}
								</li>
								{{/each}}
							</ul>
						{{/if}}
					</li>
				{{/if}}
			{{/each}}

			<li class="header-sidebar-menu-separator"></li>
			{{#if showExtendedMenu}}
			<li class="header-sidebar-menu-myaccount" data-view="Header.Menu.MyAccount"></li>
			{{/if}}
			<li data-view="QuickOrderHeaderLink">
			</li>
			<li data-view="RequestQuoteWizardHeaderLink">
			</li>
		</ul>

	</div>

	{{#if showExtendedMenu}}
	<a class="header-sidebar-user-logout" href="#" data-touchpoint="logout" name="logout">
		<i class="header-sidebar-user-logout-icon"></i>
		{{translate 'Sign Out'}}
	</a>
	{{/if}}

	{{#if showLanguages}}
	<div data-view="Global.HostSelector"></div>
	{{/if}}
	{{#if showCurrencies}}
	<div data-view="Global.CurrencySelector"></div>
	{{/if}}

</div>



{{!----
Use the following context variables when customizing this template: 
	
	categories (Array)
	showExtendedMenu (Boolean)
	showLanguages (Boolean)
	showCurrencies (Boolean)

----}}
