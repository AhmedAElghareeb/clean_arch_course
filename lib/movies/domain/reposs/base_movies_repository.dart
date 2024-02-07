import '../entities/movie.dart';

//contract

abstract class BaseMoviesRepository {
  Future<List<Movie>> getNowPlaying();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();
}
