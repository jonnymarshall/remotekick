const searchAlgoliaPlaces = (event) => {
  console.log("hello from algolia_places.js");

  const input = document.getElementById("search");
  input.addEventListener("keyup", (event) => {
    console.log(event);
  });

const fetchData = () => {
  fetch("https://places-dsn.algolia.net/1/places/query", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data.hits); // Look at local_names.default
    });
}

};

const testAPI = () => {
  console.log("hello from algolia_places.js");
  const input = document.getElementById("search");
  const testList = document.getElementById("test-list");

  const searchAlgoliaPlaces = (event) => {
    fetch("https://places-dsn.algolia.net/1/places/query", {
      method: "POST",
      body: JSON.stringify({ query: event.currentTarget.value })
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data.hits.slice(0, 5));
        // kill existing list if it exists
        if (typeof testList !== 'undefined'){
          testList.innerHTML = "";
        }
        // generate new list of first 5 results
        data.hits.slice(0, 5).forEach((location) => {
          if (typeof location.administrative !== 'undefined'){
            if (typeof location.administrative[0] !== 'undefined'){
              console.log(location.administrative[0]);
              testList.insertAdjacentHTML("afterbegin", `<li>${location.administrative[0]}, ${location.country.default}</li>`);
            }
          }
          let listItems = document.querySelectorAll("li");
        });
      });
  };

  input.addEventListener("keyup", searchAlgoliaPlaces);
}



// export { searchAlgoliaPlaces }
export { testAPI }
