import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "algolia_places_controller"

  static targets = ["addressInput", "resultsContainer"]

  baseURL = null
  searchQuery = null
  results = null

  connect() {
    console.log(`${this.controllerName} connected.`)
    console.log(this.resultsContainerTarget)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  async changeHandler(e) {
    let self = this
    this.baseURL = e.target.dataset.requestPath
    this.searchQuery = e.target.value
    await this.executeAjaxRequest()
    this.clearResults()
    this.generateResults()

    let resultItems = document.querySelectorAll("[data-target='resultItem']")
    resultItems.forEach((resultItem) => {
      // Hover
      resultItem.addEventListener("mouseover", (h) => {
        self.hoverHandler(h)
      });
      // Select
      // resultItem.addEventListener("click", (e) => {
      //   self.setQueryParams(resultItem)
      //   self.clearResults()
      //   self.setInputValues()
      // })
    });
  }

  hoverHandler(h) {
    let prevSelection = this.resultsContainerTarget.querySelector(".is-primary");
    if ((prevSelection)) {
      prevSelection.classList.remove("is-primary");
    }
    h.target.classList.add("is-primary");
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
    // self = this
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
        <p class="control has-icons-left has-icons-right">
          <span id="" class="input u-pointer u-padding-tb-30px" data-target="resultItem" type="text"><span class="u-no-pointer-events">${sanitizeMatchedLocale(result)}, ${sanitizeCountry(result)}</span>
          <span class="icon is-small is-left u-top-auto">
            <i class="fas fa-city"></i>
          </span>
        </span></p>
        `);
      }
    });
  }
}