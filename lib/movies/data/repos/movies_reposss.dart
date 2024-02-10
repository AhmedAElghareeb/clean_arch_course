import 'package:clean_arch_course/core/error/exceptions.dart';
import 'package:clean_arch_course/core/error/failure.dart';
import 'package:clean_arch_course/movies/data/data_source/remote_movie_data_source.dart';
import 'package:clean_arch_course/movies/domain/entities/movie.dart';
import 'package:clean_arch_course/movies/domain/entities/movie_details.dart';
import 'package:clean_arch_course/movies/domain/entities/recommendation.dart';
import 'package:clean_arch_course/movies/domain/reposs/base_movies_repository.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_recommend_usecase.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseRemoteDataSource.getMovieDetails(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameters parameters) async {
    final result = await baseRemoteDataSource.getRecommendation(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}
