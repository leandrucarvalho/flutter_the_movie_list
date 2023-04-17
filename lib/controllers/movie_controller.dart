import 'package:flutter/cupertino.dart';
import 'package:the_movie_list/models/movie_model.dart';
import 'package:the_movie_list/models/movies_model.dart';
import 'package:the_movie_list/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fethc();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  final searchMovies = ValueNotifier<List<Movie>>([]);

  onChanged(String value) {
    List<Movie> data = [];
    for (var element in movies.value!.listmovies!) {
      bool contains =
          element.title!.toUpperCase().startsWith(value.toUpperCase());
      if (contains) {
        data.add(element);
      }
    }
    searchMovies.value = data;
  }

  fethc() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
