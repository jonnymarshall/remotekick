import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["star", "smilie"]

  connect() {
    console.log("Connected")
  }
  disconnect() {
    console.log("Disconnected:")
  }

  // Logic for selecting and deselecting rating stars up to current selected value
  selectstars(event) {
  // Event triggered on label click
    // Gets value of hidden input element
    let valueClicked = event.currentTarget.previousElementSibling.value

    // Removes active class from all stars and adds it on stars whose index <= value clicked
    this.starTargets.forEach((el, index) => {
      el.classList.remove("has-text-primary")
      if (index <= valueClicked) {
        el.classList.add("has-text-primary")
      }
    })
  }

  // Logic for selecting and deselecting smilie icons up to current selected value
  selectsmilies(event) {
  // Event triggered on label click
    // Gets laber "for" attribute (full ID of target input element)
    let targetInputId = event.currentTarget.getAttribute("for")
    // Removes the paired value (_val) to get the filter type
    let filterType = targetInputId.slice(0,-2)
    // Gets value of hidden input element
    let valueClicked = event.currentTarget.previousElementSibling.value

    // Removes active class from all smilies and adds it on smilies whose value <= value clicked
    this.smilieTargets.forEach((el) => {
      if (el.getAttribute("for") == filterType) {
        el.classList.remove("has-text-primary")
        if (el.getAttribute("value") <= valueClicked) {
          el.classList.add("has-text-primary")
        }
      }
    })

  }

}