import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_gain/presentation/pages/movie_details_screen/movie_details_screen.dart';
import 'package:movie_gain/presentation/pages/movies_screen/movies_Screen.dart';

import '../application/deeplink_bloc/deep_link_bloc.dart';

class ComposeUi extends StatelessWidget {
  const ComposeUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DeepLinkBloc, DeepLinkState>(
          builder: (context, state) => state is DeepLinkDetailsMovie
              ? MovieDetailsScreen(movieId: state.movieId)
              : const MoviesScreen());
}
