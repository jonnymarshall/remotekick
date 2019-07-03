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
    } else {
      searchQuery += event.key;
      myDropdown.classList.remove("invisible");
    }
    console.log(searchQuery);
    results.innerHTML = "";
    fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${searchQuery}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        data.words.forEach((word) => {
          results.insertAdjacentHTML("afterbegin", `<li class="list-group-item">${word}</li>`);
          const listItems = document.querySelectorAll("li");
          listItems.forEach((listItem) => {
            listItem.addEventListener("mouseover", (mouseover) => {
              console.log(mouseover);
              const prevSelection = document.querySelector(".dropdown-hover");
              if (prevSelection) {
                prevSelection.classList.remove("dropdown-hover");
              } else {
                console.log("that");
              }
              mouseover.target.classList.add("dropdown-hover");
            });
          });


          listItems.forEach((listItem) => {
            listItem.addEventListener("click", (click) => {
              console.log(listItem.innerHTML);
              venueNameInput.value = listItem.innerHTML;
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
