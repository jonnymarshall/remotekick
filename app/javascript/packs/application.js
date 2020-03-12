console.log('Hello world from application.js.erb');

// Stimulus
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))


// import "bootstrap";
import { venueAutofill } from "../components/venue_autofill.js.erb";
import { runAutoComplete } from "../components/autocomplete.js";
import { runMapBox } from "../components/mapbox.js";
import { navbarHamburger } from "../components/navbarHamburger.js";
import { navbarFilter } from "../components/navbarFilter.js";

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

// MapBox
if (document.getElementById("map")){
  runMapBox();
}

// venueAutofillTimeout();

// NavbarHamburger
navbarHamburger();