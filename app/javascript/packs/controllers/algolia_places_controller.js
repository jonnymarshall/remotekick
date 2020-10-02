import { Controller } from "stimulus";

export default class extends Controller {
  controllerName = "algolia_places_controller";

  static targets = ["addressInput", "resultsContainer", "submitButton"];

  baseURL = null;
  searchQuery = null;
  results = null;

  connect() {
    console.log(`${this.controllerName} connected.`);
    this.baseURL = this.addressInputTarget.dataset.requestPath;
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`);
  }

  changeHandler = this.debounce(async function(e) {
    let self = this;
    this.searchQuery = e.target.value;
    await this.executeAjaxRequest();
    this.clearResults();
    this.generateResults();
  }, 250);

  executeSearch(e) {
    this.addressInputTarget.value = e.target.innerText;
    this.addressInputTarget.dataset.selectedVenue = e.target.innerText;
    this.clearResults();
    if (this.submitButtonTargets.length > 0) {
      this.submitButtonTarget.click();
    }
  }

  debounce(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this,
        args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  }

  hoverHandler(h) {
    let prevSelection = this.resultsContainerTarget.querySelector(
      ".is-primary"
    );
    if (prevSelection) {
      prevSelection.classList.remove("is-primary");
    }
    h.target.classList.add("is-primary");
  }

  async executeAjaxRequest() {
    let self = this;
    let urlString = `${this.baseURL}?query=${this.searchQuery}`;

    await fetch(urlString, { headers: { accept: "application/json" } })
      .then((response) => response.json())
      .then((data) => {
        console.log("Success:", data);
        self.results = data.hits;
      });
  }

  clearResults() {
    this.resultsContainerTarget.innerHTML = "";
    if (this.searchQuery.length === 0) {
      this.results = [];
    }
  }

  generateResults(sanitizedResults = []) {
    this.results.forEach((result) => {
      if (
        result.locale_names[0]
          .toLowerCase()
          .includes(this.searchQuery.toLowerCase())
      ) {
        sanitizedResults.push(result);
      }
    });

    sanitizedResults.forEach((result) => {
      // const beforeAfterMatchedSection = result.locale_names[0].split(
      //   this.searchQuery
      // );
      // const tagReplacedResult = (result) => {
      //   result.locale_names[0]
      //     .replace("<em>", "<strong>")
      //     .replace("</em>", "</strong>");
      // };
      this.resultsContainerTarget.insertAdjacentHTML(
        "afterbegin",
        `
        <div class="control has-icons-left">
          <span
            class="input u-pointer u-padding-tb-30px has-border-primary-on-hover"
            data-target="resultItem" data-action="click->algolia-places#executeSearch"
            type="text"
          >
            <span class="u-no-pointer-events">
              ${result.locale_names[0]}, ${result.country}
            </span>
            <span class="icon is-small is-left u-top-auto">
              <i class="fas fa-city"></i>
            </span>
          </span>
        </div>
        `
      );
    });
  }
}
