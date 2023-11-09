import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_search/Response/SearchResponse.dart';
import 'package:movies_search/api/api_constant.dart';

class ApiManager {
  ApiManager._(); //private constructor
  static ApiManager? _instance;

  static ApiManager getApiManagerInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  // https://api.themoviedb.org/3/search/movie?api_key=04ac2d661d8e80c601ac56804a64958b&language=en-US&query=av&page=1&include_adult=false
  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=c32b5bd86d2e44f5b256f1952bdbf86fe
   */

  Future<SearchResponse?> searchMovies(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.moviesUrl,
        {'api_key': '04ac2d661d8e80c601ac56804a64958b', 'query': query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SearchResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
