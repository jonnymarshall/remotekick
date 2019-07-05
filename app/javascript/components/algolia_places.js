const searchAlgoliaPlaces = (event) => {

  fetch("https://places-dsn.algolia.net/1/places/query", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data.hits); // Look at local_names.default
    });
};

const logHello = () => {
  console.log("hello");
}

const input = document.querySelector("#search");

const doSomething = () => {
  console.log("hello from algolia_places");
  input.addEventListener("keyup", logHello);
}

export { doSomething }
