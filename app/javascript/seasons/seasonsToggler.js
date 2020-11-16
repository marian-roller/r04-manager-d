/**
 * Class handles dynamic rendering of seasons fieldsets in movie form
 */
export class seasonsToggler {

    /**
     * Inititialize necessary variables and actions to toggle seasons onload movie form page
     */
    constructor () {
        this.formPage = document.getElementById("movies-form-page");

        const createButton = document.getElementById("addSeason");
        createButton.addEventListener("click", (e) => {
            return this.addSeason();
        })
        this.removeSeason();
        this.setNumberToFirstSeason();
        this.hideDeleteButtons();
    }

    /**
     * Add new season fieldset and sets necessary attributes and values
     */
    addSeason () {
        this.hideDeleteButtons();
        // preparing new record number from last fieldset id
        const lastId = document.querySelector("#fieldsetContainer fieldset:last-of-type").id;
        const newId = parseInt(lastId, 10) + 1;

        // generate new item to insert
        const newFieldset = document.querySelector('#fieldsetContainer fieldset:first-of-type').outerHTML.replace(/0/g, newId);

        // don't create new item if any previously hidden exists in DOM
        const createNewItem = this.handleFieldsetsDisplay();

        if (createNewItem) {
            // insert new item
            document.querySelector("#fieldsetContainer").insertAdjacentHTML("beforeend", newFieldset );
            // setting proper values of new item
            let lastAfterInsert = document.querySelector("#fieldsetContainer fieldset:last-of-type");
            lastAfterInsert.getElementsByTagName('input')[0].value = parseInt(newId) + 1;
            lastAfterInsert.getElementsByTagName('input')[1].value = '';
            lastAfterInsert.getElementsByTagName('input')[2].value = 0;
            lastAfterInsert.querySelector(".remove-season-button").classList.remove('d-none');
            lastAfterInsert.querySelector(".remove-season-button").classList.add('d-block');
        }
    }

    /**
     * Activates event on 'delete season' button
     */
    removeSeason () {
        // run only on movie form view
        if (this.formPage) {
            this.formPage.addEventListener("click", (e) => {

                if ( e.target.nodeName === "A" && e.target.parentNode.previousElementSibling) {
                    e.target.parentNode.classList.add('d-none');
                    // enable deleting record - set value '1' on destroy hidden checkbox
                    e.target.nextElementSibling.value = 1;
                }

                this.hideDeleteButtons();
            });
        }
    }


    /**
     * Displays first previously hidden fieldset and returns false if any or true if not
     * @returns {boolean}
     */
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

    /**
     * Sets number of the first season if empty
     */
    setNumberToFirstSeason () {
        let fieldsets = document.querySelectorAll('#fieldsetContainer fieldset');
        if (fieldsets) {
            if (fieldsets[0].querySelector('input').value === '') {
                fieldsets[0].querySelector('input').value = '1';
            }
        }
    }

    /**
     * Display delete button only for the last displayed season fieldset
     */
    hideDeleteButtons () {
        let fieldsets = document.querySelectorAll('#fieldsetContainer fieldset');
        var displayedFieldsets = [];

        if ( fieldsets ) {

            for (let i = 0; i < fieldsets.length; i++) {

                // always hide delete button in the first season fieldset
                if (i === 0) {
                    fieldsets[i].querySelector(".remove-season-button").classList.remove('d-block');
                    fieldsets[i].querySelector(".remove-season-button").classList.add('d-none');
                }

                // make an array of all displayed seasons fieldsets except first one
                if ( !fieldsets[i].classList.contains('d-none') && i !== 0 ) {
                    displayedFieldsets.push(fieldsets[i]);
                }
            }

            // handles display of the only delete button in seasons container
            for (let i = 0; i < displayedFieldsets.length; i++) {
                if (i === displayedFieldsets.length - 1) {
                    displayedFieldsets[i].querySelector(".remove-season-button").classList.remove('d-none');
                    displayedFieldsets[i].querySelector(".remove-season-button").classList.add('d-block');
                } else {
                    displayedFieldsets[i].querySelector(".remove-season-button").classList.remove('d-block');
                    displayedFieldsets[i].querySelector(".remove-season-button").classList.add('d-none');
                }
            }
        }
    }
}