import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "homepage_search_position_controller"

  static targets = ["centralContainer", "resultsContainer"]

  connect() {
    console.log(`${this.controllerName} connected.`)

    self = this
    const interval = setInterval(function() {
      self.adjustContentPlacement()
    }, 500);
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  adjustContentPlacement() {
    if (!this.resultsContainerTarget.firstElementChild) {
      this.centralContainerTarget.style.marginBottom = "0px";
    } else {
      this.centralContainerTarget.style.marginBottom = "250px";
    }
  }
}