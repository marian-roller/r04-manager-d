import { seasonsToggler } from "./seasonsToggler";

document.addEventListener('turbolinks:load', () => {

    if (document.querySelector('#fieldsetContainer')) {
        new seasonsToggler;
    }
})