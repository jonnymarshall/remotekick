import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "tags_controller"

  static targets = ["tag"]

  connect() {
    console.log(`${this.controllerName} connected.`)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  activateTag(e) {
    const tagIsActive = () => {
      return e.target.classList.contains("is-primary")
    }
    if (!tagIsActive()) {
      e.target.insertAdjacentHTML("beforeend", '<button class="delete is-small" data-action="tags#deactivateTag"></button>');
    } else {
      e.target.removeChild(e.target.lastElementChild);
    }
    e.target.classList.toggle("is-primary")
  }

  deactivateTag(e) {
    console.log('did ya remove?')
    e.target.parentElement.classList.remove("is-primary")
    e.target.remove()
  }

}