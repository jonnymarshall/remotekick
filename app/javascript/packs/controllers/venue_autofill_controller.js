import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "venue_autofill_controller"

  static targets = ["location", "input", "path", "results", "test", "description", "address"]

  searchQuery = "";
  url = this.pathTargets[0].dataset.url
  results = null
  selectedVenue = null
  location = null

  searchQueryHandler() {
  let self = this
  this.inputTargets[0].addEventListener("keyup", function(e) {
    self.searchQuery = e.target.value;
    self.executeAjaxRequest().then(() => {
        self.resultsHandler();
    });
  })
}

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.searchQueryHandler()
    this.locationHandler()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  resultsHandler() {
    this.clearResults();
    this.generateResults();
    this.selectionHandler();
  }

  clearResults() {
    this.resultsTargets[0].innerHTML = "";
  }
  
  locationHandler() {
    let self = this
    // Capitalizes first letter of each word in string
    const toTitleCase = (str) => {
      return str.replace(/\w\S*/g, function(txt){
          return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
      });
    }
    // Event listener for location field
    this.locationTargets[0].addEventListener("keyup", function(e) {
      // Sets location to value of location field for ajax request
      self.location = e.target.value;
      // Capitalizes text in location field
      e.target.value = toTitleCase(e.target.value)
      // Trigger AJAX request only if a searchquery exists
      if (self.searchQuery) {
        self.executeAjaxRequest().then(() => {
          self.resultsHandler();
        });
      }
    })
  }

  addressFormatter(selectedVenue) {
    let formattedAddress = ""
    selectedVenue.location.formattedAddress.forEach((line) => {
      formattedAddress += `${line}, `;
    });
    return formattedAddress.slice(0, -2)
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
        // Populates address and description fields
        self.addressTargets[0].value = self.addressFormatter(self.selectedVenue)
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
    const locationValueAssigner = (venue) => {
      if (venue.location.address) {
        return venue.location.address
      }
      else {
        return venue.location.formattedAddress[0]
      }
    }

    this.results.forEach((venue) => {
      let venueLocation = locationValueAssigner(venue)
      this.resultsTargets[0].insertAdjacentHTML("afterbegin", `
        <p class="control has-icons-left has-icons-right">
          <span id=${venue.id} class="input" data-target="resultItem" type="text">${venue.name}, ${venueLocation}
          <span class="icon is-small is-left">
            <i class="fas fa-store-alt"></i>
          </span>
        </p>
      `);
    });
  }

  apiCallUrlGenerator() {
    // SearchQuery and Location given
    if ((this.searchQuery != null) && (this.location != null)){
      return `${this.url}?utf8=✓&query=${this.searchQuery}&location=${this.location}`
    }
    // SearchQuery only
    else if ((this.searchQuery != null) && (this.location == null)) {
      return `${this.url}?utf8=✓&query=${this.searchQuery}`
    }
    // No queries
    else {
      return null
    }
  }

  async executeAjaxRequest() {
    let self = this
    let urlString = this.apiCallUrlGenerator()
    console.log(urlString)

    await fetch(urlString)
      .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data);
        self.results = data.response.venues
      })
  }
}