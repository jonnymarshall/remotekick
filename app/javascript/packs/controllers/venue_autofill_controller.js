import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "venue_autofill_controller"

  static targets = ["input", "path", "results", "test"]

  searchQuery = "";
  url = this.pathTargets[0].dataset.url
  results = null
  selectedVenue = null

  searchQueryHandler() {
  let self = this
  this.inputTargets[0].addEventListener("keyup", function(e) {
    self.searchQuery = e.target.value;
    self.executeAjaxRequest().then(() => {
        self.generateResults();
        self.resultHighlighting();
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
  
  resultHighlighting() {
    let self = this
    let listItems = document.querySelectorAll("li");
    listItems.forEach((listItem) => {
      listItem.addEventListener("click", (e) => {
        // Get the FourSquare id from the <li>
        self.selectedVenue = self.results.filter((result) => {
          return result.id == listItem.id
        })[0];
        // Reassign searchQuery to be the name of the selected venue
        self.searchQuery = self.selectedVenue.name;
        // Make the value attribute of venueNameInput field to be the same as the venue
        this.inputTargets[0].value = self.searchQuery;
        // Kill the venue results list
        self.resultsTargets[0].classList.add("is-hidden");
      })
      listItem.addEventListener("mouseover", (mouseover) => {
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
      this.resultsTargets[0].insertAdjacentHTML("afterbegin", `<li data-target="test" class="input" id=${venue.id}>${venue.name}</li>`);
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