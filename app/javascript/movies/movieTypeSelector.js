export class MovieTypeSelector {

    constructor() {
        this.type = document.getElementById('movie_movie_type');
        this.year_start = document.getElementById('year-start-field-group');
        this.year_end = document.getElementById('year-end-field-group');
        this.movie_type_selector = document.getElementById('movie_movie_type');
        this.year_end_height = this.year_end.offsetHeight;
        this.renderFieldsUponMovieType();
        this.movie_type_selector.addEventListener('change', (e) => {
            return this.renderFiledsUponMovieTypeChange(e.target.value);
        })

    }

    // render onchange selector
    renderFiledsUponMovieTypeChange (value) {
        if ( !this.renderFieldsUponMovieType() ) {
            // this.year_end.style.height = "0px";
            this.year_end.classList.remove('d-none');
            // const id = setInterval(this.frame, 50);
            // this.year_end.style.background = "yellow";
            // this.year_end.style.height = this.year_end_height + "px";
            // console.log(this.year_end.offsetHeight);
            this.year_start.childNodes[1].innerText = "Year Start";
        }
    }

    // frame() {
    //     let h = 0;
    //     if (h == 61) {
    //         clearInterval(id);
    //     } else {
    //         h++;
    //         this.year_end.style.height = h + 'px';
    //     }
    // }

    // render onload form
    renderFieldsUponMovieType() {
        if (this.type.value != 2) {
            this.year_end.classList.add('d-none');
            this.year_start.childNodes[1].innerText = "Year";
            return true;
        }
    }
}

