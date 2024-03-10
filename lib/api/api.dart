//import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:assignment/constants.dart';
import 'package:assignment/models/movie.dart';
import 'package:assignment/models/tv.dart';


class Api{
  static const String nowPlayingURL= 'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const String nowOnTVURL= 'https://api.themoviedb.org/3/tv/airing_today?api_key=${Constants.apiKey}';
  static const String bestMoviesThisYearURL= 'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&sort_by=popularity.desc&primary_release_year=2024';
  static const String highestGrossingMoviesURL= 'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&sort_by=revenue.desc';
  static const String childrenFriendlyMoviesURL= 'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&certification_country=US&certification=G';


  Future<List<Movie>> getNowPlayingMovies() async{
    final response = await http.get(Uri.parse(nowPlayingURL));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }

  }
  
  Future<List<TV>> getNowOnTV() async{
    final response = await http.get(Uri.parse(nowOnTVURL));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tv) => TV.fromJson(tv)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }

  }

  Future<List<Movie>> getBestMoviesThisYear() async{
    final response = await http.get(Uri.parse(bestMoviesThisYearURL));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }

  }

  Future<List<Movie>> getHighestGrossingMovies() async{
    final response = await http.get(Uri.parse(highestGrossingMoviesURL));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }

  }

  Future<List<Movie>> getChildrenFriendlyMovies() async{
    final response = await http.get(Uri.parse(childrenFriendlyMoviesURL));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }

  }
}

