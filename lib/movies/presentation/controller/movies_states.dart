import 'package:clean_arch_course/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMsg;

  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMsg;

  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMsg;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMsg = "",
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMsg = "",
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMsg = "",
  });

  MoviesStates copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMsg,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMsg,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMsg,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMsg: nowPlayingMsg ?? this.nowPlayingMsg,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMsg: popularMsg ?? this.popularMsg,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMsg: topRatedMsg ?? this.topRatedMsg,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMsg,
        popularMovies,
        popularState,
        popularMsg,
        topRatedMovies,
        topRatedState,
        topRatedMsg,
      ];
}
