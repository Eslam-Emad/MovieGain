import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_gain/presentation/pages/movie_details_screen/components/rate_widget.dart';

import '../../../application/movies_cubit/movies_cubit.dart';
import 'components/button_widget.dart';
import 'components/reference_icon.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getMovieById(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MovieLoaded) {
            return Stack(
              children: [
                Container(
                  height: size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                            state.movieModel.belongsToCollection!.posterPath!)),
                  ),
                ),
                Container(
                  height: size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                        Colors.black12,
                        Colors.black.withOpacity(0.9),
                        Colors.transparent
                      ])),
                ),
                Positioned(
                    top: 50,
                    right: 10,
                    child: Column(
                      children: const [
                        ReferenceIcon(icon: Icons.share, color: Colors.black54),
                        ReferenceIcon(
                            icon: Icons.star_border, color: Colors.transparent),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(state.movieModel.originalTitle!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40)),
                            Text(
                              "${state.movieModel.releaseDate} ‧ Action/Adventure ‧ 2h 31m",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 12),
                            ),
                            const Rate(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Summary",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${state.movieModel.overview}",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5), fontSize: 12),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                       Button(text: "Watch Now", color: Colors.red.shade800),
                      Button(
                          text: "Watch Trailer",
                          color: Colors.white.withOpacity(0.1))
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 55,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 3,
                              offset: Offset(0, 2),
                              blurRadius: 5)
                        ]),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
