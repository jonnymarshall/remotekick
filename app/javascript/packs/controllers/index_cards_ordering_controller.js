import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "index_cards_ordering_controller"

  static targets = ["option", "card", "cardsList"]

  orderedResults = null
  orderedHtmlEmelents = null

  // Gets the element which has data-selected="true" (boolean value is embedded based on params)

  connect() {
    console.log(`${this.controllerName} connected.`)
    // console.log(this.cardTargets)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  // Gets the data-url value from the selected option (embedded with url helper) & redirects
  goToUrl(event) {
    self = this
    this.optionTargets.forEach(el => {
      if (el.value == event.target.value) {
        self.executeAjaxRequest(el.dataset.url).then(() => {
          self.doSomething()
        });
      }
    })
  }
  
  async executeAjaxRequest(url) {
    self = this
    await fetch(url, { headers: { accept: "application/json" } })
      .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data);
        self.orderedResults = data.venues
      })
  }

  fadeElement(el) {
    let fadeTarget = el
    let fadeEffect = setInterval(function () {
      if (!fadeTarget.style.opacity) {
        console.log('!fadeTarget.style.opacity for', el)
          fadeTarget.style.opacity = 1;
      }
      if (fadeTarget.style.opacity > 0) {
          console.log('fadeTarget.style.opacity > 0 for', el)
          fadeTarget.style.opacity -= 0.1;
      } else {
        console.log('hit else for', el)
        clearInterval(fadeEffect);
      }
  }, 50);
  }

  reorderCards(cardList, orderedHtmlEmelents) {
    // cardList.forEach((child) => this.fadeElement(child))
    this.cardsListTarget.innerHTML = ""
    
    this.orderedHtmlEmelents.forEach(el => {
      this.cardsListTarget.appendChild(el)
    })
    // const newCardList = Array.from(this.cardsListTarget.children)
    // newCardList.forEach((child) => this.fadeElement(child))
  }

  doSomething() {
    const organiseOrder = (orderedArray, unorderedArray) => {
      const reorderedCardList =[];

      orderedArray.forEach((orderedElement) => {
        unorderedArray.forEach((unorderedElement) => {
          let unorderedElementId = parseInt(unorderedElement.children[0].dataset.id)
          let orderedElementId = orderedElement.id
          if (unorderedElementId === orderedElementId) {
            reorderedCardList.push(unorderedElement)
          }
        })
      })
      return reorderedCardList
    }

    const cardList = Array.from(this.cardsListTarget.children)
    this.orderedHtmlEmelents = organiseOrder(this.orderedResults, cardList)

    this.reorderCards(cardList)
  }
}