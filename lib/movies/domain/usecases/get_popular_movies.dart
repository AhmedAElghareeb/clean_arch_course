import 'package:clean_arch_course/movies/domain/entities/movie.dart';
import 'package:clean_arch_course/movies/domain/reposs/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase {
  //injection
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute () async{
    return await baseMoviesRepository.getPopularMovies();
  }
}
