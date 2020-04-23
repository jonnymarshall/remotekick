import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "index_cards_ordering_controller"

  static targets = ["option", "path"]

  url = this.pathTarget.dataset.url

  // Gets the element which has data-selected="true" (boolean value is embedded based on params)

  connect() {
    console.log(`${this.controllerName} connected.`)
    console.log(this.pathTarget.dataset.url)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  // Gets the data-url value from the selected option (embedded with url helper) & redirects
  goToUrl(event) {
    this.optionTargets.forEach(el => {
      if (el.value == event.target.value) {
        window.location.assign(el.dataset.url);
      }
    })
  }
}