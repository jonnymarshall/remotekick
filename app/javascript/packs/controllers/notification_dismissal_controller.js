import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "notification_dismissal_controller"

  connect() {
    console.log(`${this.controllerName} connected.`)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  dismissNotification(e) {
    e.target.parentNode.remove();
  }
}