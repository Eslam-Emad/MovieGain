import 'package:flutter/material.dart';
import 'package:movie_gain/data/models/movies_list_model.dart';

import '../pages/movie_details_screen/movie_details_screen.dart';

class MovieTile extends StatelessWidget {
  final ResultMovie? movieModel;

  const MovieTile({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) =>
                MovieDetailsScreen(movieId: movieModel!.id!.toString())));
      },
      child: Container(
        height: size.height * 0.25,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          elevation: 1.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movieModel!.posterPath!),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(60))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(movieModel!.originalTitle!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(overflow: TextOverflow.visible),
                          maxLines: 2),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        movieModel!.overview!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(overflow: TextOverflow.visible),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
