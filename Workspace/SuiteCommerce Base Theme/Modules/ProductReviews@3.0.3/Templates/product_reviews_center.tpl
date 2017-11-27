{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<section class="product-reviews-center-content">
	<button class="product-reviews-center-pusher" data-target="product-reviews-center-review" data-type="sc-pusher">
		<span class="product-reviews-center-pusher-title">{{ translate 'Reviews' }}</span>
		<div class="product-reviews-center-pusher-rating" data-view="Global.StarRating"></div>
		<i class="product-reviews-center-pusher-icon"></i>
	</button>
	<div class="product-reviews-center-more-info-content-container" data-action="pushable" data-id="product-reviews-center-review">
		<div class="product-reviews-center">
			{{#if itemCount}}
				<div class="product-reviews-center-container">
					<div class="product-reviews-center-container-header">
						<h2 class="product-reviews-center-container-header-title">{{translate 'Ratings &amp; Reviews'}}</h2>
						<h3 class="product-reviews-center-container-header-number">
							{{#if hasOneReview}}
								{{translate '1 review'}}
							{{else}}
								{{translate '$(0) reviews' itemCount}}
							{{/if}}
						</h3>
						<div data-view="Global.StarRating"></div>
					</div>
					<div class="product-reviews-center-container-wrapper">
						<div data-view="Global.RatingByStar"></div>
					</div>
					<div class="product-reviews-center-container-footer">
						<a href="{{itemUrl}}/newReview" class="product-reviews-center-container-footer-button">{{translate 'Write a Review'}}</a>
					</div>
				</div>

				<section class="product-reviews-center-list">
					<div  data-view="ListHeader.View"></div>
					{{#if totalRecords}}
						<div data-view="ProductReviews.Review" class="product-reviews-center-review-container"></div>
					{{else}}
						{{translate 'There are no reviews available for your selection'}}
					{{/if}}
				</section>

				<div class="product-reviews-center-footer">
					<div data-view="GlobalViews.Pagination"></div>
				</div>
			{{else}}
				<div class="product-reviews-center-container">
					<div class="product-reviews-center-container-header">
						<h3 class="product-reviews-center-container-header-title">{{translate 'Ratings &amp; Reviews'}}</h3>
						<h4 class="product-reviews-center-container-header-title">{{translate 'No reviews available'}}</h4>
						<p>{{translate 'Be the first to'}} <a href="{{itemUrl}}/newReview" class="product-reviews-center-container-button">{{translate 'Write a Review'}}</a></p>
					</div>
				</div>
			{{/if}}
		</div>
	</div>
</section>



{{!----
Use the following context variables when customizing this template:

	itemCount (Number)
	hasOneReview (Boolean)
	itemUrl (String)
	totalRecords (Number)

----}}
