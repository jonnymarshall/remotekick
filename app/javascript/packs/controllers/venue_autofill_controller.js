import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "venue_autofill_controller"

  static targets = [
    "location",
    "input",
    "path",
    "results",
    "test",
    "category",
    "description",
    "address",
    "longitude",
    "latitude",
    "fourSquareId"
  ]

  searchQuery = "";
  url = this.pathTarget.dataset.url
  results = null
  selectedVenue = null
  location = null

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.searchQueryHandler()
    this.locationHandler()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  searchQueryHandler() {
    let self = this
    this.inputTarget.addEventListener("keyup", function(e) {
      self.searchQuery = e.target.value;
      if ((self.location) && (self.location.length > 1)) {
        self.executeAjaxRequest().then(() => {
          self.resultsHandler();
        });
      }
    })
  }

  resultsHandler() {
    let self = this
    this.clearResults();
    this.generateResults();
    let resultItems = document.querySelectorAll("[data-target='resultItem']")
    resultItems.forEach((resultItem) => {
      // Select
      resultItem.addEventListener("click", (e) => {
        self.setQueryParams(resultItem)
        self.clearResults()
        self.setInputValues()
      })
    });
  }

  clearResults() {
    this.resultsTargets[0].innerHTML = "";
  }
  
  locationHandler() {
    let self = this
    // Event listener for location field
    this.locationTargets[0].addEventListener("keyup", function(e) {
      // Sets location to value of location for ajax request
      self.location = e.target.value;
      // Capitalizes text in location field
      e.target.value = self.toTitleCase(e.target.value)
      // Trigger AJAX request only if a searchquery exists
      if (self.searchQuery) {
        self.executeAjaxRequest().then(() => {
          self.resultsHandler();
        });
      }
    })
  }

  // Capitalizes first letter of each word in string
  toTitleCase(str) {
    return str.replace(/\w\S*/g, function(txt){
        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    });
  }

  // Formats address using each line in the address array
  addressFormatter(selectedVenue) {
    let formattedAddress = ""
    selectedVenue.location.formattedAddress.forEach((line) => {
      formattedAddress += `${line}, `;
    });
    return formattedAddress.slice(0, -2)
  }

  hoverHandler(e) {
    let prevSelection = document.querySelector(".is-primary");
    if ((prevSelection) && (prevSelection.getAttribute("data-target") == "resultItem")) {
      prevSelection.classList.remove("is-primary");
    }
    e.target.classList.add("is-primary");
  }
  
  setQueryParams(resultItem) {
    // Match resultItem.id with clicked result and assign object to selectedVenue
    this.selectedVenue = this.results.filter((result) => {
      return result.id == resultItem.id
    })[0];
    // Reassign searchQuery to be the name of the selected venue
    this.searchQuery = this.selectedVenue.name;
  }

  // Populate the input field with the venue name
  setInputValues() {
    self.inputTargets[0].value = self.searchQuery;
    self.addressTargets[0].value = self.addressFormatter(self.selectedVenue);
    self.categoryTargets[0].value = this.selectedVenue.categories[0].name;
    // self.descriptionTargets[0].value = this.selectedVenue.categories[0].name;
    self.longitudeTargets[0].value = this.selectedVenue.location.lng;
    self.latitudeTargets[0].value = this.selectedVenue.location.lat;
    self.fourSquareIdTargets[0].value = this.selectedVenue.id;
  }

  generateResults() {
    self = this
    this.results.forEach((venue) => {
      let venueLocation = self.locationValueAssigner(venue)
      this.resultsTargets[0].insertAdjacentHTML("afterbegin", `
        <div class="control has-icons-left has-icons-right">
          <span id=${venue.id} class="input u-pointer has-border-primary-on-hover" data-target="resultItem" type="text">${venue.name}, ${venueLocation}
          <span class="icon is-small is-left">
            <i class="fas fa-store-alt"></i>
          </div>
        </p>
      `);
    });
  }

  locationValueAssigner(venue) {
    if (venue.location.address) {
      return venue.location.address
    }
    else {
      return venue.location.formattedAddress[0]
    }
  }

  apiCallUrlGenerator() {
    // SearchQuery and Location given
    if ((this.searchQuery != null) && (this.location != null)){
      return `${this.url}?query=${this.searchQuery}&location=${this.location}`
    }
    // SearchQuery only
    else if ((this.searchQuery != null) && (this.location == null)) {
      return `${this.url}?query=${this.searchQuery}`
    }
    // No queries
    else {
      return null
    }
  }

  async executeAjaxRequest() {
    let self = this
    let urlString = this.apiCallUrlGenerator()

    await fetch(urlString)
      .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data);
        self.results = data.response.venues
      })
  }
}