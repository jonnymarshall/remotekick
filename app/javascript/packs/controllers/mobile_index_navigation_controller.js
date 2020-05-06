import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "mobile_index_navigation_controller"

  static targets = ["indexFilters", "map", "venuesList", "indexRightSection"]

  currentView = map
  elements = [this.indexFiltersTarget, this.mapTarget, this.venuesListTarget]
  currentView = "map"

  connect() {
    console.log(`${this.controllerName} connected.`)
    document.body.classList.add('has-navbar-fixed-bottom')
    document.body.classList.add('has-locked-scrolling-touch')
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  handleClick(e) {
    let elementClicked = e.currentTarget.dataset.element
    this.screenLockHandler(elementClicked)
    this.rightSectionDisplayHandler(elementClicked)
    this.toggleView(elementClicked)
  }
  
  screenLockHandler(elementClicked) {
    if (elementClicked === "map") {
      document.body.classList.add('has-locked-scrolling-touch')
    } else {
      document.body.classList.remove('has-locked-scrolling-touch')
    }
  }

  rightSectionDisplayHandler(elementClicked) {
    if (elementClicked === "indexFilters") {
      this.indexRightSectionTarget.classList.add('is-hidden-touch')
    } else {
      this.indexRightSectionTarget.classList.remove('is-hidden-touch')
    }
  }

  toggleView(viewToToggleOn) {
    this.elements.forEach((el) => {
      el.classList.add('is-hidden-touch')
      if (el.dataset.target.split('.')[1] === viewToToggleOn)
        el.classList.remove('is-hidden-touch');
    })
  }
}