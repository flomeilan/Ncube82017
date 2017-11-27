{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a class="header-menu-myaccount-anchor" href="#" data-action="push-menu" name="myaccount">
	{{translate 'My Account'}}
	<i class="header-menu-myaccount-menu-push-icon"></i>
</a>

<ul class="header-menu-myaccount">
	<li>
		<a href="#" class="header-menu-myaccount-back" data-action="pop-menu" name="back">
			<i class="header-menu-myaccount-pop-icon "></i>
			{{translate 'Back'}}
		</a>
	</li>
	<li class="header-menu-myaccount-overview">
		<a class="header-menu-myaccount-overview-anchor" href="#" data-touchpoint="customercenter" data-hashtag="#overview" name="accountoverview">
			{{translate 'Account Overview'}}
		</a>

		<a class="header-menu-myaccount-signout-link" href="#" data-touchpoint="logout" name="signout">
			<i class="header-menu-myaccount-signout-icon"></i>
			{{translate 'Sign Out'}}
		</a>
	</li>

	<li class="header-menu-myaccount-item-level2 header-menu-myaccount-level2-orders" data-permissions="{{purchasesPermissions}}" data-permissions-operator="OR">
		<a class="header-menu-myaccount-anchor-level2" href="#" data-action="push-menu" name="orders">
			{{translate 'Purchases'}}
			<i class="header-menu-myaccount-menu-push-icon"></i>
		</a>
		<ul class="header-menu-myaccount-level3 header-menu-myaccount-level3-orders">
			<li>
				<a href="#" class="header-menu-myaccount-back" data-action="pop-menu" name="back-level3">
					<i class="header-menu-myaccount-pop-icon "></i>
					{{translate 'Back'}}
				</a>
			</li>
			<li data-permissions="{{purchasesPermissions}}">
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#purchases" name="orderhistory">
					{{translate 'Purchases History'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#returns" data-permissions="{{returnsPermissions}}" name="returns">
					{{translate 'Returns'}}
				</a>
			</li>
			<li data-permissions="{{purchasesPermissions}}">
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#reorderItems" name="reorderitems">
					{{translate 'Reorder Items'}}
				</a>
			</li>
			<li class="header-menu-myaccount-item-level3" data-permissions="transactions.tranFind.1,transactions.tranEstimate.1">
				<a class="header-menu-myaccount-anchor-level3" data-action="push-menu" href="#" data-touchpoint="customercenter" data-hashtag="#quotes" name="quotes">
					{{translate 'Quotes'}}
					<i class="header-menu-myaccount-menu-push-icon"></i>
				</a>
				<ul class="header-menu-myaccount-level4">
					<li>
						<a href="#" class="header-menu-myaccount-back" data-action="pop-menu" name="back-level4">
							<i class="header-menu-myaccount-pop-icon "></i>
							{{translate 'Back'}}
						</a>
			</li>
					<li>
						<a class="header-menu-myaccount-anchor-level4" href="#" data-touchpoint="customercenter" data-hashtag="#quotes" name="allmyquotes">
							{{translate 'All my Quotes'}}
						</a>
					</li>
					{{#if hasProductList}}
						<li>
							{{#if hasNoItem}}
								<a class="header-menu-myaccount-anchor-level4" href="#" data-touchpoint="customercenter" data-hashtag="#quotes/new" name="requestaquotes">
									{{translate 'Request a Quote'}}
								</a>
							{{else}}

								{{#if hasItemInBasket}}
									<a class="header-menu-myaccount-anchor-level4" href="#" data-touchpoint="customercenter" data-hashtag="#quotebasket" name="quotebasket">
										{{translate 'Quote basket <span>(300)</span>'}}
				</a>
								{{/if}}
							{{/if}}
						</li>
					{{/if}}
				</ul>
			</li>
		</ul>
	</li>

	<!-- Product Lists - For single list mode data-hashtag will be added dynamically -->
	{{#if isProductListsEnabled}}
		<li class="header-menu-myaccount-item-level2">
			<a class="header-menu-myaccount-anchor-level2" href="#" data-touchpoint="customercenter" data-hashtag="#wishlist" name="wishlist">
				{{translate 'Wishlist'}}
			</a>

			<ul class="header-menu-myaccount-level3">
				{{#if productListsReady}}
					{{#unless isSingleList}}
						<li>
							<a href="#" class="header-menu-myaccount-anchor-level3" data-touchpoint="customercenter" data-hashtag="#wishlist" name="allmylists">
								{{translate 'All my lists'}}
							</a>
						</li>
					{{/unless}}
					{{#each productLists}}
					<li>
						<a href="#" class="header-menu-myaccount-anchor-level3" data-touchpoint="customercenter" data-hashtag="{{url}}" name="{{name}}">
							{{name}} ({{ items.length }})
						</a>
					</li>
					{{/each}}
				{{else}}
					<li>
						<a href="#" class="header-menu-myaccount-anchor-level3">
							{{translate 'Loading...'}}
						</a>
					</li>
				{{/if}}
			</ul>
		</li>
	{{/if}}


	<!-- Billing -->
	<li class="header-menu-myaccount-item-level2">
		<a class="header-menu-myaccount-anchor-level2" href="#" data-action="push-menu" name="billing">
			{{translate 'Billing'}}
			<i class="header-menu-myaccount-menu-push-icon"></i>
		</a>
		<ul class="header-menu-myaccount-level3">
			<li>
				<a href="#" class="header-menu-myaccount-back" data-action="pop-menu" name="back-level3">
					<i class="header-menu-myaccount-pop-icon "></i>
					{{translate 'Back'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" tabindex="-1" href="#" data-touchpoint="customercenter" data-hashtag="#balance" name="accountbalance">{{translate 'Account Balance'}}</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" tabindex="-1" href="#" data-touchpoint="customercenter" data-hashtag="#invoices" data-permissions="transactions.tranCustInvc.1" name="invoices">{{translate 'Invoices'}}</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" tabindex="-1" href="#" data-touchpoint="customercenter" data-hashtag="#transactionhistory" data-permissions="transactions.tranCustInvc.1, transactions.tranCustCred.1, transactions.tranCustPymt.1, transactions.tranCustDep.1, transactions.tranDepAppl.1" data-permissions-operator="OR" name="transactionhistory">{{translate 'Transaction History'}}</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" tabindex="-1" href="#" data-touchpoint="customercenter" data-hashtag="#printstatement" data-permissions="transactions.tranStatement.2" name="printastatement">{{translate 'Print a Statement'}}</a>
			</li>
		</ul>
	</li>

	<!-- Settings -->
	<li class="header-menu-myaccount-item-level2">
		<a class="header-menu-myaccount-anchor-level2" tabindex="-1" href="#" data-action="push-menu" name="settings">
			{{translate 'Settings'}}
			<i class="header-menu-myaccount-menu-push-icon"></i>
		</a>
		<ul class="header-menu-myaccount-level3">
			<li>
				<a href="#" class="header-menu-myaccount-back" data-action="pop-menu" name="back-level3">
					<i class="header-menu-myaccount-pop-icon "></i>
					{{translate 'Back'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#profileinformation" name="profileinformation">
					{{translate 'Profile Information'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#emailpreferences" name="emailpreferences">
					{{translate 'Email Preferences'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#addressbook" name="addressbook">
					{{translate 'Address Book'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#creditcards" name="creditcards">
					{{translate 'Credit Cards'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" href="#" data-touchpoint="customercenter" data-hashtag="#updateyourpassword" name="updateyourpassword">
					{{translate 'Update Your Password'}}
				</a>
			</li>
		</ul>
	</li>

	{{#if isCaseModuleEnabled}}
	<li class="header-menu-myaccount-item-level2" data-permissions="lists.listCase.2">
		<a  class="header-menu-myaccount-anchor-level2" tabindex="-1" href="#" data-action="push-menu" name="cases">
			{{translate 'Cases'}}
			<i class="header-menu-myaccount-menu-push-icon"></i>
		</a>
		<ul class="header-menu-myaccount-level3">
			<li>
				<a href="#" class="header-menu-myaccount-back" data-action="pop-menu" name="back-level3">
					<i class="header-menu-myaccount-pop-icon "></i>
					{{translate 'Back'}}
				</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" tabindex="-1" href="#" data-touchpoint="customercenter" data-hashtag="#cases" name="allmycases">{{translate 'Support Cases'}}</a>
			</li>
			<li>
				<a class="header-menu-myaccount-anchor-level3" tabindex="-1" href="#" data-touchpoint="customercenter" data-hashtag="#newcase" name="submitnewcase">{{translate 'Submit New Case'}}</a>
			</li>
		</ul>
	</li>
	{{/if}}

</ul>



{{!----
Use the following context variables when customizing this template: 
	
	isProductListsEnabled (Boolean)
	isSingleList (Boolean)
	isCaseModuleEnabled (Boolean)
	productListsReady (Boolean)
	productLists (Array)
	purchasesPermissions (String)
	returnsPermissions (String)

----}}
