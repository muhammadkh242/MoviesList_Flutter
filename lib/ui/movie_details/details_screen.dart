import 'package:flutter/material.dart';
import 'package:lab3/models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetailsScreen extends StatelessWidget{

  final Result movie;
  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: '${movie.title}',
                      child: Image(image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500/${movie.posterPath}"))
                  )
              ),
              //Text("ID: ${movie.id}",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,)),
              const SizedBox(height: 12,),
              Text("Title: ${movie.title}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,)),
              const SizedBox(height: 12,),
              const Text("Overview", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 12,),
              Center(child: Text("${movie.overview}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,))),
              const SizedBox(height: 12,),

            ],
          ),


        ),
      ),
    );

  }

}