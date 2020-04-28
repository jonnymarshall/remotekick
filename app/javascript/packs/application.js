console.log('Hello world from application.js.erb');

// Stimulus
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))


// import "bootstrap";
import { runMapBox } from "../components/mapbox.js";
import { navbarHamburger } from "../components/navbarHamburger.js";
// import { navbarFilter } from "../components/navbarFilter.js";

// MapBox
if (document.getElementById("map")){
  runMapBox();
}

// NavbarHamburger
navbarHamburger();