import 'package:clean_arch_course/movies/data/data_source/remote_movie_data_source.dart';
import 'package:clean_arch_course/movies/data/repos/movies_reposss.dart';
import 'package:clean_arch_course/movies/domain/reposs/base_movies_repository.dart';
import 'package:clean_arch_course/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:flutter/material.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async{
    BaseRemoteDataSource baseRemoteDataSource = RemoteMovieDataSource();
    BaseMoviesRepository baseMoviesRepository =  MoviesRepository(baseRemoteDataSource,);

    final result = await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
