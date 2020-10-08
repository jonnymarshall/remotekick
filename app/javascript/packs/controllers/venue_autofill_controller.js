import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "venue_autofill_controller"

  static targets = [
    "locationInput",
    "name",
    "path",
    "results",
    "test",
    "category",
    "description",
    "address",
    "city",
    "postcode",
    "country",
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

  searchHandler = this.debounce(async function (e) {
    this.location = this.locationInputTarget.dataset.selectedVenue
    this.searchQuery = e.target.value;
    if ((this.location) && (this.location.length > 1)) {
      await this.executeAjaxRequest()
      this.resultsHandler()
    }
  }, 250);

  debounce(func, wait, immediate) {
    var timeout;
    return function () {
      var context = this, args = arguments;
      var later = function () {
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
    this.clearResults();
    if (this.searchQuery.length > 1) {
      this.generateResults();
    }
  }

  selectResult(e) {
    self.matchSelectedResult(e.target)
    self.clearResults()
    self.populateInputsWithVenueData()
  }

  clearResults() {
    this.resultsTargets[0].innerHTML = "";
  }

  // Capitalizes first letter of each word in string
  toTitleCase(str) {
    return str.replace(/\w\S*/g, function (txt) {
      return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    });
  }

  hoverHandler(e) {
    let prevSelection = document.querySelector(".is-primary");
    if ((prevSelection) && (prevSelection.getAttribute("data-target") == "resultItem")) {
      prevSelection.classList.remove("is-primary");
    }
    e.target.classList.add("is-primary");
  }

  matchSelectedResult(resultItem) {
    // Match resultItem.id with clicked result and assign object to selectedVenue
    this.selectedVenue = this.results.find((result) => {
      return result.id == resultItem.id
    });
  }

  // Formats address using each line in the address array
  venueDataParser(type, selectedVenue) {
    switch (type) {
      case 'address':
        if (selectedVenue.location.address) {
          return selectedVenue.location.address
        } else {
          return selectedVenue.location.formattedAddress[0]
        }
        break;
      case 'city':
        if (selectedVenue.location.city) {
          return selectedVenue.location.city
        } else {
          return ""
        }
        break;
      case 'postcode':
        if (selectedVenue.location.postalCode) {
          return selectedVenue.location.postalCode
        } else {
          return ""
        }
        break;
    }
  }

  // Populate the input fields with selected venue data
  populateInputsWithVenueData() {
    this.nameTarget.value = this.selectedVenue.name;
    this.addressTarget.value = this.venueDataParser("address", this.selectedVenue)
    this.cityTarget.value = this.venueDataParser("city", this.selectedVenue)
    this.postcodeTarget.value = this.venueDataParser("postcode", this.selectedVenue)
    this.countryTarget.value = this.selectedVenue.location.country
    this.categoryTarget.value = this.selectedVenue.categories[0].name;
    // Hidden fields
    this.longitudeTarget.value = this.selectedVenue.location.lng;
    this.latitudeTarget.value = this.selectedVenue.location.lat;
    this.fourSquareIdTarget.value = this.selectedVenue.id;
  }

  generateResults() {
    self = this
    this.results.forEach((venue) => {
      let venueLocation = self.locationValueAssigner(venue)
      this.resultsTargets[0].insertAdjacentHTML("afterbegin", `
        <div class="control has-icons-left">
          <span id=${venue.id} class="input u-pointer u-padding-tb-30px has-border-primary-on-hover" data-action="click->venue-autofill#selectResult" type="text"><span class="u-no-pointer-events">${venue.name}, ${venueLocation}</span>
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
    if ((this.searchQuery != null) && (this.location != null)) {
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