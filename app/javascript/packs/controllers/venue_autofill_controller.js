import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "venue_autofill_controller"

  static targets = [
    "locationInput",
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

  searchQuery = null;
  url = this.pathTarget.dataset.url
  results = null
  selectedVenue = null
  location = null

  connect() {
    console.log(`${this.controllerName} connected.`)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  nameInputHandler(e) {
    this.searchHandler(e)
  }

  searchHandler = this.debounce(async function(e) {
    this.location = this.locationInputTarget.dataset.selectedVenue
    this.searchQuery = e.target.value;
    if ((this.location) && (this.location.length > 1)) {
      await this.executeAjaxRequest()
      this.resultsHandler()
    }
  }, 250);

  debounce(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  resultsHandler() {
    let self = this
    this.clearResults();
    if (this.searchQuery.length > 1) {
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
  }

  clearResults() {
    this.resultsTargets[0].innerHTML = "";
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
    self.inputTarget.value = self.searchQuery;
    self.addressTarget.value = self.addressFormatter(self.selectedVenue);
    self.categoryTarget.value = this.selectedVenue.categories[0].name;
    // self.descriptionTargets[0].value = this.selectedVenue.categories[0].name;
    debugger
    self.longitudeTarget.value = this.selectedVenue.location.lng;
    self.latitudeTarget.value = this.selectedVenue.location.lat;
    self.fourSquareIdTarget.value = this.selectedVenue.id;
  }

  generateResults() {
    self = this
    this.results.forEach((venue) => {
      let venueLocation = self.locationValueAssigner(venue)
      this.resultsTargets[0].insertAdjacentHTML("afterbegin", `
        <div class="control has-icons-left">
          <span id=${venue.id} class="input u-pointer u-padding-tb-30px has-border-primary-on-hover" data-target="resultItem" type="text"><span class="u-no-pointer-events">${venue.name}, ${venueLocation}</span>
            <span class="icon is-small is-left u-top-auto">
              <i class="fas fa-city"></i>
            </span>
          </span>
        </div>
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