const navbarFilter = () => {document.addEventListener('DOMContentLoaded', () => {
  // sayHello
  console.log("Hello from navbarFilter")
  // Get "nnavbar-filter" element
  const navbarFilter = document.getElementById('navbar-filter-button');

  // Check if there are any navbar burgers
  if (navbarFilter) {

    // Add a click event on each of them
    navbarFilter.addEventListener('click', () => {

      console.log("registered click")

      // Get the target from the "data-target" attribute
      const indexFilters = document.getElementById("index-filters");

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      indexFilters.classList.toggle('is-hidden-touch');
    });
  }
});
}

export { navbarFilter }