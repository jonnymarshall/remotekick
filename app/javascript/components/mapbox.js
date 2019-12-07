const runMapBox = () => {
  console.log("hello from mapbox.js")

  var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

  const mapElement = document.getElementById('map');

  const buildMap = () => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      // minZoom: 15,
      // hash: true,
      center: [144.960856, -37.814149]
    });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
  };

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  };

  const initMapbox = () => {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    // debugger
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  };

  initMapbox();
}

export {runMapBox}
