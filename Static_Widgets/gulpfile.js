// ======================================================
// DEPENDENCIES
// ======================================================

// First, lets define all of the required
// plugins we'll need for the site/app
var gulp     = require('gulp'),
exec         = require('gulp-exec'),
gutil        = require('gulp-util'),
autoprefixer = require('gulp-autoprefixer'),
sass         = require('gulp-sass'),
concat       = require('gulp-concat'),
plumber      = require('gulp-plumber'),
notify       = require('gulp-notify'),
livereload   = require('gulp-livereload'),
rename       = require('gulp-rename'),
imagemin     = require('gulp-imagemin'),
uglify       = require('gulp-uglify'),
newer        = require('gulp-newer'),
fileinclude  = require('gulp-file-include'),
sourcemaps   = require('gulp-sourcemaps'),
del          = require('del'),
less         = require('gulp-less'),
gulpkss      = require('gulp-kss'),
runSequence  = require('run-sequence');


// ======================================================
// PATHS & ERROR HANDLING
// ======================================================

// To help clean up paths, lets predefine
// any major paths we'll want to use
var paths = {
    css            : 'css/',
    fonts          : 'fonts/',
    js             : 'js/',
    sass           : 'css/scss/',
    images         : 'img/',
    styleguideSrc  : 'styleguide.tpl/',
    styleguideDist : 'styleguide/',
    templates      : 'templates/'
};

var onError = function(err) {
    notify.onError({
    title          : "Gulp",
    subtitle       : "Failure!",
    message        : "Error: <%= error.message %>",
    sound          : "Funk"
    })(err);

    this.emit('end');
};


// ======================================================
// TASKS
// ======================================================

//
// TASK: SASS
// Compile our sass into css for site/application
// Be sure to switch between sass outputStyles below
//
gulp.task('sass', function() {
    return gulp.src(paths.sass + '**/*.scss')
        .pipe(sourcemaps.init())
        .pipe(sass({outputStyle: 'expanded'}).on('error', sass.logError))
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(gulp.dest('css'))
        .pipe(livereload('start'))
        .pipe(notify({message: 'Sass: CSS Compiled!', onLast: true }));
});

gulp.task('sass-prod', function() {
    return gulp.src(paths.sass + '**/*.scss')
        .pipe(sourcemaps.init())
        .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(gulp.dest('css'))
        .pipe(livereload('start'))
        .pipe(notify({message: 'Sass: CSS Compiled!', onLast: true }));
});

//
// TASK: IMAGES
// We'll look for any new images in the project and
// optimize them. Supports .png, .jpg, .gif, and .svg
//
gulp.task('images', function() {
    return gulp.src(paths.images + '**/*')
        .pipe(newer('img'))
        .pipe(imagemin())
        .pipe(gulp.dest(paths.images))
        .pipe(gulp.dest(paths.styleguideDist + 'img'));
});

//
// TASK: SCRIPTS
// Compile global script files in the project
// To ignore a vendor file, add: ,'!' + paths.js + 'vendors/NAME-OF-FILE.js'
// example: return gulp.src([paths.js + 'vendors/**/*', '!' + paths.js + 'vendors/NAME-OF-FILE.js', paths.js + 'init.js'])
//
gulp.task('scripts', function() {
  return gulp.src([paths.js + 'vendors/**/*', '!' + paths.js + 'vendors/jquery/*', '!' + paths.js + 'init.js'])
    //.pipe(uglify())
    .pipe(concat('global.js'))
    .pipe(gulp.dest(paths.js));
});

//
// TASK: FILEINCLUDE
// Description.
//
gulp.task('fileinclude', function() {
  return gulp.src(paths.templates + 'src/**/*.tpl.html')
    .pipe(fileinclude())
    .pipe(rename({
      extname: ""
    }))
    .pipe(rename({
      extname: ".html"
    }))
    .pipe(gulp.dest('./styleguide/templates'))
    .pipe(notify({ message: 'Files: Includes Included!', onLast: true }));
});


// ======================================================
// STYLE GUIDE
// ======================================================

//
// TASK: STYLEGUIDE
// Let's clean up our styleguide directory and build
// a clean copy. We'll reference our templates and run
// KSS to find our documented comments in our SCSS files.
//
gulp.task('styleguide-clean', function () {
  del([
    paths.styleguideDist + '*',
    '!' + paths.styleguideDist + '/templates'
  ]);
});

gulp.task('styleguide-less', function () {
  return gulp.src(paths.styleguideSrc + '**/*.less')
    .pipe(less())
    .pipe(gulp.dest(paths.styleguideSrc));
});

gulp.task('styleguide-generate', function () {
  var reportOptions = {
    err        : true,
    stderr     : true,
    stdout     : true
  };
  return gulp.src(paths.sass)
    .pipe(exec('kss-node --source ' + paths.sass +  ' --destination ' + paths.styleguideDist + ' --css ' + paths.css + 'style.css  --template ' + paths.styleguideSrc))
    .pipe(exec.reporter(reportOptions));
});

gulp.task('styleguide-generate-js', function () {
  return gulp.src([paths.js + 'vendors/**/*', paths.js + 'components/**/*', paths.js + 'init.js'])
    .pipe(uglify())
    .pipe(concat('styleguide.js'))
    .pipe(gulp.dest(paths.styleguideDist + 'js/'));
});

gulp.task('styleguide-copy-css', function () {
  return gulp.src(paths.css + '*.css')
    .pipe(gulp.dest(paths.styleguideDist + 'css/'))
    .pipe(livereload({ start: true }));
});

gulp.task('styleguide-assets', function () {
  return gulp.src(paths.styleguideSrc + 'assets/**/*')
    .pipe(gulp.dest(paths.styleguideDist + 'assets/'));
});

gulp.task('styleguide-copy-fonts', function () {
  return gulp.src([paths.fonts + '**/*', '!' + paths.fonts + 'selection.json'])
    .pipe(gulp.dest(paths.styleguideDist + 'fonts/'));
});

gulp.task('styleguide-scripts', function () {
  return gulp.src(paths.styleguideSrc + 'js/**/*')
    .pipe(gulp.dest(paths.styleguideDist + 'js/'));
});


// Run this task to sequence all styleguide tasks
gulp.task('styleguide', function(callback) {
  runSequence('styleguide-clean', 'styleguide-less', 'styleguide-generate', 'styleguide-generate-js', 'styleguide-copy-css', 'styleguide-copy-fonts','styleguide-assets', 'styleguide-scripts', 'images', callback);
});




// ======================================================
// WATCH & INIT
// ======================================================

// Lets setup a series of tasks that can
// run during a watch period to help save time
gulp.task('watch', function() {
    livereload.listen();
    gulp.watch(paths.sass + '**/*.scss', ['sass']);
    gulp.watch(paths.sass + '**/*.scss', ['styleguide']);
    gulp.watch(paths.js + '**/*.js', ['scripts']);
    gulp.watch(paths.templates + '**/*.tpl.html', ['fileinclude']);
});

// Lets setup a series of tasks that can
// run during a single-instance command
gulp.task('default', ['sass-prod', 'scripts', 'images', 'styleguide']);
