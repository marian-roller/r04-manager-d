import { MovieTypeSelector } from "./movieTypeSelector";
import { FileInput } from "./fileInput";

document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('movie-form')) {
        new MovieTypeSelector;
        new FileInput;
    }
})