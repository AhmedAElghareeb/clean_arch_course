import 'package:clean_arch_course/core/utils/enums.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_arch_course/movies/presentation/controller/movies_events.dart';
import 'package:clean_arch_course/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  //constructor--->
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MoviesStates(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(
                MoviesStates(
                  nowPlayingState: RequestState.error,
                  nowPlayingMsg: l.message,
                ),
              ),
          (r) => emit(
                MoviesStates(
                  nowPlayingMovies: r,
                  nowPlayingState: RequestState.loaded,
                ),
              ),
      );
    });
  }
}
