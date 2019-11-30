console.log('Hello world from application.js.erb');

// import "bootstrap";
import { venueAutofill } from "../components/venue_autofill.js.erb";
import { runAutoComplete } from "../components/autocomplete.js";
// import { venueAutofillTimeout } from "../components/venue_autofill_timeout.js.erb";

if (document.getElementById("venueNameInput")){
  venueAutofill();
}

if(document.querySelector("#autoComplete")) {
  runAutoComplete();
}
else {
  console.log("autoComplete.js attempted to run, element with id: 'autoComplete' not found");
};


// venueAutofillTimeout();
