const { mix } = require('laravel-mix');
require('laravel-mix-merge-manifest');

mix.setPublicPath('../../public').mergeManifest();

mix.js(__dirname + '/Resources/assets/js/app.js', 'js/customerslandingpageapi.js')
    .sass( __dirname + '/Resources/assets/sass/app.scss', 'css/customerslandingpageapi.css');

if (mix.inProduction()) {
    mix.version();
}