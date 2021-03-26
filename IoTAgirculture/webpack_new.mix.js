const mix = require('laravel-mix');

mix.js('resources/js/app.js', 'public/dist/js')
  .sass('resources/sass/app.scss', 'public/dist/css')

mix.styles([
  'public/dist/css/css1.css',
  'public/dist/css/css2.css',
], 'public/dist/css/app.css');
