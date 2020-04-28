import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "algolia_places_controller"

  static targets = ["addressInput"]

  baseURL = null
  searchQuery = null

  connect() {
    console.log(`${this.controllerName} connected.`)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  makeRequest(e) {
    this.baseURL = e.target.dataset.requestPath
    this.searchQuery = e.target.value
    this.executeAjaxRequest()
  }

  async executeAjaxRequest() {
    let self = this
    let urlString = `${this.baseURL}?query=${this.searchQuery}`

    await fetch(urlString, { headers: { accept: "application/json" } })
      .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data);
      })
  }
}