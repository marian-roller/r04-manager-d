function removeSeason() {

    // run only on movie form view
    if (document.getElementById("movies-form-page")) {

        const form = document.getElementById("movies-form-page");
        form.addEventListener("click", (e) => {

            // prevent from removing the first fieldset
            // if ( e.target.nodeName === "A" && e.target.parentNode.previousElementSibling) {
            if ( e.target.nodeName === "A" ) {
                e.target.parentNode.classList.add('d-none');
                // enable deleting record from db
                e.target.nextElementSibling.value = 1;
            }
        });
    }
}

const addSeason = ()=> {
    const createButton = document.getElementById("addSeason");
    createButton.addEventListener("click", () => {

        // preparing new record number from last fieldset id
        const lastId = document.querySelector("#fieldsetContainer fieldset:last-of-type").id;
        const newId = parseInt(lastId, 10) + 1;

        // generate new item to insert
        const newFieldset = document.querySelector('#fieldsetContainer fieldset:first-of-type').outerHTML.replace(/0/g, newId);

        let fieldsets = document.querySelectorAll('#fieldsetContainer fieldset');
        let flag = true;
        fieldsets.forEach( function (element, index) {
            if (element.classList.contains('d-none')) {
                if (flag) {
                    element.classList.remove('d-none');
                    flag = false;
                } else {
                    return;
                }
            }
        });

        if (flag) {
            // insert new item
            document.querySelector("#fieldsetContainer").insertAdjacentHTML(
                "beforeend", newFieldset
            );
            // setting proper values of new item
            let lastAfterInsert = document.querySelector("#fieldsetContainer fieldset:last-of-type");
            let firstAfterInsert = document.querySelector("#fieldsetContainer fieldset:first-of-type");
            lastAfterInsert.getElementsByTagName('input')[0].value = parseInt(newId) + 1;
            lastAfterInsert.getElementsByTagName('input')[1].value = '';
            lastAfterInsert.getElementsByTagName('input')[2].value = 0;
        }
    });
}
export { addSeason }

document.addEventListener('turbolinks:load', () => {

    if (document.querySelector('#fieldsetContainer')) {
        addSeason();
    }
    removeSeason();
})