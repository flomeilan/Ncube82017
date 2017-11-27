{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-details-quickview">
	<div class="product-details-quickview-img">
		<div data-view="Product.ImageGallery"></div>
	</div>
	<div class="product-details-quickview-details">

		<h1 class="product-details-quickview-item-name" itemprop="name">{{pageHeader}}</h1>

		<a class="product-details-quickview-full-details" data-action="go-to-fullview" data-touchpoint="home" data-name="view-full-details" data-hashtag="#{{itemUrl}}" href="{{itemUrl}}">
			{{translate 'View full details'}}
		</a>

		<div class="product-details-quickview-main">
			{{#if isItemProperlyConfigured}}
				<form id="product-details-quickview-form" data-action="submit-form" method="POST">

					<section class="product-details-quickview-info">

						<div id="banner-summary-bottom" class="product-details-quickview-banner-summary-bottom"></div>

					</section>

					<section data-view="Product.Options"></section>

					<div data-view="Product.Stock.Info"></div>

					<div data-view="Product.Sku"></div>

					<div data-view="Product.Price"></div>
					<div data-view="Quantity.Pricing"></div>

					{{#if isPriceEnabled}}
						<div data-view="Quantity"></div>

						<section class="product-details-quickview-actions">

							<div class="product-details-quickview-actions-container">
								<div data-view="MainActionView"></div>
							</div>
							<div class="product-details-quickview-actions-container">
								<div data-view="AddToProductList" class="product-details-quickview-actions-container-add-to-wishlist"></div>
								<div data-view="ProductDetails.AddToQuote" class="product-details-quickview-actions-container-add-to-quote"></div>
							</div>

						</section>
					{{/if}}

					<div data-view="StockDescription"></div>

					<div class="product-details-quickview-main-bottom-banner">
						<div id="banner-summary-bottom" class="product-details-quickview-banner-summary-bottom"></div>
					</div>
				</form>
			{{else}}
				<div data-view="GlobalViewsMessageView.WronglyConfigureItem"></div>
			{{/if}}

			<div id="banner-details-bottom" class="product-details-quickview-banner-details-bottom" data-cms-area="item_info_bottom" data-cms-area-filters="page_type"></div>
		</div>

	</div>
</div>


{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
