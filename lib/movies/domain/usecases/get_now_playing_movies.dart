import 'package:clean_arch_course/movies/domain/entities/movie.dart';
import 'package:clean_arch_course/movies/domain/reposs/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  //injection
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
