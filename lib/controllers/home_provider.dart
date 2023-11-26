import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class HomeProvider extends ChangeNotifier {
  List<MovieModel> movies = [];

  Future<void> fetchMovies() async {
    try {
      const String url = "https://api.tvmaze.com/search/shows?q=all";
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        // Parse the JSON response into a List of MovieModel
        List<dynamic> jsonData = jsonDecode(res.body);
        // log(jsonData.toString());
        // int i = 0;
        // for (var element in jsonData) {
        // //   log("\n\n${element}");
        //  //movies!.add(MovieModel.fromJson(element));
        //   // movies!.add(element);
        //   var a = MovieModel.fromJson(element);
        //   movies.add(a);
        //   print(a.show);
        //   // if(i == 1)break;
        //   i++;
        // }

        movies = jsonData.map((item) => MovieModel.fromJson(item)).toList();
        for (var element in movies) {
          print("\n${element.show!.genres.toString()}");
        }
        notifyListeners();
      } else {
        notifyListeners();
        log("Error here 1");
        throw Exception("Couldn't able to fetch the movies!!");
      }
    } catch (e) {
      notifyListeners();
      log("Error here 2");
      throw Exception(e.toString());
    }
  }
}
