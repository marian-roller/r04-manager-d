import { imdbApi } from "./imdbApi";

/**
 * Class handles form state depending on movie type selector state
 */
export class MovieTypeSelector
{
    /**
     * Sets necessary variables and adds event to movie type selector dropdown
     */
    constructor ()
    {
        this.year_start = document.getElementById('year-start-field-group');
        this.year_end = document.getElementById('year-end-field-group');
        this.movie_type_selector = document.getElementById('movie_movie_type');
        this.duration = document.getElementById('duration-field-group');
        this.seasons = document.getElementById('seasons-container');
        this.renderFieldsUponMovieType();
        this.movie_type_selector.addEventListener('change', (e) => {
            return this.renderFiledsUponMovieTypeChange();
        })
        new imdbApi();
    }

    /**
     * Displays form fields depending on chosen movie type
     */
    renderFiledsUponMovieTypeChange ()
    {
        if (!this.renderFieldsUponMovieType()) {

            // prevents deleting first season as onload checkbox state is 1
            let destroyInputs = this.seasons.querySelectorAll('input[type=hidden]');
            for (let i = 0; i < destroyInputs.length; i++ ) {
                destroyInputs[i].value = 0;
            }
            this.seasons.classList.remove('input-wrapper-closed');
            this.seasons.classList.add('input-wrapper-open');
            this.year_end.classList.remove('input-wrapper-closed');
            this.year_end.classList.add('input-wrapper-open');
            this.year_start.childNodes[1].innerText = "Year Start";
            this.duration.childNodes[1].innerText = "Episode duration (minutes)";
        }
    }

    /**
     * renders default form state onload
     * @returns {boolean}
     */
    renderFieldsUponMovieType ()
    {
        // if not tvserie
        if (this.movie_type_selector.value !== '2') {

            let destroyInputs = this.seasons.querySelectorAll('input[type=hidden]');

            for (let i = 0; i < destroyInputs.length; i++ ) {
                destroyInputs[i].value = 1;
            }

            this.seasons.classList.remove('input-wrapper-open');
            this.seasons.classList.add('input-wrapper-closed');
            this.year_end.classList.remove('input-wrapper-open');
            this.year_end.classList.add('input-wrapper-closed');
            this.year_start.childNodes[1].innerText = "Year";
            this.duration.childNodes[1].innerText = "Duration (minutes)";
            this.year_end.childNodes[3].value = "";
            return true;
        }
    }
}

