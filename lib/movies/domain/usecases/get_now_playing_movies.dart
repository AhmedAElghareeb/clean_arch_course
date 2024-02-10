import 'package:clean_arch_course/core/usecase/base_use_case.dart';
import 'package:clean_arch_course/movies/domain/entities/movie.dart';
import 'package:clean_arch_course/movies/domain/reposs/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  //injection
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  //call refer to callable method
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}