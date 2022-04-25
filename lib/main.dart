import 'package:flutter/material.dart';
import 'package:movie_gain/core/constants/theme.dart';
import 'package:movie_gain/core/init_app.dart';
import 'package:movie_gain/presentation/compose_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_gain/presentation/routes/route_generator.dart';

import 'application/deeplink_bloc/deep_link_bloc.dart';
import 'application/movies_cubit/movies_cubit.dart';
import 'core/service_locator.dart';

void main() => InitializeApp.run();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:  [
        BlocProvider(create: (context) => sl<DeepLinkBloc>()),
        BlocProvider(create: (context) => sl<MoviesCubit>()..getPopularMovies()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const ComposeUi(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
