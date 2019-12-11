const algoliaPlacesInit = () => {
  console.log("hello from algoliaPlacesInit");
  var places = require('places.js');
  var placesAutocomplete = places({
    appId: "plXQXBKDK69F",
    apiKey: "907df42498c5bb3cd9eb9b096b75f429",
    container: document.querySelector('#address-input')
  });
}

export {algoliaPlacesInit}
