import 'package:the_movie_list/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
