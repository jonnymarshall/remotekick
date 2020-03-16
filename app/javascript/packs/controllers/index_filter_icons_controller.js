import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "index_filter_icons_controller"

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
        self.setFilterValue(el.name, el.value, self)
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
        if (el.parentElement.getAttribute("for").slice(0,-2) == key) {
          if ((this.filterValues[key] != null) && (el.parentElement.getAttribute("for").slice(-1) <= this.filterValues[key])) {
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
    let filterTypeClicked = event.currentTarget.getAttribute("for").slice(0,-2)
    let valueClicked = event.currentTarget.getAttribute("for").slice(-1)
    this.setFilterValue(filterTypeClicked, valueClicked, this)
    this.iconStateChange()
  }
}