# Fansite

Example of a fan site.  Attempting to provide a base template that can be used for a variety of people and uses by only editing the css, images, and yml files.  It is i18n-compatiable.

## Features

1. Sign in through social media (twitter)
2. Aggreagate media from many different sources
3. Blog/posts to provide updates to fans
4. Manage event calendar to show information and times for concerts and other appearances

## How to use

For now, you can fork this app and edit the files.

### CSS
Change the `custom/variables.scss` and `custom/mixins.scss` as well as the `bootstrap-custom.scss` file to customize the look and feel of the site.

### Images
Change any of the images in the assets/images directory.

### i18n
Overwrite any of the i18n to customize the site. Encourage users to submit new translations if you host your code on Github.

## Roadmap

1. Add translatable content with `globalize3`
2. Add support for Facebook login
3. Translate app into gem with ability to pick and choose features to use
4. Extract event calendar to gem

## How to report an issue?
Use the issue tracker on Github.

## How to contribute?

I encourage anyone to submit a pull-request and I will definitely consider it.  Please include tests where applicable and a jsfiddle if it is a front-end change.