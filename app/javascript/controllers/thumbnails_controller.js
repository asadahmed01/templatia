import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="thumbnails"
export default class extends Controller {
  static targets = ["image"]

  connect() {
  }

  select(event) {
    // Remove the active class from all thumbnails
    this.imageTargets.forEach((element) => {
      element.classList.remove('border', 'border-dark')
    });
    // Add the active class to the clicked thumbnail
    const clickedImage = event.currentTarget.querySelector('img');
    if (clickedImage) {
      clickedImage.classList.add('border', 'border-dark');
    }
  }
}
