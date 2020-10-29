export class MovieTypeSelector {

    constructor () {
        this.type = document.getElementById('movie_movie_type');
        this.year_start = document.getElementById('year-start-field-group');
        this.year_end = document.getElementById('year-end-field-group');
        this.movie_type_selector = document.getElementById('movie_movie_type');
        this.renderFieldsUponMovieType();
        this.movie_type_selector.addEventListener('change', (e) => {
            return this.renderFiledsUponMovieTypeChange(e.target.value);
        })
    }

    // render onchange selector
    renderFiledsUponMovieTypeChange (value) {
        if (!this.renderFieldsUponMovieType()) {
            this.year_end.classList.remove('input-wrapper-closed');
            this.year_end.classList.add('input-wrapper-open');
            this.year_start.childNodes[1].innerText = "Year Start";
        }
    }

    // render onload form
    renderFieldsUponMovieType () {
        // if not tvserie
        if (this.type.value != 2) {
            this.year_end.classList.remove('input-wrapper-open');
            this.year_end.classList.add('input-wrapper-closed');
            this.year_start.childNodes[1].innerText = "Year";
            this.year_end.childNodes[3].value = "";
            return true;
        }
    }
}

