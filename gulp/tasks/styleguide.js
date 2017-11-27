/* jshint node: true */
'use strict'

var gulp = require('gulp');
var styleguide = require('sc5-styleguide');
var sass = require('gulp-sass');
var path = require('path');
var nconf = require('nconf');

var outputPath = nconf.get('styleguideConfig:output');

gulp.task('styleguide:generate', ['sass-prepare'], function() {
  var sassGlobs = path.join(nconf.get('folders:theme_path'), 'Modules', 'BaseSassStyles@*', '**/*.scss');

  return gulp.src(sassGlobs)
    .pipe(styleguide.generate({
        title: 'SuiteCommerce - Styleguide',
        server: true,
        port: nconf.get('styleguideConfig:port'),
        rootPath: outputPath,
        overviewPath: './gulp/library/sc5-styleguide/SUITECOMMERCE-STYLEGUIDE.md',
        readOnly: true,
        disableEncapsulation: true
      }))

    .pipe(gulp.dest(outputPath));
});

gulp.task('styleguide:applystyles', ['sass'], function() {
  return gulp.src(path.join(nconf.get('folders:output'), 'css', 'myaccount.css'))
    .pipe(sass({
      errLogToConsole: true
    }))
    .pipe(styleguide.applyStyles())
    .pipe(gulp.dest(outputPath));
});

if(nconf.get('extensionMode'))
{
  gulp.task('styleguide'
    , 'Executed as "gulp extension:local styleguide".' +
      '\n\t\t\t\t Generates a styleguide page at localhost:3000.\n'
    , ['styleguide:generate', 'styleguide:applystyles']
  );
}
else
{
  gulp.task('styleguide'
    , 'Executed as "gulp theme:local styleguide".' +
      '\n\t\t\t\tGenerates a styleguide page at localhost:3000.\n'
    , ['styleguide:generate', 'styleguide:applystyles']
  );
}

