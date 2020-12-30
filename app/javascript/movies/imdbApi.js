
export class imdbApi
{
    constructor ()
    {
        this.original_title = document.getElementById('movie_original_title');
        this.original_title.addEventListener('blur', (e) => {
            return this.imdbApiSearch(e.target.value);
        })
    }

    imdbApiSearch (value)
    {
        const data = null;
        const xhr = new XMLHttpRequest();
        // fix this credentials!!!:
        // xhr.withCredentials = true;

        let posters_container = document.getElementById('posters-container');
        let year_start = document.getElementById('year-start');
        let year_end = document.getElementById('year-end');
        let instruction_container = document.getElementById('instruction-container');
        posters_container.innerHTML = '';

        xhr.addEventListener("readystatechange", function () {
            if (this.readyState === this.DONE) {
                instruction_container.classList.add('d-block');
                instruction_container.innerText =
                    "1. Find the right poster \n " +
                    "2. Right-click the poster and save it to your machine \n" +
                    "3. Click on 'Select new poster' button and upload saved poster";
                posters_container.classList.remove('d-none');
                posters_container.classList.add('d-flex');
                let result = this.responseText
                let resultObject = JSON.parse(result);
                let resultObjectSearch = resultObject["Search"];

                for (let x in resultObjectSearch) {

                    let figcaptionTag = document.createElement("figcaption");
                    figcaptionTag.innerText = resultObjectSearch[x].Title;
                    let imageTag = document.createElement("img");
                    imageTag.src = resultObjectSearch[x].Poster;
                    let figureTag = document.createElement("figure");
                    let linkTag = document.createElement("a");
                    linkTag.classList.add('poster-link-container');
                    linkTag.href = "#";
                    // linkTag.download = resultObjectSearch[x].Poster;
                    linkTag.addEventListener('contextmenu', (e) => {
                        year_start.value = '';
                        year_end.value = '';
                        const yearValue = resultObjectSearch[x].Year;

                        if (yearValue.length === 4) {
                            year_start.value = yearValue;
                        } else {
                            const years = yearValue.split(/[^0-9]/);
                            year_start.value = years[0];
                            if (years[1] !== "") {
                                year_end.value = years[1];
                            }
                        }
                    });
                    figureTag.classList.add('poster-figure');
                    imageTag.classList.add('poster-image');
                    figcaptionTag.classList.add('poster-figcaption');
                    figureTag.appendChild(imageTag);
                    figureTag.appendChild(figcaptionTag);
                    linkTag.appendChild(figureTag);
                    posters_container.appendChild(linkTag);
                }
            }
        });

        xhr.open("GET", "https://movie-database-imdb-alternative.p.rapidapi.com/?s=" + value + "&page=1&r=json");
        xhr.setRequestHeader("x-rapidapi-key", "f1dffc67bdmshdce78cd180c6ca6p1f84b0jsn6ce198219dce");
        xhr.setRequestHeader("x-rapidapi-host", "movie-database-imdb-alternative.p.rapidapi.com");
        xhr.send(data);
    }

}