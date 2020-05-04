console.log('Hello world from application.js.erb');

// Stimulus
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))


// import "bootstrap";
import { runMapBox } from "../components/mapbox.js";

// MapBox
if (document.getElementById("map")){
  runMapBox();
}