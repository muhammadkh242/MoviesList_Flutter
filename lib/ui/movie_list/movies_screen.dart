import 'package:flutter/material.dart';
import 'package:lab3/ui/movie_list/movies_provider.dart';
import 'package:lab3/widgets/movie_widget.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: ChangeNotifierProvider<MoviesProvider>(
        create: (context) => MoviesProvider(),
        child: Consumer<MoviesProvider>(
          builder: (buildContext, moviesProvider, _){
            print ("list size ${moviesProvider.movies.length}");
              return ListView.builder(
                itemCount: moviesProvider.movies.length,
                  itemBuilder: (context, i){
                    print(moviesProvider.movies[0].title);
                    print(i);
                    final movie = moviesProvider.movies[i];
                      return MovieWidget(movie: movie,);
                  }
              );//: const Center(child: CircularProgressIndicator(),);
            //throw Exception("problem");
          },
        ),

      ),
    );
  }
}
