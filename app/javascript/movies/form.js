import { MovieTypeSelector } from "./movieTypeSelector";

document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('movie-form')) {
        new MovieTypeSelector;
    }

})