import 'package:clean_arch_course/movies/presentation/controller/movies_events.dart';
import 'package:clean_arch_course/movies/presentation/controller/movies_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../controller/movies_bloc.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MoviesBloc(sl())
          ..add(
            GetNowPlayingMoviesEvent(),
          );
      },
      child: BlocBuilder<MoviesBloc, MoviesStates>(
          builder: (context, state) {
            return const Scaffold();
          }
      ),
    );
  }
}
