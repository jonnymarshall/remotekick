import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "algolia_places_controller"

  static targets = ["addressInput", "resultsContainer", "submitButton", "centralContainer"]

  baseURL = null
  searchQuery = null
  results = null

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.baseURL = this.addressInputTarget.dataset.requestPath
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  async changeHandler(e) {
    let self = this
    this.searchQuery = e.target.value
    await this.executeAjaxRequest()
    this.adjustContentPlacement()
    this.clearResults()
    this.generateResults()
    let resultItems = document.querySelectorAll("[data-target='resultItem']")
    this.adjustContentPlacement()
    resultItems.forEach((resultItem) => {
      // Click
      resultItem.addEventListener("click", (e) => {
        self.setLocation(resultItem)
        self.clearResults()
        if (self.submitButtonTargets.length > 0) {
          self.submitButtonTarget.click()
        }
      })
    });
  }

  hoverHandler(h) {
    console.log("prevSelection", prevSelection)
    console.log("target", h.target)
    let prevSelection = this.resultsContainerTarget.querySelector(".is-primary");
    if ((prevSelection)) {
      prevSelection.classList.remove("is-primary");
    }
    h.target.classList.add("is-primary");
  }

  setLocation(resultItem) {
    this.addressInputTarget.value = resultItem.innerText
  }

  async executeAjaxRequest() {
    let self = this
    let urlString = `${this.baseURL}?query=${this.searchQuery}`

    await fetch(urlString, { headers: { accept: "application/json" } })
      .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data);
        self.results = data.hits
      })
  }

  clearResults() {
    this.resultsContainerTarget.innerHTML = "";
  }

  generateResults() {
    const sanitizeCountry = (result) => {
      if (result.country.en) {
        return result.country.en
      } else {
        return result.country.default
      }
    }

    const sanitizeCity = (result) => {
      if (result.locale_names.en) {
        return result.locale_names.en[0]
      } else {
        return result.locale_names.default[0]
      }
    }

    const sanitizeCountryCode = (result) => {
      return result.country_code
    }

    const sanitizeMatchedLocale = (result) => { 
      if (result._highlightResult.locale_names.en) {
        if (result._highlightResult.locale_names.en[0].matchedWords.length > 0) {
          return result._highlightResult.locale_names.en[0].value.replace("<em>", "<strong>").replace("</em>", "</strong>")
        }
      } else if (result._highlightResult.locale_names.default) {
        if (result._highlightResult.locale_names.default[0].matchedWords.length > 0) {
          return result._highlightResult.locale_names.default[0].value.replace("<em>", "<strong>").replace("</em>", "</strong>")
        }
      }
      else {
        throw "Unable to sanitize data from result."
      }
    }

    this.results.forEach((result) => {     
      if (sanitizeMatchedLocale(result)) {
        this.resultsContainerTarget.insertAdjacentHTML("afterbegin", `
        <div class="control has-icons-left">
          <span class="input u-pointer u-padding-tb-30px has-border-primary-on-hover" data-target="resultItem" type="text"><span class="u-no-pointer-events">${sanitizeMatchedLocale(result)}, ${sanitizeCountry(result)}</span>
          <span class="icon is-small is-left u-top-auto">
            <i class="fas fa-city"></i>
          </span>
        </span></div>
        `);
      }
    });
  }

  adjustContentPlacement() {
    if (!this.resultsContainerTarget.firstChild) {
      this.centralContainerTarget.style.marginBottom = "0px";
    } else {
      this.centralContainerTarget.style.marginBottom = "250px";
    }
  }
}