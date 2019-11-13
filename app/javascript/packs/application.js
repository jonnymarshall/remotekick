console.log('Hello world from application.js.erb');

// import "bootstrap";
import { venueAutofill } from "../components/venue_autofill.js.erb";
import { autoCompletejs } from "../components/autocomplete.js";
// import { searchAlgoliaPlaces } from "../components/algolia_places";
// import { testAPI } from "../components/algolia_places";

// import { venueAutofillTimeout } from "../components/venue_autofill_timeout.js.erb";

if (document.getElementById("venueNameInput")){
  venueAutofill();
}

// console.log(autoCompletejs);
// autoCompletejs();

// searchAlgoliaPlaces();
// if (document.getElementById("search")){
//   testAPI();
// }

// venueAutofillTimeout();

// import { venueSearch } from "../components/venue_information";
// if (document.getElementById("venueNameInupt")){
//   console.log("I found the element with ID venueNameInput");
//   venueSearch();
// }
