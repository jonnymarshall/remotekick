// TODO: Autocomplete the input with AJAX calls.
const autofill = () => {
  const searchBar = document.getElementById("search");
  const results = document.getElementById("results");
  let searchQuery = "";

  searchBar.addEventListener('keydown', (event) => {
    const character = event.key;
    if (character === "Backspace") {
      searchQuery = searchQuery.slice(0, -1);
    } else {
      searchQuery += event.key;
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
              const prevSelection = document.querySelector(".active");
              if (prevSelection) {
                prevSelection.classList.remove("active");
              } else {
                console.log("that");
              }
              mouseover.target.classList.add("active");
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
