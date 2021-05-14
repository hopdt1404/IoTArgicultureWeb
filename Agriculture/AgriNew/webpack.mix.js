const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css');

module.exports = {
    module: {
        rules: [{
            test: /\.scss$/,
            use: ['style-loader', 'css-loader', 'sass-loader', {
                loader: 'style-resources-loader',
                options: {
                    patterns: [
                        './resource/sass/base_sass/variables/*.scss',
                        './resource/sass/base_sass/themes/*.scss',
                        './resource/sass/base_sass/mixins/*.scss',
                        './resource/sass/layouts/base_layouts/*.scss',
                        './resource/sass/pages/*.scss',
                    ]
                }
            }]
        }]
    },
}
