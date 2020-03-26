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

  // const addMarkersToMap = (map, markers) => {
  //   markers.forEach((marker) => {
  //     new mapboxgl.Marker()
  //       .setLngLat([ marker.lng, marker.lat ])
  //       .addTo(map);
  //   });
  // };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      if (
        marker.lng < -90 ||
        marker.lng > 90 ||
        marker.lat < -90 ||
        marker.lat > 90
      ) {
        console.log(marker)
      }
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    });
  };

  // markers.forEach((marker) => {

  //   const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  //   // Create a HTML element for your custom marker
  //   const element = document.createElement('div');
  //   element.className = 'marker';
  //   element.style.backgroundImage = `url('${marker.image_url}')`;
  //   element.style.backgroundSize = 'contain';
  //   element.style.width = '25px';
  //   element.style.height = '25px';

  //   // Pass the element as an argument to the new marker
  //   new mapboxgl.Marker(element)
  //     .setLngLat([marker.lng, marker.lat])
  //     .setPopup(popup)
  //     .addTo(map);
  // });

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

