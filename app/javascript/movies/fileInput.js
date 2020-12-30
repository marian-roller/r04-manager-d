export class FileInput {

    constructor() {
        this.posterFileInput = document.getElementById("movie_image");
        this.previewImageContainer = document.getElementById('preview-image-container');
        this.existingImage = document.getElementById("existing-image");
        this.removePosterFieldGroup = document.getElementById("remove-poster-field-group");
        this.posters_container = document.getElementById('posters-container');
        this.instruction_container = document.getElementById('instruction-container');
        this.posterFileInput.addEventListener('change', (e) => {
            return this.handlePreviewImage(e);
        })
    }

    handlePreviewImage (e)
    {
        const tmppath = URL.createObjectURL(e.target.files[0]);
        let image = document.createElement("img");
        image.classList.add('w-75');
        image.src = tmppath;
        if (this.previewImageContainer.querySelector("img")) {
            let previouslySelectedImage = this.previewImageContainer.querySelector("img");
            previouslySelectedImage.remove();
        }
        this.previewImageContainer.appendChild(image);
        if (this.existingImage) {
            this.existingImage.classList.add('d-none');
            this.removePosterFieldGroup.classList.add('d-none');
        }
        this.posters_container.classList.remove('d-flex');
        this.posters_container.classList.add('d-none');
        this.posters_container.innerHTML = '';
        this.instruction_container.innerText = "";
        this.instruction_container.classList.remove('d-block');
        this.instruction_container.classList.add('d-none');

    }
}