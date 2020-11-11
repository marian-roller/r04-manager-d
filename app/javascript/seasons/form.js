function removeField() {
    document.body.addEventListener("click", (e) => {

        if ( e.target.nodeName === "A" && e.target.parentNode.previousElementSibling) {
            /* to prevent from removing the first fieldset as it's previous sibling is null */
            e.target.parentNode.remove();
        }
    });
}

const addBook = ()=> {
    const createButton = document.getElementById("addBook");
    createButton.addEventListener("click", () => {
        // let items = document.querySelectorAll("#fieldsetContainer fieldset").length;
        // console.log(items);
        const lastId = document.querySelector("#fieldsetContainer fieldset:last-of-type").id;
        const newId = parseInt(lastId, 10) + 1;
        // const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g, newId);
        const newFieldset = document.querySelector('#fieldsetContainer fieldset:first-of-type').outerHTML.replace(/0/g, newId);

        // const newFieldset1 = document.querySelector("#fieldsetContainer fieldset:first-of-type");
        // console.log(newFieldset1);

        document.querySelector("#fieldsetContainer").insertAdjacentHTML(
        "beforeend", newFieldset
        );
        // items = document.querySelectorAll("#fieldsetContainer fieldset").length;
        // console.log(items);
    });
}
export { addBook }

document.addEventListener('turbolinks:load', () => {

    if (document.querySelector('#fieldsetContainer')) {
        addBook()
    }
    removeField();
})