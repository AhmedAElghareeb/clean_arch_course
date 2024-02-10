import 'dart:async';
import 'package:clean_arch_course/core/utils/enums.dart';
import 'package:clean_arch_course/movies/domain/entities/movie_details.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_recommend_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendUseCase getRecommendUseCase;

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameters(
        movieId: event.id,
      ),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          msg: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendUseCase(
      RecommendationParameters(
        event.id,
      ),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMsg: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationList: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
