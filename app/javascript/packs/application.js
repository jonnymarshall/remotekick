// import "bootstrap";
import { venueAutofill } from "../components/venue_autofill.js.erb";
// import { searchAlgoliaPlaces } from "../components/algolia_places";
import { testAPI } from "../components/algolia_places";

if (document.getElementById("venueNameInput")){
  venueAutofill();
}

// searchAlgoliaPlaces();
testAPI();
// import { venueSearch } from "../components/venue_information";
// if (document.getElementById("venueNameInupt")){
//   console.log("I found the element with ID venueNameInput");
//   venueSearch();
// }
