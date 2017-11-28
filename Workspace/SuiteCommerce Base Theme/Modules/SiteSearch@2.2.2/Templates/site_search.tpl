{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="site-search" data-type="site-search">
    <div class="site-search-content">
        <form class="site-search-content-form" method="GET" action="/search" data-action="search">
            <div class="site-search-content-input">
				<div data-view="ItemsSeacher"></div>
				<a class="site-search-input-reset" data-type="search-reset"><i class="site-search-input-reset-icon"></i></a>
            </div>
            <button class="site-search-button-submit" type="submit">{{translate 'Go'}}</button>
        </form>
    </div>
</div>



{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}
