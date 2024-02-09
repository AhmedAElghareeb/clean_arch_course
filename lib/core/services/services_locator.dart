import 'package:clean_arch_course/movies/data/data_source/remote_movie_data_source.dart';
import 'package:clean_arch_course/movies/data/repos/movies_reposss.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:clean_arch_course/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../movies/domain/reposs/base_movies_repository.dart';

//sl() --> already there are object of anything you need..

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///Blocs
    sl.registerFactory(
      () => MoviesBloc(
        sl(),
        sl(),
        sl(),
      ),
    );

    /// usecases
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton(
          () => GetPopularMoviesUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton(
          () => GetTopRatedMoviesUseCase(
        sl(),
      ),
    );

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(
        () => RemoteMovieDataSource());
  }
}
