// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


document.addEventListener('turbolinks:load', () => {

    function renderFieldsUponMovieType() {
        if (document.getElementById('movie-form')) {
            const type = document.getElementById('movie_movie_type');
            const year_end = document.getElementById('year-end-field-group');

            if (type.value != 2) {
                year_end.classList.add('d-none')
                // year_end.classList.remove('d-none')
                // if (!year_end) return;
            }
        }
    }

    renderFieldsUponMovieType();

})