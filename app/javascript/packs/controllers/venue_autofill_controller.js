import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "venue_autofill_controller"

  static targets = ["input", "path", "results", "test", "description", "address"]

  searchQuery = "";
  url = this.pathTargets[0].dataset.url
  results = null
  selectedVenue = null

  searchQueryHandler() {
  let self = this
  this.inputTargets[0].addEventListener("keyup", function(e) {
    self.searchQuery = e.target.value;
    self.executeAjaxRequest().then(() => {
        self.clearResults();
        self.generateResults();
        self.selectionHandler();
    });
  })
}

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.searchQueryHandler()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  clearResults() {
    this.resultsTargets[0].innerHTML = "";
  }
  
  selectionHandler() {
    let self = this

    let resultItems = document.querySelectorAll("[data-target='resultItem']")
    resultItems.forEach((resultItem) => {
      resultItem.addEventListener("click", (e) => {
        // Match resultItem.id with correct result and assign object to selectedVenue
        self.selectedVenue = self.results.filter((result) => {
          return result.id == resultItem.id
        })[0];
        // Reassign searchQuery to be the name of the selected venue
        self.searchQuery = self.selectedVenue.name;
        // Populate the input field with the venue name
        self.inputTargets[0].value = self.searchQuery;
        // Hide the venue results list
        self.resultsTargets[0].classList.add("is-hidden");
        self.addressTargets[0].value = this.selectedVenue.location.address
        self.descriptionTargets[0].value = this.selectedVenue.categories[0].name
      })
      resultItem.addEventListener("mouseover", (mouseover) => {
        const prevSelection = document.querySelector(".is-primary");
        if (prevSelection) {
          prevSelection.classList.remove("is-primary");
        }
        mouseover.target.classList.add("is-primary");
      });
    });
  }

  generateResults() {
    this.results.forEach((venue) => {
      this.resultsTargets[0].insertAdjacentHTML("afterbegin", `
        <p class="control has-icons-left has-icons-right">
          <span id=${venue.id} class="input" data-target="resultItem" type="text">${venue.name}
          <span class="icon is-small is-left">
            <i class="fas fa-store-alt"></i>
          </span>
        </p>
      `);
    });
  }

  async executeAjaxRequest() {
    let self = this
    await fetch(`${self.url}?utf8=✓&query=${self.searchQuery}`)
      .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data);
        self.results = data.response.venues
      })
  }
}