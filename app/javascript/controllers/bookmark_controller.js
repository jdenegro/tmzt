import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="bookmark"
export default class extends Controller {
  static targets = ["input", "moviesList"];

  connect() {
    console.log(this.moviesListTarget);
  }

  search(event) {
    event.preventDefault();
    const query = this.inputTarget.value;
    const api_key = "2d904f2ccbadaa1303f4b2e7ea571a93&";
    const url = `https://api.themoviedb.org/3/search/movie?api_key=${api_key}&language=en-US&page=1&include_adult=false&query=${query}`;
    fetch(url)
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        data.results.forEach((movie) => {
          this.#insertMovieCard(movie);
        });
      });
  }

  #insertMovieCard(movie) {
    const movieCard = `<div class="movie">
        <img src="https://image.tmdb.org/t/p/w500/${movie.poster_path}">
        <h3 style="padding: 10px 0">${movie.original_title}</h3>
        <p>${movie.overview}</p>
        <p><strong>Released:</strong>${movie.release_date}</p>
        <p><strong>Rated:</strong>${movie.vote_average}</p>
      </div>`;
    this.moviesListTarget.insertAdjacentHTML("beforeend", movieCard);
  }
}
