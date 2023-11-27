import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class HomeProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  List<MovieModel> searchedMovies = [];
  bool isLoading = false;

  Future<void> fetchMovies() async {
    isLoading = true;
    try {
      const String url = "https://api.tvmaze.com/search/shows?q=all";
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        // Parse the JSON response into a List of MovieModel
        List<dynamic> jsonData = jsonDecode(res.body);
        movies = jsonData.map((item) => MovieModel.fromJson(item)).toList();

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;

        notifyListeners();
        throw Exception("Couldn't able to fetch the movies!!");
      }
    } catch (e) {
      isLoading = false;

      notifyListeners();
      throw Exception(e.toString());
    }
  }

  Future<void> searchMovies(String searched) async {
    isLoading = true;

    try {
      final String url = "https://api.tvmaze.com/search/shows?q=$searched";
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        // Parse the JSON response into a List of MovieModel
        List<dynamic> jsonData = jsonDecode(res.body);
        searchedMovies =
            jsonData.map((item) => MovieModel.fromJson(item)).toList();

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;

        notifyListeners();
        throw Exception("Couldn't able to fetch the movies!!");
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }
}
