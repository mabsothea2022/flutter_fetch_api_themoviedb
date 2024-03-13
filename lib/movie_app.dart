import 'package:flutter/material.dart';
import 'package:flutter_fetch_moviewdb/movie_module/screens/movie_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieScreen(),
    );
  }
}
