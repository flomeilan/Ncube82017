{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-reviews-preview-review" itemprop="review" itemscope itemtype="https://schema.org/Review" data-id="{{reviewId}}">
	<div class="product-reviews-preview-review-rating">
		{{#if isReviewRatingPerAttributesLegthGreaterThan0}}
			<div data-view="Global.StarRatingAttribute" class="product-reviews-preview-review-rating-attribute"></div>
		{{/if}}

		<div data-view="Global.StarRating" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating"></div>
	</div>
	<div class="product-reviews-preview-review-content">

		<h4 itemprop="name">
			{{reviewTitle}}
		</h4>
		<p class="product-reviews-preview-review-content-username">
			{{translate 'Will be posted publicly as <span itemprop="author">$(0)</span>' reviewAuthor}}
			{{#if isReviewVerified}}
				- <i class="product-reviews-preview-review-icon-ok-sign"></i> {{translate 'verified purchaser'}}
			{{/if}}
		</p>
		<div class="product-reviews-preview-review-content-description">
			<p itemprop="description">
				{{{reviewText}}}
			</p>
		</div>
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	reviewCreatedOn (String)
	reviewTitle (String)
	reviewAuthor (String)
	isReviewVerified (Boolean)
	reviewText (String)
	isReviewRatingPerAttributesLegthGreaterThan0 (Boolean)
	usefulButtonClass (String)
	usefulCountGreaterThan0 (Boolean)
	notUsefulButtonClass (String)
	notusefulCountGreater (Boolean)

----}}
