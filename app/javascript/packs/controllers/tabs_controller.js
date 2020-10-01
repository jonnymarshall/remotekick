import { Controller } from "stimulus";

export default class extends Controller {
  controllerName = "tabs_controller";

  static targets = ["tab"];

  connect() {
    console.log(`${this.controllerName} connected.`);
    console.log(this.tabTargets[0]);
    this.tabTargets[0].classList.add("is-active");
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`);
  }

  toggleTab(e) {
    this.tabTargets.forEach((tab) => tab.classList.remove("is-active"));
    const tabElement = e.target.parentElement;
    tabElement.classList.add("is-active");
  }
}
