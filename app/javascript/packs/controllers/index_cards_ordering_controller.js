import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["ordertype"]

  selectInitialOption = () => {
    console.log("entered selectinitialoption")
    this.ordertypeTargets.forEach(el => {
      if (el.dataset.selected == "true") {
        el.setAttribute('selected', 'selected');
      }
    })
  }

  connect() {
    console.log("index_cards_ordering_controller Connected")
    this.selectInitialOption()
  }

  disconnect() {
    console.log("Disconnected:")
  }

  url(event) {
    console.log("click reigstered")
    console.log(event.target.value)
    this.ordertypeTargets.forEach(el => {
      if (el.value == event.target.value) {
        window.location.assign(el.dataset.url);
      }
    })
  }
}