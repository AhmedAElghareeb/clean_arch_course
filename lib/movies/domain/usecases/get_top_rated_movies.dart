import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../reposs/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  //injection
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute () async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}