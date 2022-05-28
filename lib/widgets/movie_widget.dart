import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../ui/movie_details/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
class MovieWidget extends StatelessWidget {
  const MovieWidget({Key? key, required this.movie}) : super(key: key);

  final Result movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
                  movie: movie,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 22,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  movie.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    backgroundColor: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                  //style: const TextStyle(fontFamily: 'Lobster'),
                )),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Hero(
                          tag: '${movie.title}',
                          child: Image(
                            image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500${movie.posterPath}"),
                            height: 300,
                            width: 200,
                          ),
                        ),
                    ),
                  ),
              )],
          ),
        ),
      ),
    );
  }
}
