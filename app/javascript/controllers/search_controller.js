import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
  }
  submit(_event){
    this.element.requestSubmit();
  }
}
