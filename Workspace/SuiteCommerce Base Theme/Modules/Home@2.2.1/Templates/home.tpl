{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="home">
	<div class="home-slider-container">
		<div class="home-image-slider">
			<ul data-slider class="home-image-slider-list">
				{{#each carouselImages}}
					<li>
						<div class="home-slide-main-container">
							<div class="home-slide-image-container">
								<img src="{{resizeImage this ../imageHomeSize}}" alt="" />
							</div>
							<div class="home-slide-caption">
								<h2 class="home-slide-caption-title">SAMPLE HEADLINE</h2>
								<p>Example descriptive text displayed on multiple lines.</p>
								<div class="home-slide-caption-button-container">
									<a href="/search" class="home-slide-caption-button">Shop Now</a>
								</div>
							</div>
						</div>
					</li>
				{{else}}
				<li>
					<div class="home-slide-main-container">
						<div class="home-slide-image-container">
							<img src="{{getThemeAssetsPath (resizeImage 'img/carousel-home-1.png' ../imageHomeSize)}}" alt="" />
						</div>

						<div class="home-slide-caption">
														<p>We present</p>
							<h2 class="home-slide-caption-title">LONDON STREET VIEW</h2>
							

							<div class="home-slide-caption-button-container">
								<a href="/search" class="home-slide-caption-button">Shop Now</a>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="home-slide-main-container">
						<div class="home-slide-image-container">
							<img src="{{getThemeAssetsPath (resizeImage 'img/carousel-home-2.png' ../imageHomeSize)}}" alt="" />
						</div>

						<div class="home-slide-caption">
							<h2 class="home-slide-caption-title">SAMPLE HEADLINE</h2>
							<p>Example descriptive text displayed on multiple lines.</p>
							<div class="home-slide-caption-button-container">
								<a href="/search" class="home-slide-caption-button">Shop Now</a>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="home-slide-main-container">
						<div class="home-slide-image-container">
							<img src="{{getThemeAssetsPath (resizeImage 'img/carousel-home-3.png' ../imageHomeSize)}}" alt="" />
						</div>

						<div class="home-slide-caption">
							<h2 class="home-slide-caption-title">SAMPLE HEADLINE</h2>
							<p>Example descriptive text displayed on multiple lines.</p>
							<div class="home-slide-caption-button-container">
								<a href="/search" class="home-slide-caption-button">Shop Now</a>
							</div>
						</div>
					</div>
				</li>
				{{/each}}
			</ul>
		</div>
	</div>

	<div class="home-banner-main">
	{{#each bottomBannerImages}}
    	<div class="home-banner-main-cell-nth{{@index}}">
    		<div class="home-banner-main-cell-bg">
        		<img src="{{resizeImage this ../imageHomeSizeBottom}}" alt="" >
        		<div class="home-banner-main-cell-text">EXAMPLE TEXT</div>
    		</div>
   		</div>
	{{else}}
      	<div class="home-banner-main-cell-nth0">
      		<div class="home-banner-main-cell-bg">
        		<img src="{{getThemeAssetsPath (resizeImage 'img/banner-bottom-home-1.jpg' ../imageHomeSizeBottom)}}" alt="" >
        		<div class="home-banner-main-cell-text">EXAMPLE TEXT</div>
        	</div>
      	</div>
      	<div class="home-banner-main-cell-nth1">
      		<div class="home-banner-main-cell-bg">
        		<img src="{{getThemeAssetsPath (resizeImage 'img/banner-bottom-home-2.jpg' ../imageHomeSizeBottom)}}" alt="" >
        		<div class="home-banner-main-cell-text">EXAMPLE TEXT</div>
        	</div>
      	</div>
     	<div class="home-banner-main-cell-nth2">
      		<div class="home-banner-main-cell-bg">
        		<img src="{{getThemeAssetsPath (resizeImage 'img/banner-bottom-home-3.jpg' ../imageHomeSizeBottom)}}" alt="" >
        		<div class="home-banner-main-cell-text">EXAMPLE TEXT</div>
        	</div>
      	</div>		
    {{/each}}
	</div>
	<div class="home-banner-promo">
		<div class="home-banner-promo-title home-slide-caption">
			<h2 class="home-slide-caption-title">
				{{translate '<strong>November Sale</strong>'}}
			</h2>
			<p>Free shipping over $125 for international orders</p>
		</div>
		<div class="home-slide-caption home-banner-promo-button">
		<div class="home-slide-caption-button-container">
			<a href="/search" class="home-slide-caption-button">Shop Now</a>
		</div>
	</div>

</div>

<div class="home-merchandizing-zone">
<div id="home-merch-zone" class="home-merchandizing-zone" data-cms-area="global_banner_homeprefooter" data-cms-area-filters="path"></div>
</div>

{{!----
Use the following context variables when customizing this template:

	imageHomeSize (String)
	imageHomeSizeBottom (String)
	carouselImages (Array)
	bottomBannerImages (Array)

----}}
