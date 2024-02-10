import 'package:clean_arch_course/movies/domain/entities/movie_details.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_recommend_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/recommendation.dart';

//contract

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendations(RecommendationParameters parameters);
}
