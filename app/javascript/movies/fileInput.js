export class FileInput {

    constructor() {
        this.posterFileInput = document.getElementById("movie_image");
        this.previewImageContainer = document.getElementById('preview-image-container');
        this.existingImage = document.getElementById("existing-image");
        this.removePosterFieldGroup = document.getElementById("remove-poster-field-group");
        this.posterFileInput.addEventListener('change', (e) => {
            return this.handlePreviewImage(e);
        })
        console.log(this.removePosterFieldGroup);
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
    }
}