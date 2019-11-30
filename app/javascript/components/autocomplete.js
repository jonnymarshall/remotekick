const runAutoComplete = () => {
  console.log("hello from autoComplete.js");
  // Check for the element with the id "autoComplete"
  if(document.querySelector("#autoComplete")) {
    // autoComplete.js on typing event emitter
    document.querySelector("#autoComplete").addEventListener("autoComplete", event => {
      console.log("element with id: autoComplete found");
    });
  }
  else {
    console.log("element with id: autoComplete not found");
  };



  // Generate the HTML item to assign to resultItem
  function generateResultItem(data){
    const urlStart = `<a href="coffee_shops?utf8=%E2%9C%93&address=`
    const urlEnd = `&commit=Search"`
    const idTag = data.index
    const generatedURl = `${urlStart}${data.value.name}${urlEnd} id="${idTag}">${data.match}</a>`;
    return generatedURl;
  }

  // The autoComplete.js Engine instance creator
  const autoCompletejs = new autoComplete({
    data: {
      src: async () => {
        // Loading placeholder text
        document
          .querySelector("#autoComplete")
          .setAttribute("placeholder", "Loading...");
        // Fetch External Data Source
        const source = await fetch('../data/cities.json');
        const data = await source.json();
        // Post loading placeholder text
        document
          .querySelector("#autoComplete")
          .setAttribute("placeholder", "Search for a city");
        // Returns Fetched data
        console.log(data);
        return data;
      },
      key: ["name"],
      cache: false
    },
    sort: (a, b) => {
      if (a.match < b.match) return -1;
      if (a.match > b.match) return 1;
      return 0;
    },
    placeHolder: "Search for a city",
    selector: "#autoComplete",
    threshold: 2,
    debounce: 0,
    searchEngine: "strict",
    highlight: true,
    maxResults: 5,
    resultsList: {
      render: true,
      container: source => {
        source.setAttribute("id", "autoComplete_list");
      },
      destination: document.querySelector("#autoComplete"),
      position: "afterend",
      element: "ul"
    },
    resultItem: {
      content: (data, source) => {
        source.innerHTML = generateResultItem(data);
        // debugger
      },
      element: "li"
    },
    noResults: () => {
      const result = document.createElement("a");
      result.setAttribute("class", "no_result");
      result.setAttribute("tabindex", "1");
      result.innerHTML = "No Results";
      document.querySelector("#autoComplete_list").appendChild(result);
    },
    onSelection: feedback => {
      const selection = feedback.selection.value.name;
      const selectionIndex = feedback.selection.index.toString();
      // Render selected choice to selection div
      // document.querySelector(".selection").innerHTML = selection;
      // Clear Input
      document.querySelector("#autoComplete").value = "";
      // Change placeholder with the selected value
      document
        .querySelector("#autoComplete")
        .setAttribute("placeholder", selection);
      // Concole log autoComplete data feedback
      console.log(feedback);

      // Assign selectedItem html element by matching selectionIndex with element ID
      const selectedItem = document.getElementById(selectionIndex);
      selectedItem.click();
      // Get request onClick
      // const Http = new XMLHttpRequest();
      // const url=`/coffee_shops?utf8=✓&address=${selection}&commit=Search`;
      // Http.open("GET", url);
      // Http.send();

      // Http.onreadystatechange = (e) => {
      //   console.log(Http.responseText)
      // }
    }
  });

  // // Toggle Search Engine Type/Mode
  // document.querySelector(".toggeler").addEventListener("click", function() {
  //   // Holdes the toggle buttin alignment
  //   const toggele = document.querySelector(".toggele").style.justifyContent;

  //   if (toggele === "flex-start" || toggele === "") {
  //     // Set Search Engine mode to Loose
  //     document.querySelector(".toggele").style.justifyContent = "flex-end";
  //     document.querySelector(".toggeler").innerHTML = "Loose";
  //     autoCompletejs.searchEngine = "loose";
  //   } else {
  //     // Set Search Engine mode to Strict
  //     document.querySelector(".toggele").style.justifyContent = "flex-start";
  //     document.querySelector(".toggeler").innerHTML = "Strict";
  //     autoCompletejs.searchEngine = "strict";
  //   }
  // });

  // Toggle results list and other elements
  // const action = function(action) {
    // const github = document.querySelector(".github-corner");
    // const title = document.querySelector("h1");
    // const mode = document.querySelector(".mode");
    // const selection = document.querySelector(".selection");
    // const footer = document.querySelector(".footer");

    // if (action === "dim") {
      // github.style.opacity = 1;
      // title.style.opacity = 1;
      // mode.style.opacity = 1;
      // selection.style.opacity = 1;
      // footer.style.opacity = 1;
    // } else {
      // github.style.opacity = 0.1;
      // title.style.opacity = 0.3;
      // mode.style.opacity = 0.2;
      // selection.style.opacity = 0.1;
      // footer.style.opacity = 0.1;
    // }
  // };

  // Toggle event for search input
  // showing & hidding results list onfocus / blur
  ["focus", "blur"].forEach(function(eventType) {
    const resultsList = document.querySelector("#autoComplete_list");

    document.querySelector("#autoComplete").addEventListener(eventType, function() {
      // Hide results list & show other elemennts
      if (eventType === "blur") {
        // action("dim");
        resultsList.style.display = "none";
      } else if (eventType === "focus") {
        // Show results list & hide other elemennts
        // action("light");
        resultsList.style.display = "block";
      }
    });
  });
}


export { runAutoComplete }
