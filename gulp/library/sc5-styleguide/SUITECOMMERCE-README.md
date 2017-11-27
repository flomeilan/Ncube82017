# SuiteCommerce Styleguide


## Steps to customize

If you have to add a new feature or just need to make some modfications in the application, you should follow these steps:

1. Go to gulp/library/sc5-styleguide and execute 'npm install'. This action will install all the dependencies required by this library.
2. Make all the changes you need within sc5-styleguide/lib/app.
3. Go to gulp/library/sc5-styleguide and run 'gulp build'.
4. Go to the applications root and run 'npm install'. This action will install the sc5-styleguide library once again with all the changes that you made.
5. Now, you can run 'gulp styleguide' and see the results.


## Changelist

* [root]/pakage.json was modified in order to point "scs5-styleguide" dependency to "gulp/library/sc5-styleguide" (local dependency)

* sc5-styleguide/lib/app/views/partials/sections.html was modified in order to change the behavior related with how the makup is rendered when the component has modifiers. The library doesn't itearete over the modifiers to render the markup anymore, now the library renders just the markup defined in the KSS.

* In the 'sc5-styleguide/gulpfile.babel.js' file, a new gulp task was added ('copy:third-parties'). This task copies a few useful libraries form Modules/third_parties (examples: jquery, bootstrap and datepicker).

* In the app/index.html file, a few lines were added to the 'head' element in order to require third_parties libraries.

* In the sc5-styleguide/lib/app/js/controllers/section.js file, an event listener was defined in order to initialize some components (example: bxSlider and bootstrap).

* Three new images were added in 'lib/app/assets/img', these images are used in the Image Gallery module.

* In the lib/app/views/main.html file some elements were hidden.

* Custom styles were defined in lib/app/css/suite_commerce_styles.css

* Custom styles were defined in lib/app/css-suitecommerce/_styleguide.css. This file is included as a MyAccount dependency when 'styleguide' task is called.