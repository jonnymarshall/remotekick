import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "index_cards_ordering_controller"

  static targets = ["option", "path"]

  url = this.pathTarget.dataset.url

  // Gets the element which has data-selected="true" (boolean value is embedded based on params)

  connect() {
    console.log(`${this.controllerName} connected.`)
    // this.executeAjaxRequest()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  // Gets the data-url value from the selected option (embedded with url helper) & redirects
  goToUrl(event) {
    self = this
    this.optionTargets.forEach(el => {
      if (el.value == event.target.value) {
        console.log("got hereeeee")
        // window.location.assign(el.dataset.url)
        self.executeAjaxRequest(el.dataset.url)
      }
    })
  }
  
  async executeAjaxRequest(url) {
    console.log("url", url)
    await fetch(url, { headers: { accept: "application/json" } })
      .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data);
      })
  }
}