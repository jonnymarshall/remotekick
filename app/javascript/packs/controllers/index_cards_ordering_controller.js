import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "index_cards_ordering_controller"

  static targets = ["orderByOption"]

  // Gets the element which has data-selected="true" (boolean value is embedded based on params)
  selectInitialOption = () => {
    this.orderByOptionTargets.forEach(el => {
      if (el.dataset.selected == "true") {
        el.setAttribute('selected', 'selected');
      }
    })
  }

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.selectInitialOption()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  // Gets the data-url value from the selected option (embedded with url helper) & redirects
  goToUrl(event) {
    this.orderByOptionTargets.forEach(el => {
      if (el.value == event.target.value) {
        window.location.assign(el.dataset.url);
      }
    })
  }
}