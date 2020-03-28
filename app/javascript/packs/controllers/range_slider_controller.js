import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "range_slider"

  static targets = ["range", "number"]

  // Gets the element which has data-selected="true" (boolean value is embedded based on params)

  connect() {
    console.log(`${this.controllerName} connected.`)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  // Gets the data-url value from the selected option (embedded with url helper) & redirects
  sliderHandler(e) {
    this.numberTargets[0].value = parseFloat(this.rangeTarget.value);
  }

  numberHandler(e) {
    this.rangeTarget.value = parseFloat(this.numberTargets[0].value);
  }
}