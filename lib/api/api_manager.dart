import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiManager {
  static const String apiKey = '04ac2d661d8e80c601ac56804a64958b';
  static const String baseUrl = 'https://api.themoviedb.org/3/search/movie';

  Future<Map<String, dynamic>> searchMovies(String query) async {
    final Uri uri = Uri.parse(
        '$baseUrl?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
