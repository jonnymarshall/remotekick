// TODO: Autocomplete the input with AJAX calls.
const autofill = () => {
  console.log("hello from searchbar autofill");

  const searchBar = document.getElementById("venueNameInput");
  const results = document.getElementById("myDropdown");
  let searchQuery = "";

  searchBar.addEventListener('keydown', (event) => {
    const character = event.key;
    if (character === "Backspace") {
      searchQuery = searchQuery.slice(0, -1);
      if (searchQuery.length > 0)
        myDropdown.classList.remove("invisible");
    } else {
      searchQuery += event.key;
      myDropdown.classList.remove("invisible");
    }
    console.log(searchQuery);
    results.innerHTML = "";


    const URLRoot = "https://api.foursquare.com/v2/venues/search?";
    const location = "bali";
    const credentials = "&client_id=FUTTDSBGYDES4JISQRJTGHSIO4ELHQZQXXIO0FQWERW3EIMO&client_secret=XIU3I03M3Z42HDCIXWUTNEPK1YHJPYRQU1LEJBA50FJO1I4V&v=20190703";


    // fetch(apiURL)
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data);
    //     data.response.venues.forEach((venue) => {
    //       console.log(venue.name);
    //     });
    // });


    fetch(`${URLRoot}near=${location}&query=${searchQuery}${credentials}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        data.response.venues.forEach((venue) => {
          results.insertAdjacentHTML("afterbegin", `<li class="list-group-item">${venue.name}</li>`);
          const listItems = document.querySelectorAll("li");
          listItems.forEach((listItem) => {
            listItem.addEventListener("mouseover", (mouseover) => {
              console.log(mouseover);
              const prevSelection = document.querySelector(".dropdown-hover");
              if (prevSelection) {
                prevSelection.classList.remove("dropdown-hover");
              }
              mouseover.target.classList.add("dropdown-hover");
            });
          });


          listItems.forEach((listItem) => {
            listItem.addEventListener("click", (click) => {
              searchQuery = listItem.innerHTML;
              console.log(searchQuery);
              venueNameInput.value = searchQuery;
              myDropdown.classList.add("invisible");
            });
          });


        });
      });
  });
}

export { autofill }
// reset the color after a short delay
//   setTimeout(function() {
//     event.target.style.color = "";
//   }, 500);
// }, false);
