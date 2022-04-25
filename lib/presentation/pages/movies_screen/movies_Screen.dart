import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/movies_cubit/movies_cubit.dart';
import '../../components/movie_tile.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      print("message  : ${message.notification?.title ?? "not found"}");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data["route"] != null) {
        Navigator.pushNamed(context, "/" + message.data["route"].toString(),
            arguments: message.data["movieId"]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoaded || state is MovieLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "MovieGain",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        "Watch Your Favourite Movies",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => MovieTile(
                        movieModel: context
                            .read<MoviesCubit>()
                            .popularMovies!
                            .movies?[index])),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }
}
