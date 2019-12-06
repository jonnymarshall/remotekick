const runMapBox = () => {
  console.log("hello from mapbox.js")
  var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

  mapboxgl.accessToken = 'pk.eyJ1Ijoiam9ubnltYXJzaGFsbDUiLCJhIjoiY2pwY2prZGl1MDgyYjNrbzM0MjdwZzdqNSJ9.jZQzzf-Q-qNuDVaYM9Moiw';
  var map = new mapboxgl.Map({
  container: 'map_container',
  style: 'mapbox://styles/mapbox/streets-v11'
  });
}

export {runMapBox}
