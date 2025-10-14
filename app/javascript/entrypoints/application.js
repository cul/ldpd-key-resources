// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import UJS from '@rails/ujs';
import * as ActiveStorage from '@rails/activestorage';

// require('../channels');

import '../src/key_resources'; // editor functions that must share CSRF from rails/ujs
import '../css/key_resources.scss';

UJS.start();
ActiveStorage.start();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
