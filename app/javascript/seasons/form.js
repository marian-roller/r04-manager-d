const addBook = ()=> {
    const createButton = document.getElementById("addBook");
    createButton.addEventListener("click", () => {

        const lastId = document.querySelector("#fieldsetContainer").lastElementChild.id;

        const newId = parseInt(lastId, 10) + 1;

        const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g,newId);

        document.querySelector("#fieldsetContainer").insertAdjacentHTML(
        "beforeend", newFieldset
        );
    });
}
export { addBook }

document.addEventListener('turbolinks:load', () => {


    if (document.querySelector('#fieldsetContainer')) {
        addBook()
    }

})