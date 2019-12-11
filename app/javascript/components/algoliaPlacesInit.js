const algoliaPlacesInit = () => {
  console.log("hello from algoliaPlacesInit");

  var places = require('places.js');

  // var placesAutocomplete = places({
  //   appId: "plXQXBKDK69F",
  //   apiKey: "907df42498c5bb3cd9eb9b096b75f429",
  //   container: document.querySelector('#address-input')
  // });

  const fixedOptions = {
    appId: 'plXQXBKDK69F',
    apiKey: '907df42498c5bb3cd9eb9b096b75f429',
    container: document.querySelector('#address-input'),
  };


  const reconfigurableOptions = {
    // language: 'de', // Receives results in German
    // countries: ['us', 'ru'], // Search in the United States of America and in the Russian Federation
    type: 'city', // Search only for cities names
    // aroundLatLngViaIP: false // disable the extra search/boost around the source IP
  };

  const placesInstance = places(fixedOptions).configure(reconfigurableOptions);

}

export {algoliaPlacesInit}


// const fixedOptions = {
//   appId: 'plXQXBKDK69F',
//   apiKey: '907df42498c5bb3cd9eb9b096b75f429',
//   container: document.querySelector('#demo'),
// };

// const reconfigurableOptions = {
//   language: 'de', // Receives results in German
//   countries: ['us', 'ru'], // Search in the United States of America and in the Russian Federation
//   type: 'city', // Search only for cities names
//   aroundLatLngViaIP: false // disable the extra search/boost around the source IP
// };
// const placesInstance = places(fixedOptions).configure(reconfigurableOptions);

// // dynamically reconfigure options
// placesInstance.configure({
//   countries: ['us'] // only search in the United States, the rest of the settings are unchanged: we're still searching for cities in German.
// })
