import 'package:clean_arch_course/core/error/exceptions.dart';
import 'package:clean_arch_course/core/network/err_msg_model.dart';
import 'package:clean_arch_course/core/utils/constants.dart';
import 'package:clean_arch_course/movies/data/models/movie_details_model.dart';
import 'package:clean_arch_course/movies/data/models/movie_model.dart';
import 'package:clean_arch_course/movies/data/models/recommend_model.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_recommend_usecase.dart';
import 'package:dio/dio.dart';

//contract
abstract class BaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendModel>> getRecommendation(
      RecommendationParameters parameters);
}

class RemoteMovieDataSource extends BaseRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      AppConstants.nowPlayingPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
      AppConstants.popularPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
      AppConstants.topRatedPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(
      AppConstants.movieDetailsPath(
        parameters.movieId,
      ),
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response = await Dio().get(
      AppConstants.recommendPath(
        parameters.id,
      ),
    );

    if (response.statusCode == 200) {
      return List<RecommendModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
