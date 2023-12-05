import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["alert"]

    connect() {
        this.hideAfterTimeout();
      }
    
      hideAfterTimeout() {
        const container = this.alertTarget;
        const timeout = 3000
    
        setTimeout(() => {
          container.classList.add("d-none");
        }, timeout);
      }
    
}