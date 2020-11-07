export class MovieTypeSelector {

    constructor () {
        this.year_start = document.getElementById('year-start-field-group');
        this.year_end = document.getElementById('year-end-field-group');
        this.movie_type_selector = document.getElementById('movie_movie_type');
        this.duration = document.getElementById('duration-field-group');
        this.renderFieldsUponMovieType();
        this.movie_type_selector.addEventListener('change', (e) => {
            return this.renderFiledsUponMovieTypeChange();
        })
    }

    // render onchange selector
    renderFiledsUponMovieTypeChange () {
        if (!this.renderFieldsUponMovieType()) {
            this.year_end.classList.remove('input-wrapper-closed');
            this.year_end.classList.add('input-wrapper-open');
            this.year_start.childNodes[1].innerText = "Year Start";
            this.duration.childNodes[1].innerText = "Episode duration (minutes)";
        }
    }

    // render onload form
    renderFieldsUponMovieType () {
        // if not tvserie
        if (this.movie_type_selector.value != 2) {
            this.year_end.classList.remove('input-wrapper-open');
            this.year_end.classList.add('input-wrapper-closed');
            this.year_start.childNodes[1].innerText = "Year";
            this.duration.childNodes[1].innerText = "Duration (minutes)";
            this.year_end.childNodes[3].value = "";
            return true;
        }
    }
}

