import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["icon", "input"]

  // Filter type and value from click event
  filterTypeClicked
  valueClicked

  checkedInputState = () => {
    const inputs = []
    this.inputTargets.forEach((el, index) => {
      if (el.getAttribute("checked")) {
        let filterValuePair = {};
        filterValuePair[el.name] = el.value;
        inputs.push(filterValuePair);
      }
    })
    return inputs
  }

  connect() {
    console.log("Connected")
    // log initial input checked state
    console.log(this.checkedInputState())
  }

  disconnect() {
    console.log("Disconnected:")
  }

  // Logic for selecting and deselecting rating stars up to current selected value
  selecticons(event) {
    this.checkedInputState()
    this.filterTypeClicked = event.currentTarget.getAttribute("for").slice(0,-2)
    this.valueClicked = event.currentTarget.getAttribute("for").slice(-1)

    // Removes active class from all stars and adds it on stars whose index <= value clicked
    this.iconTargets.forEach((el, index) => {
      if (el.parentElement.getAttribute("for").slice(0,-2) == this.filterTypeClicked) {
        el.classList.remove("has-text-primary")
        if (el.parentElement.getAttribute("for").slice(-1) <= this.valueClicked) {
          el.classList.add("has-text-primary")
        }
      }
    })
  }
}