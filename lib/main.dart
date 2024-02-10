import 'package:clean_arch_course/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'movies/presentation/screens/movie_screen.dart';


void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MovieView(),
    );
  }
}