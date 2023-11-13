import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="word"
export default class extends Controller {
  connect() {
    console.log('connected to word controller');
  }
}
