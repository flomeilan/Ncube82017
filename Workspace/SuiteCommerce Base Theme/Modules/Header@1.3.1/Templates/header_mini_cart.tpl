{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<a class="header-mini-cart-menu-cart-link {{#if showLines}}header-mini-cart-menu-cart-link-enabled{{/if}}" data-type="mini-cart" title="{{translate 'Cart'}}" data-touchpoint="{{cartTouchPoint}}" data-hashtag="#cart" href="#">
	<i class="header-mini-cart-menu-cart-icon"></i>
	<span class="header-mini-cart-menu-cart-legend">
		{{#if isLoading}}
		<span class="header-mini-cart-summary-cart-ellipsis"></span>
		{{else}}
				{{translate '$(0)' itemsInCart}}
		{{/if}}
	</span>
</a>
<div class="header-mini-cart">
	 {{#if showLines}} 
	 	<div data-view="Header.MiniCartItemCell" class="header-mini-cart-container"></div>
		<div class="header-mini-cart-subtotal">
			<div class="header-mini-cart-subtotal-items">
				{{#if showPluraLabel}}
					{{translate '$(0) items' itemsInCart}}
				{{else}}
					{{translate '1 item'}}
				{{/if}}
			</div>

			{{#if isPriceEnabled}}
			<div class="header-mini-cart-subtotal-amount">
				{{translate 'SUBTOTAL: $(0)' subtotalFormatted}}
			</div>
			{{/if}}
		</div>

		<div class="header-mini-cart-buttons">
			<div class="header-mini-cart-buttons-left">
				<a href="#" class="header-mini-cart-button-view-cart" data-touchpoint="{{cartTouchPoint}}" data-hashtag="#cart" >
					{{translate 'View Cart'}}
				</a>
			</div>
			<div class="header-mini-cart-buttons-right">
				<a href="#" class="header-mini-cart-button-checkout" data-touchpoint="checkout" data-hashtag="#" >
					{{translate 'Checkout'}}
				</a>
			</div>
		</div>

		{{else}} 
		<div class="header-mini-cart-empty">
			<a href="#" data-touchpoint="{{cartTouchPoint}}" data-hashtag="#cart">
				{{#if isLoading}}
					{{translate 'Your cart is loading'}}
				{{else}}
					{{translate 'Your cart is empty'}}
				{{/if}}
			</a>
		</div>
	{{/if}} 
</div>





{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.addresses (Array)
	model.addresses.0 (Object)
	model.addresses.0.zip (String)
	model.addresses.0.country (String)
	model.addresses.0.company (undefined)
	model.addresses.0.internalid (String)
	model.shipmethods (Array)
	model.lines (Array)
	model.paymentmethods (Array)
	model.internalid (String)
	model.confirmation (Object)
	model.confirmation.addresses (Array)
	model.confirmation.shipmethods (Array)
	model.confirmation.lines (Array)
	model.confirmation.paymentmethods (Array)
	model.multishipmethods (Array)
	model.lines_sort (Array)
	model.latest_addition (undefined)
	model.promocodes (Array)
	model.ismultishipto (Boolean)
	model.shipmethod (undefined)
	model.billaddress (undefined)
	model.shipaddress (String)
	model.isPaypalComplete (Boolean)
	model.touchpoints (Object)
	model.touchpoints.logout (String)
	model.touchpoints.customercenter (String)
	model.touchpoints.serversync (String)
	model.touchpoints.viewcart (String)
	model.touchpoints.login (String)
	model.touchpoints.welcome (String)
	model.touchpoints.checkout (String)
	model.touchpoints.continueshopping (String)
	model.touchpoints.home (String)
	model.touchpoints.register (String)
	model.touchpoints.storelocator (String)
	model.agreetermcondition (Boolean)
	model.summary (Object)
	model.summary.discounttotal_formatted (String)
	model.summary.taxonshipping_formatted (String)
	model.summary.taxondiscount_formatted (String)
	model.summary.itemcount (Number)
	model.summary.taxonhandling_formatted (String)
	model.summary.total (Number)
	model.summary.tax2total (Number)
	model.summary.discountedsubtotal (Number)
	model.summary.taxtotal (Number)
	model.summary.discounttotal (Number)
	model.summary.discountedsubtotal_formatted (String)
	model.summary.taxondiscount (Number)
	model.summary.handlingcost_formatted (String)
	model.summary.taxonshipping (Number)
	model.summary.taxtotal_formatted (String)
	model.summary.totalcombinedtaxes_formatted (String)
	model.summary.handlingcost (Number)
	model.summary.totalcombinedtaxes (Number)
	model.summary.giftcertapplied_formatted (String)
	model.summary.shippingcost_formatted (String)
	model.summary.discountrate (Number)
	model.summary.taxonhandling (Number)
	model.summary.tax2total_formatted (String)
	model.summary.discountrate_formatted (String)
	model.summary.estimatedshipping (Number)
	model.summary.subtotal (Number)
	model.summary.shippingcost (Number)
	model.summary.estimatedshipping_formatted (String)
	model.summary.total_formatted (String)
	model.summary.giftcertapplied (Number)
	model.summary.subtotal_formatted (String)
	model.options (Object)
	itemsInCart (Number)
	showPluraLabel (Boolean)
	showLines (Boolean)
	isLoading (Boolean)
	subtotalFormatted (String)
	cartTouchPoint (String)
	isPriceEnabled (Boolean)

----}}
