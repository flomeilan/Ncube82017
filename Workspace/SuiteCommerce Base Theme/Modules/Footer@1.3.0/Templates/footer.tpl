{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use..
}}

<div data-view="Global.BackToTop"></div>
<div class="footer-content">
    <div id="banner-footer" class="content-banner banner-footer" data-cms-area="global_banner_footer" data-cms-area-filters="global"></div>
    <div class="footer-content-nav">
		{{#if showFooterNavigationLinks}}
		<div class="col-md-2 col-sm-4">
                <div class="footer-content-nav-list nav_menu-1">
                    <h4>{{translate 'About us'}}</h4>
                        <ul id="menu-about-us">
                            <li id="footer-menu-item-01" class="footer-menu-line"><a href="#">Careers</a>
                            </li>
                            <li id="footer-menu-item-02" class="footer-menu-line"><a href="#">About us</a>
                            </li>
                            <li id="footer-menu-item-03" class="footer-menu-line"><a href="#">Store Locator</a>
                            </li>
                            <li id="footer-menu-item-04" class="footer-menu-line"><a href="#">News & Blog</a>
                            </li>
                            </li>
                        </ul>
                </div>
        </div>
        <div class="col-md-2 col-sm-4">
                <div class="footer-content-nav-list nav_menu-2">
                    <h4>{{translate 'Shop with us'}}</h4>
                        <ul id="menu-Shop-with-us">
                            <li id="menu-item-05" class="footer-menu-line"><a href="#">Mens</a>
                            </li>
                            <li id="menu-item-06" class="footer-menu-line"><a href="#">Womens</a>
                            </li>
                            <li id="menu-item-07" class="footer-menu-line"><a href="#">Kids</a>
                            </li>
                            <li id="menu-item-08" class="footer-menu-line"><a href="#">On Sale</a>
                            </li>
                            </li>
                        </ul>
                </div>
        </div>
           <div class="col-md-2 col-sm-4">
                <div class="footer-content-nav-list nav_menu-3">
                    <h4>{{translate 'Customer Service'}}</h4>
                        <ul id="menu-customer-service">
                            <li id="footer-menu-item-09" class="footer-menu-line"><a href="#">F.A.Q</a>
                            </li>
                            <li id="footer-menu-item-10" class="footer-menu-line"><a href="#">Shipping Info</a>
                            </li>
                            <li id="footer-menu-item-11" class="footer-menu-line"><a href="#">Contact us</a>
                            </li>
                            <li id="footer-menu-item-12" class="footer-menu-line"><a href="#">Returns & Refunds</a>
                            <li id="footer-menu-item-13" class="footer-menu-line"><a href="#">Your Account</a>
                            </li>
                            </li>
                        </ul>
                </div>
        </div>
        <div class="col-md-2 col-sm-4">
                <div class="footer-content-nav-list nav_menu-4">
                    <h4>{{translate 'Social'}}</h4>

                    <div class="social-sharing-flyout-icons">
                        <a href="#" class="social-twitter">
                            <i class="social-sharing-flyout-content-social-twitter-icon"></i>
                        </a>
                        <a href="#" class="social-google">
                            <i class="social-sharing-flyout-content-social-google-icon"></i>
                        </a>
                        <a href="#" class="social-pinterest">
                            <i class="social-sharing-flyout-content-social-pinterest-icon"></i>
                        </a>
                        <a href="#" class="social-facebook">
                            <i class="social-sharing-flyout-content-social-facebook-icon"></i>
                        </a>
                    </div>
                </div>
        </div>
        <div class="col-md-4 col-sm-4">
            	<div data-view="FooterContent" class="footer-content-nav-list"></div>
        </div>
		</div>
		{{/if}}
            <div class="footer-content-copyright">
            {{translate '&copy; 2008-2015 Company Name'}}
    </div>
	</div>
	
</div>



{{!----
Use the following context variables when customizing this template:

	showFooterNavigationLinks (Boolean)
	footerNavigationLinks (Array)

----}}
