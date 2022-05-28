
import 'package:flutter/cupertino.dart';
import 'package:lab3/models/movie.dart';
import 'package:lab3/repository/repository.dart';

class MoviesProvider extends ChangeNotifier{
  List<Result> movies = [];
  MovieRepository _movieRepository = MovieRepository();

  MoviesProvider() {
    getMovies();
  }

  void getMovies() {
    _movieRepository.fetchMovies().then(
            (newMovies) {
          movies = newMovies!;
          notifyListeners();
        }
    );
  }
}