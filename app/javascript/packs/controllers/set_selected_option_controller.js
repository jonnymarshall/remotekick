import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "set_selected_option_controller"

  static targets = ["option"]

  // Gets the element which has data-selected="true" (boolean value is embedded based on params)
  setSelectedOption = () => {
    this.optionTargets.forEach(el => {
      if (el.dataset.selected == "true") {
        el.setAttribute('selected', 'selected');
      }
    })
  }

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.setSelectedOption()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }
}