{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-reviews-review" itemprop="review" itemscope itemtype="https://schema.org/Review" data-id="{{reviewId}}">
	<div class="product-reviews-review-comment-item-cell">
		<div data-view="ProductReview.Review.Global.StarRating" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating"></div>
		<span class="product-reviews-review-comment-item-cell-date" itemprop="datePublished">
			{{ reviewCreatedOn }}
		</span>
	</div>
	<h4 class="product-reviews-review-title" itemprop="name">
		{{reviewTitle}}
	</h4>
	<p class="product-reviews-review-comment-username">
		{{translate 'by <span itemprop="author">$(0)</span>' reviewAuthor}}
		{{#if isReviewVerified}}
			- <i class="product-reviews-review-icon-ok-sign" data-toggle="tooltip" data-placement="right" title="{{translate 'verified purchaser'}}"></i>
		{{/if}}
	</p>
	<div class="product-reviews-review-review">
		<p class="product-reviews-review-review-description" itemprop="description">
			{{breaklines reviewText}}
		</p>
		<div class="product-reviews-review-review-rating">
		{{#if isReviewRatingPerAttributesLegthGreaterThan0}}
			<div class="product-reviews-review-rating-per-attribute">
				<div data-view="Global.StarRatingAttribute"></div>
			</div>
		{{/if}}
		</div>
	</div>
	{{#if showActionButtons}}
	<div class="product-reviews-review-comment-footer">
		<p>{{translate  'Was this review helpful?'}}</p>

		<button class="product-reviews-review-comment-footer-button {{usefulButtonClass}}" type="button" data-action="vote" data-type="mark-as-useful" data-review-id="{{reviewId}}">
			<!-- <i class="product-reviews-review-comment-footer-button-icon-like"></i>

			<span>
				{{#if usefulCountGreaterThan0}}
					{{translate ' ($(0))' usefulCount }}
				{{/if}}
			</span>
			-->

			{{#if usefulCountGreaterThan0}}
				{{translate 'Yes ($(0))' usefulCount }}
			{{else}}
				{{translate 'Yes'}}
			{{/if}}
		</button>

		<button class="product-reviews-review-comment-footer-button {{notUsefulButtonClass}}" type="button" data-action="vote" data-type="mark-as-not-useful" data-review-id="{{reviewId}}">
			<!-- <i class="product-reviews-review-comment-footer-button-icon-unlike"></i>

			<span>
				{{#if notusefulCountGreater}}
					{{translate ' ($(0))' notUsefulCount}}
				{{/if}}
			</span> -->

			{{#if notusefulCountGreater}}
				{{translate 'No ($(0))' notUsefulCount}}
			{{else}}
				{{translate 'No'}}
			{{/if}}
		</button>
	</div>
	<div data-type="alert-placeholder"></div>
	{{/if}}
</div>




{{!----
Use the following context variables when customizing this template:

	reviewCreatedOn (String)
	reviewTitle (String)
	reviewAuthor (String)
	isReviewVerified (Boolean)
	reviewText (String)
	isReviewRatingPerAttributesLegthGreaterThan0 (Boolean)
	showActionButtons (Boolean)
	usefulButtonClass (String)
	reviewId (String)
	usefulCountGreaterThan0 (Boolean)
	usefulCount (String)
	notUsefulButtonClass (String)
	notusefulCountGreater (Boolean)
	notUsefulCount (String)

----}}
