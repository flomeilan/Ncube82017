<section class="<%= class_name %>-layout">
	<h3 class="summary-title">{{translate 'CCT <%= module_name %> Example'}}</h3>

    <div class="<%= class_name %>-button-container">
        <a href="/test_extension" class="<%= class_name %>-button-add"> {{translate 'Go to the TODO Example'}}</a>
    </div>
    <span>
    	{{promotion_text}}
    </span>
</section>

<!--
	Available helpers:
	{{ getExtensionAssetsPath img/image.jpg}} - reference assets in your extension
	
	{{ getExtensionAssetsPathWithDefault context_var img/image.jpg}} - use context_var value i.e. configuration variable. If it does not exist, fallback to an asset from the extension assets folder
	
	{{ getThemeAssetsPath context_var img/image.jpg}} - reference assets in the active theme
	
	{{ getThemeAssetsPathWithDefault context_var img/theme-image.jpg}} - use context_var value i.e. configuration variable. If it does not exist, fallback to an asset from the theme assets folder
-->