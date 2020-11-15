/**
 * Class handles mymovie form state depending on chosen movie type
 */
export class MovieSelector {

    /**
     * Inititializes necessary variables, form state onload and add event to movie selector
     */
    constructor () {
        this.movie = document.getElementById('mymovie_movie_id');
        this.watching_end = document.getElementById('watching-end-field-group');
        this.watching_season = document.getElementById('watching-season-field-group');
        this.last_episode = document.getElementById('last-episode-field-group');
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
            this.watching_end.classList.remove('input-wrapper-open');
            this.watching_end.classList.add('input-wrapper-closed');
            this.watching_season.classList.remove('input-wrapper-open');
            this.watching_season.classList.add('input-wrapper-closed');
            this.last_episode.classList.remove('input-wrapper-open');
            this.last_episode.classList.add('input-wrapper-closed');
        }
    }

    /**
     * Renders initial form state onload
     * @returns {boolean}
     */
    renderFieldsUponSelectedMovieType() {

        // if tvserie
        if (this.movie.options[this.movie.selectedIndex].getAttribute('data-type') === '2') {
            this.watching_end.classList.remove('input-wrapper-closed');
            this.watching_end.classList.add('input-wrapper-open');
            this.watching_season.classList.remove('input-wrapper-closed');
            this.watching_season.classList.add('input-wrapper-open');
            this.last_episode.classList.remove('input-wrapper-closed');
            this.last_episode.classList.add('input-wrapper-open');
            return true;
        }
    }
}