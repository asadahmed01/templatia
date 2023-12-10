import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="redirect-success"
export default class extends Controller {
  static targets = ['countdown']
  static values = {redirectUrl: String}
  connect() {
    this.startCountdown()
  }

  startCountdown() {
    let countdown = 10

    const interval = setInterval(() => {
      countdown--
      this.countdownTarget.textContent = `Redirecting you in ${countdown} seconds`

      if (countdown <= 0) {
        clearInterval(interval)
        window.location.replace(this.redirectUrlValue)
      }
    }, 1000)
  }
}
