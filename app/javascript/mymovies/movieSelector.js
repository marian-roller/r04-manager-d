/**
 * Class handles mymovie form state depending on chosen movie type
 */
export class MovieSelector {

    /**
     * Inititializes necessary variables, form state onload and add event to movie selector
     */
    constructor () {
        this.movie = document.getElementById('mymovie_movie_id');
        this.watching_start = document.getElementById('watching-start-field-group');
        this.watching_end = document.getElementById('watching-end-field-group');
        this.watching_end_label = document.getElementById('watching-end-label');
        this.renderFieldsUponSelectedMovieType();
        this.renderFiledsUponSelectedMovieTypeChange();
        this.movie.addEventListener('change', (e) => {
            return this.renderFiledsUponSelectedMovieTypeChange();
        })
    }

    /**
     * Handles movie selector change event
     */
    renderFiledsUponSelectedMovieTypeChange() {

        // only if not tvserie
        if (!this.renderFieldsUponSelectedMovieType()) {
            this.watching_start.classList.remove('input-wrapper-open');
            this.watching_start.classList.add('input-wrapper-closed');
            this.watching_end_label.innerText = "Watched at";
        }
    }

    /**
     * Renders initial form state onload
     * @returns {boolean}
     */
    renderFieldsUponSelectedMovieType() {

        // if tvserie
        if (this.movie.options[this.movie.selectedIndex].getAttribute('data-type') === '2') {
            this.watching_start.classList.remove('input-wrapper-closed');
            this.watching_start.classList.add('input-wrapper-open');
            this.watching_end_label.innerText = "Watching end";
            return true;
        }
    }
}