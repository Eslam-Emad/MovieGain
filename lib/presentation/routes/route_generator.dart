import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_gain/presentation/pages/movie_details_screen/movie_details_screen.dart';
import 'package:movie_gain/presentation/pages/movies_screen/movies_Screen.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.movies:
        return CupertinoPageRoute(builder: (_) => const MoviesScreen());
      case Routes.movie:
        return CupertinoPageRoute(
            builder: (_) => MovieDetailsScreen(movieId: args.toString()));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
