/*
Class handles dynamic rendering of seasons fieldsets in movie form
 */
export class seasonsToggler {

    constructor () {
        this.formPage = document.getElementById("movies-form-page");

        const createButton = document.getElementById("addSeason");
        createButton.addEventListener("click", (e) => {
            return this.addSeason();
        })
        this.removeSeason();
    }

    addSeason () {
        // preparing new record number from last fieldset id
        const lastId = document.querySelector("#fieldsetContainer fieldset:last-of-type").id;
        const newId = parseInt(lastId, 10) + 1;

        // generate new item to insert
        const newFieldset = document.querySelector('#fieldsetContainer fieldset:first-of-type').outerHTML.replace(/0/g, newId);

        const createNewItem = this.handleFieldsetsDisplay();

        if (createNewItem) {
            // insert new item
            document.querySelector("#fieldsetContainer").insertAdjacentHTML("beforeend", newFieldset );
            // setting proper values of new item
            let lastAfterInsert = document.querySelector("#fieldsetContainer fieldset:last-of-type");
            lastAfterInsert.getElementsByTagName('input')[0].value = parseInt(newId) + 1;
            lastAfterInsert.getElementsByTagName('input')[1].value = '';
            lastAfterInsert.getElementsByTagName('input')[2].value = 0;
        }
    }

    removeSeason () {
        // run only on movie form view
        if (this.formPage) {
            this.formPage.addEventListener("click", (e) => {

                if ( e.target.nodeName === "A" && e.target.parentNode.previousElementSibling) {
                    e.target.parentNode.classList.add('d-none');
                    // enable deleting record - set value '1' on destroy checkbox
                    e.target.nextElementSibling.value = 1;
                }

            });
        }
    }

    handleFieldsetsDisplay () {
        let fieldsets = document.querySelectorAll('#fieldsetContainer fieldset');
        let flag = true;
        fieldsets.forEach( (element) => {
            if (element.classList.contains('d-none')) {
                if (flag) {
                    // Instead of creating new Item display first hidden one
                    element.classList.remove('d-none');
                    flag = false;
                } else {
                    return;
                }
            }
        });
        return flag;
    }
}