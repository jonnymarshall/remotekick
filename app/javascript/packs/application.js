// import "bootstrap";
import { venueAutofill } from "../components/venue_autofill";
import { doSomething } from "../components/algolia_places";

if (document.getElementById("venueNameInput")){
  venueAutofill();
}

doSomething();
// import { venueSearch } from "../components/venue_information";
// if (document.getElementById("venueNameInupt")){
//   console.log("I found the element with ID venueNameInput");
//   venueSearch();
// }
