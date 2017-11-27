{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<nav class="header-menu-secondary-nav">

	<div class="header-menu-search">
		<button class="header-menu-search-link" data-action="show-sitesearch" title="{{translate 'Search'}}">
			<i class="header-menu-search-icon"></i>
		</button>
	</div>


	<ul class="header-menu-level1">

		{{#each categories}}
			{{#if text}}
				<li {{#if categories}}data-toggle="categories-menu"{{/if}}>
					<a class="{{class}}" {{objectToAtrributes this}}>
					{{translate text}}
					</a>
					{{#if categories}}
					<ul class="header-menu-level-container">
						<li>
							<ul class="header-menu-level2">
								{{#each categories}}
								<li>
									<a class="{{class}}" {{objectToAtrributes this}}>{{translate text}}</a>

									{{#if categories}}
									<ul class="header-menu-level3">
										{{#each categories}}
										<li>
											<a class="{{class}}" {{objectToAtrributes this}}>{{translate text}}</a>
										</li>
										{{/each}}
									</ul>
									{{/if}}
								</li>
								{{/each}}
							</ul>
						</li>
					</ul>
					{{/if}}
				</li>
			{{/if}}
		{{/each}}

	</ul>

</nav>




{{!----
Use the following context variables when customizing this template: 
	
	categories (Array)
	showExtendedMenu (Boolean)
	showLanguages (Boolean)
	showCurrencies (Boolean)

----}}
