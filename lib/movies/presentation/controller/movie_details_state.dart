part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.msg = '',
    this.recommendationList = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMsg = '',
  });

  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String msg;
  final List<Recommendation> recommendationList;
  final RequestState recommendationState;
  final String recommendationMsg;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? msg,
    List<Recommendation>? recommendationList,
    RequestState? recommendationState,
    String? recommendationMsg,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      msg: msg ?? this.msg,
      recommendationList: recommendationList ?? this.recommendationList,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMsg: recommendationMsg ?? this.recommendationMsg,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        msg,
        recommendationList,
        recommendationState,
        recommendationMsg,
      ];
}
