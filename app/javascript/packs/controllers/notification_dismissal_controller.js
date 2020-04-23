import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "notification_dismissal_controller"

  static targets = ["dismissButton"]

  connect() {
    console.log(`${this.controllerName} connected.`)
    console.log(this.dismissButtonTargets)

  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  dismissNotification(e) {
    e.target.parentNode.remove();
  }
}