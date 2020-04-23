import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "icon_state_controller"

  static targets = ["icon", "input"]

  // Hash of filter values.
  // Initialised by getCheckedInputs() on page load
  // Updated with setFilterValue() when label is clicked
  filterValues = {
    rating: null,
    plug_sockets: null,
    comfort: null,
    busyness: null
  }

  // Updates filterValues when a label is clicked
  setFilterValue = (filterType, value, self) => {
    self.filterValues[filterType] = value
  }

  // Checks for which icons should be styled based on input checked state on page load
  getCheckedInputs = () => {
    let self = this
    this.inputTargets.forEach(el => {
      if (el.getAttribute("checked")) {
        self.setFilterValue(el.getAttribute('data-filterType'), el.value, self)
      }
    })
  }

  // Removes active styling of all icons
  resetIcons = () => {
    this.iconTargets.forEach((el) => {
      el.classList.remove("has-text-primary")
    })
  }

  // Styles icons based on filterValues
  iconStateChange = () => {
    this.resetIcons()
    for (var key of Object.keys(this.filterValues)) {
      this.iconTargets.forEach((el) => {
        if (el.parentElement.previousElementSibling.getAttribute('data-filterType') == key) {
          if ((this.filterValues[key] != null) && (el.parentElement.previousElementSibling.value <= this.filterValues[key])) {
            el.classList.add("has-text-primary")
          }
        }
      })
    }
  }

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.getCheckedInputs()
    this.iconStateChange()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  selectIcons(event) {
    let filterTypeClicked = event.currentTarget.previousElementSibling.getAttribute('data-filterType')
    let valueClicked = event.currentTarget.previousElementSibling.value
    this.setFilterValue(filterTypeClicked, valueClicked, this)
    this.iconStateChange()
  }
}