import 'package:clean_arch_course/movies/domain/entities/movie.dart';
import 'package:clean_arch_course/movies/domain/reposs/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  //injection
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute () async{
    return await baseMoviesRepository.getPopularMovies();
  }
}
