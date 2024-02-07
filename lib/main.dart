import 'package:flutter/material.dart';

import 'movies/presentation/screens/movies_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movies App',
      home: MoviesView(),
    );
  }
}