import 'dart:convert';
import 'package:assignment/constants.dart';
import 'package:assignment/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data2 {
  static List<Movie> watchedListMovies = [];
  static const String key = 'Watched List';

  static Future<void> saveData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> movieJsonList = watchedListMovies.map((movie) => json.encode(movie.toJson())).toList();
      await prefs.setStringList(key, movieJsonList);
      print('Data saved successfully to shared preferences.');
    } catch (e) {
      print('Error saving data to shared preferences: $e');
    }
  }

  static Future<void> loadData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? movieJsonList = prefs.getStringList(key);
      
      if (movieJsonList != null) {
        watchedListMovies = movieJsonList
            .map((jsonString) => Movie.fromJson(json.decode(jsonString)))
            .toList();
      } else {
        // If no data is stored in shared preferences, initialize watchListMovies as an empty list
        watchedListMovies = [];
      }
      
      print('Data loaded successfully from shared preferences.');
    } catch (e) {
      print('Error loading data from shared preferences: $e');
    }
  }
}

class WatchedListPage extends StatelessWidget {
  const WatchedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF0B1320);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        elevation: 0,
        title: Image.asset(
          'images/FilmFlare (1).png',
          fit: BoxFit.cover,
          height: 250,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Watched List",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: Data2.watchedListMovies.length,
              itemBuilder: (BuildContext context, int index) {
                Movie movie = Data2.watchedListMovies[index];
                return SizedBox(
                  width: 100,
                  height: 200,
                  child: movie.posterPath != null
                      ? Image.network(
                          '${Constants.imagePath}${movie.posterPath}',
                          width: 50,
                          height: 150,
                          //fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Text(
                            'No Image Available',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

