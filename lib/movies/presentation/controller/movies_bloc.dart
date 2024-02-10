import 'dart:async';
import 'package:clean_arch_course/core/utils/enums.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:clean_arch_course/movies/presentation/controller/movies_events.dart';
import 'package:clean_arch_course/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  //constructor--->
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase();
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMsg: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingState: RequestState.loaded,
      )),
    );
  }

  Future<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
      (l) => emit(state.copyWith(
        popularState: RequestState.error,
        popularMsg: l.message,
      )),
      (r) => emit(state.copyWith(
        popularMovies: r,
        popularState: RequestState.loaded,
      )),
    );
  }

  Future<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
      (l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMsg: l.message,
      )),
      (r) => emit(state.copyWith(
        topRatedMovies: r,
        topRatedState: RequestState.loaded,
      )),
    );
  }
}
