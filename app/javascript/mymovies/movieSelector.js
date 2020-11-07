export class MovieSelector {

    constructor () {
        this.movie = document.getElementById('mymovie_movie_id');
        this.watching_end = document.getElementById('watching-end-field-group');
        this.watching_season = document.getElementById('watching-season-field-group');
        this.last_episode = document.getElementById('last-episode-field-group');
        this.renderFieldsUponSelectedMovieType();
        this.movie.addEventListener('change', (e) => {
            return this.renderFiledsUponSelectedMovieTypeChange(e.target.value);
        })
    }

    renderFiledsUponSelectedMovieTypeChange(value) {
        if (!this.renderFieldsUponSelectedMovieType()) {
            this.watching_end.classList.remove('input-wrapper-open');
            this.watching_end.classList.add('input-wrapper-closed');
            this.watching_season.classList.remove('input-wrapper-open');
            this.watching_season.classList.add('input-wrapper-closed');
            this.last_episode.classList.remove('input-wrapper-open');
            this.last_episode.classList.add('input-wrapper-closed');
        }
    }

    renderFieldsUponSelectedMovieType() {
        if (this.movie.value == 47) {
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