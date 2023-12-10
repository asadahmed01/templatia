import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="stripe-checkout"
export default class extends Controller {

  static values = {publishableKey: String, url: String}

  async connect() {
    const spinner = document.getElementById('checkout-spinner')
    this.showSpinner(spinner)
    const stripe = Stripe(this.publishableKeyValue)
    
    const response = await post(this.urlValue)
    const {clientSecret} = await response.response.json()  
    const checkout = await stripe.initEmbeddedCheckout({
      clientSecret,
    })
  
    // Mount Checkout
    checkout.mount(this.element)
    this.hideSpinner(spinner)
  }

  showSpinner(spinner) {
    spinner.classList.remove('d-none')
  }

  // Define a method to hide the spinner
  hideSpinner(spinner) {
    spinner.classList.add('d-none')
  }
}
