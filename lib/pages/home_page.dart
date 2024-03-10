import 'package:flutter/material.dart';
import 'package:assignment/api/api.dart';
import 'package:assignment/models/movie.dart';
import 'package:assignment/models/tv.dart';
import 'package:assignment/widgets/movies_slider.dart';
import 'package:assignment/widgets/whats_on.dart';
import 'package:assignment/widgets/whats_on_tv.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}


class HomePageState extends State<HomePage> {

  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<TV>> nowOnTV;
  late Future<List<Movie>> bestMoviesThisYear;
  late Future<List<Movie>> highestGrossingMovies;
  late Future<List<Movie>> childrenFriendlyMovies;

  @override
  void initState(){
    super.initState();
    nowPlayingMovies = Api().getNowPlayingMovies();
    nowOnTV = Api().getNowOnTV();
    bestMoviesThisYear = Api().getBestMoviesThisYear();
    highestGrossingMovies = Api().getHighestGrossingMovies();
    childrenFriendlyMovies = Api().getChildrenFriendlyMovies();
  }


  double responsiveSpacing(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double spacing;
    if (screenWidth > 600) {
      spacing = 64;
    } else {
      spacing = 32;
    }
    return spacing;
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Movie App', style: TextStyle(fontSize: 25),), //asset later
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is on at the cinema?', style: TextStyle(fontSize: 20)
              ),
              SizedBox(height: responsiveSpacing(context)),
              SizedBox(
                child: FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasError)
                    {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      return WhatIsOnSlider(snapshot: snapshot,);
                    }
                    else
                    {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              
              
              const Text(
                'What is on TV tonight?', style: TextStyle(fontSize: 20)
              ),
              SizedBox(height: responsiveSpacing(context)),
              SizedBox(
                child: FutureBuilder(
                  future: nowOnTV,
                  builder: (context,snapshot){
                    if(snapshot.hasError)
                    {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      return WhatIsOnTVSlider(snapshot: snapshot,);
                    }
                    else
                    {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              
              
              SizedBox(height: responsiveSpacing(context)),
              const Text('Best movies this year', style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: responsiveSpacing(context)),
              SizedBox(
                child: FutureBuilder(
                  future: bestMoviesThisYear,
                  builder: (context,snapshot){
                    if(snapshot.hasError)
                    {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      return MoviesSlider(snapshot: snapshot,);
                    }
                    else
                    {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              
              SizedBox(height: responsiveSpacing(context)),
              const Text('Highest grossing movies of all time', style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: responsiveSpacing(context)),
              SizedBox(
                child: FutureBuilder(
                  future: highestGrossingMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasError)
                    {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      return MoviesSlider(snapshot: snapshot,);
                    }
                    else
                    {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              SizedBox(height: responsiveSpacing(context)),
              const Text('Children-friendly movies', style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: responsiveSpacing(context)),
              SizedBox(
                child: FutureBuilder(
                  future: childrenFriendlyMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasError)
                    {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      return MoviesSlider(snapshot: snapshot,);
                    }
                    else
                    {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

