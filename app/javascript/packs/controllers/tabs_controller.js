import { Controller } from "stimulus";

export default class extends Controller {
  controllerName = "tabs_controller";

  static targets = ["tab", "contentSection"];

  connect() {
    console.log(`${this.controllerName} connected.`);
    this.tabTargets[0].classList.add("is-active");
    // this.contentSectionTargets[0].classList.remove("is-hidden");
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`);
  }

  toggleTab(e) {
    this.tabTargets.forEach((tab) => tab.classList.remove("is-active"));
    const tabElement = e.target.parentElement;
    tabElement.classList.add("is-active");
    this.toggleTabContent(tabElement);
  }

  toggleTabContent(tabElement) {
    this.contentSectionTargets.forEach((sectionTarget) => {
      sectionTarget.classList.add("is-hidden");
      if (sectionTarget.dataset.sectionId === tabElement.dataset.tabId) {
        sectionTarget.classList.remove("is-hidden");
      }
    });
  }
}
