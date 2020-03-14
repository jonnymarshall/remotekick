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

  iconStateChange = (inputs) => {
    for (var key of Object.keys(inputs)) {
      this.iconTargets.forEach((el) => {
        if (el.parentElement.getAttribute("for").slice(0,-2) == key) {
          el.classList.remove("has-text-primary")
          if (el.parentElement.getAttribute("for").slice(-1) <= inputs[key]) {
            el.classList.add("has-text-primary")
          }
        }
      })  
    }
  }

  connect() {
    console.log("Connected")

    this.checkedInputState().forEach((filter) => {
      this.iconStateChange(filter)
    })
  }

  disconnect() {
    console.log("Disconnected:")
  }

  selecticons(event) {
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