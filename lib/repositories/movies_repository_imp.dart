import 'package:the_movie_list/models/movies_model.dart';
import 'package:the_movie_list/repositories/movies_repository.dart';
import 'package:the_movie_list/services/dio_service.dart';
import 'package:the_movie_list/utils/apis.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
