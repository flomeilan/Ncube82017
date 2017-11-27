{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="product-reviews-form">
	{{#if isLoginRequiredAndIsNotLoggedIn}}
		<p>{{translate 'You need to be logged in to write a review, <a href="#" data-touchpoint="login">click here</a> to log in.'}}</p>
	{{else}}

		<h1>{{{header}}}</h1>

		<div class="product-reviews-form-divider"></div>

		<div class="product-reviews-form-item-cell">
			<div data-view="Facets.ItemCell" data-template="facets_item_cell_list"></div>
		</div>
		<div class="product-reviews-form-content">
			<form id="new-product-review" class="product-reviews-form-new" action="POST">
				{{#if showStarRatingAttributes}}
					<p class="product-reviews-form-content-title">
						{{translate 'How does this product feel overall?'}}
					</p>

					<div class="product-reviews-form-content-rating" data-view="Global.StarRatingAttribute"></div>
				{{/if}}

				<p class="product-reviews-form-content-title">
					{{translate 'Rating'}}
				</p>
				<div id="rating" data-view="Global.StarRating" data-validation="control-group" class="product-reviews-form-global-star-rating"></div>

				<div class="product-reviews-form-content-groups">
					<div class="product-reviews-form-content-group" data-validation="control-group" data-input="writerName">
						<label class="product-reviews-form-content-group-label" for="writerName">{{translate 'Your Name'}}</label>
						<div class="product-reviews-form-controls" data-validation="control">
							<input type="text" id="writerName" class="product-reviews-form-content-group-input" name="writerName" value="{{writer}}" placeholder="">
							<p class="product-reviews-form-help">{{translate 'For privacy reasons, please do not use your full name or email address.'}}</p>
						</div>
					</div>
					<div class="product-reviews-form-content-group" data-validation="control-group" data-input="text">
						<label class="product-reviews-form-content-group-label" for="text">{{translate 'Write your review'}}</label>
						<div class="product-reviews-form-controls" data-validation="control">
							<textarea id="text" class="product-reviews-form-content-group-text" name="text">{{text}}</textarea>
						</div>
					</div>
					<div class="product-reviews-form-content-group" data-validation="control-group" data-input="title">
						<label class="product-reviews-form-content-group-label" for="title">{{translate 'A headline for your review'}}</label>
						<div class="product-reviews-form-controls" data-validation="control">
							<input type="text" id="title" class="product-reviews-form-content-group-input" name="title" value="{{title}}" placeholder="">
						</div>
					</div>
				</div>
				<div class="product-reviews-form-actions">
					<button type="submit" class="product-reviews-form-actions-button-submit">{{translate 'Submit'}}</button>
			  		<button type="button" data-action="preview" class="product-reviews-form-actions-button-preview">{{translate 'Preview'}}</button>
			  		<a class="product-reviews-form-actions-button-back" href="{{ itemUrl }}">{{translate 'Back to Product'}}</a>
				</div>
			</form>
		</div>
	{{/if}}
</div>



{{!----
Use the following context variables when customizing this template:

	header (String)
	isLoginRequiredAndIsNotLoggedIn (Boolean)
	writer (String)
	title (String)
	text (String)
	itemUrl (String)
	showStarRatingAttributes (Boolean)

----}}
