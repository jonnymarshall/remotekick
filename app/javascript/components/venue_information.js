// const venueInformation = () => {
//   fetch("https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJI3fw3n1H0i0RuMkOSYRJueQ&key=AIzaSyBHJdXVlnyzl4sAA1nJbwaBSpizjtGOUV0")
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data);
//   });
// }

const venueSearch = () => {
  const apiURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyBHJdXVlnyzl4sAA1nJbwaBSpizjtGOUV0";

  fetch(apiURL)
    .then(response => response.json())
    .then((data) => {
      data.results.forEach((result) => {
        resultId = result.id;
        console.log(resultId);
        const resultName = result.name;
        console.log(resultName);
      });
  });
}

export { venueSearch }
