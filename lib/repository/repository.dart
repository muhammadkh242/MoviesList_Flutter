import '../localdb/DBHelper.dart';
import '../models/movie.dart';
import '../remote/movie_service.dart';
import 'package:connectivity/connectivity.dart';

class MovieRepository{
  final MovieService _movieService = MovieService();

  Future<List<Result>?> fetchMovies() async{
    var connectivityResult =  await (Connectivity().checkConnectivity());
    final dbHelper = DBHelper.instance;
    if(connectivityResult == ConnectivityResult.none){
      final savedMovieResults = await dbHelper.queryAllRows();
      return List<Result>.from(savedMovieResults.map((savedResult) => Result.fromJson(savedResult)));
    }
    else{
      final results = await _movieService.fetchMovies();
      for(final res in results!){
        dbHelper.insert(res.toMap());
      }
      return results;
    }
  }
}
