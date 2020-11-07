import { MovieSelector } from "./movieSelector";

document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('mymovie-form')) {
        new MovieSelector;
    }
})