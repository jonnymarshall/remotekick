import { Controller } from "stimulus"

export default class extends Controller {
  // your logic (controller actions)

  static targets = ["icon", "value"]

  connect() {
    console.log("Connected")
  }

  getval(event) {
    console.log(event.target)
  }

  // select() {
  //   this.iconTargets.forEach((el, i) => {
  //     if (el.value == i) {
  //       console.log(el)
  //     }
  //   })
  // }

  disconnect() {
    console.log("Disconnected:")
  }
}