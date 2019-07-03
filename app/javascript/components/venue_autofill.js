// TODO: Autocomplete the input with AJAX calls.
const venueAutofill = () => {
  console.log("hello from venue_autofill.js");

  const searchBar = document.getElementById("venueNameInput");
  const dropdown = document.getElementById("myDropdown");
  const address = document.getElementById("coffee_shop_address");
  const longitude = document.getElementById("longitude");
  const latitude = document.getElementById("latitude");
  const fourSquareId = document.getElementById("fourSquareId");
  let searchQuery = "";

  searchBar.addEventListener('keydown', (event) => {
    console.log (event);
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
    dropdown.innerHTML = "";

    const URLRoot = "https://api.foursquare.com/v2/venues/search?";
    const location = "bali";
    const credentials = "&client_id=FUTTDSBGYDES4JISQRJTGHSIO4ELHQZQXXIO0FQWERW3EIMO&client_secret=XIU3I03M3Z42HDCIXWUTNEPK1YHJPYRQU1LEJBA50FJO1I4V";
    const versionDate = "&v=20190703";
    const limit = "&limit=10";
    const foodCategoryId = "4d4b7105d754a06374d81259"
    const barCategoryId = "4bf58dd8d48988d116941735"
    const hotelCategoryId = "4bf58dd8d48988d1fa931735"
    const corporateCoffeeShopId = "5665c7b9498e7d8a4f2c0f06"
    const coworkingSpaceId = "4bf58dd8d48988d174941735"
    const categoryIds = `${foodCategoryId},${barCategoryId},${hotelCategoryId},${corporateCoffeeShopId},${coworkingSpaceId}`
    console.log(categoryIds);

    fetch(`${URLRoot}near=${location}&query=${searchQuery}&categoryId=${categoryIds}${limit}${credentials}${versionDate}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        // generate list
        data.response.venues.forEach((venue) => {
          dropdown.insertAdjacentHTML("afterbegin", `<li class="list-group-item" id=${venue.id}>${venue.name}</li>`);
        });
        // list item highlighting
        const listItems = document.querySelectorAll("li");
        listItems.forEach((listItem) => {
          listItem.addEventListener("mouseover", (mouseover) => {
            const prevSelection = document.querySelector(".dropdown-hover");
            if (prevSelection) {
              prevSelection.classList.remove("dropdown-hover");
            }
            mouseover.target.classList.add("dropdown-hover");
          });
        });

        // list item selection
        listItems.forEach((listItem) => {
          listItem.addEventListener("click", (click) => {
            let clickedListItemId = listItem.id;
            console.log(`clickedListItemId is ${clickedListItemId}`);
            searchQuery = listItem.innerHTML;
            venueNameInput.value = searchQuery;
            myDropdown.classList.add("invisible");
            data.response.venues.forEach((venue) => {
              if (clickedListItemId == venue.id){
                console.log(`i found a match for ${clickedListItemId}`);
                console.log(`i matched ${venue.name}`);
                console.log(`lat is ${venue.location.lat}`);
                console.log(`lng is ${venue.location.lng}`);
                longitude.value = venue.location.lat;
                latitude.value = venue.location.lng;
              }
            });
          });
        });
      });
  });
}

export { venueAutofill }
