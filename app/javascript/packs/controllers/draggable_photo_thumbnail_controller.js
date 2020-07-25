import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "draggable_photo_thumbnail_controller"

  static targets = ["draggable"]

  connect() {
    console.log(`${this.controllerName} connected.`)
    console.log(this.targets)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  dragStart(e) {
    console.log(e)
    e.target.classList.add('dragging')
  }

  dragEnd(e) {
    console.log(e)
    e.target.classList.remove('dragging')
  }

  dragOver(e) {
    console.log(e.target)
    const draggable = document.querySelector(".dragging")
    e.target.appendChild(draggable)
  }

}