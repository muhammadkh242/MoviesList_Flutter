import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lab3/models/movie.dart';

class MovieService {
  Future<List<Result>?> fetchMovies() async {
    var uri = Uri.parse("https://api.themoviedb.org/4/discover/movie?api_key=bdee2da50a6d74db54386e74ecb18c4f&sort_by=popularity.desc");
    final response = await http.get(uri);
    print("body${response.body}");
    if(response.statusCode == 200) {
      return  Movie.fromJson(json.decode(response.body)).results;

    } else {
      throw Exception('FAILED TO LOAD POST');
    }
  }
}