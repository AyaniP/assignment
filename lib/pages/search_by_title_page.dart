import 'package:assignment/constants.dart';
import 'package:assignment/models/tv.dart';
import 'package:assignment/pages/movie_details_page.dart';
import 'package:assignment/pages/tv_details_page.dart';
import 'package:flutter/material.dart';
import 'package:assignment/api/api.dart';
import 'package:assignment/models/movie.dart';

class SearchByTitlePage extends StatefulWidget {
  const SearchByTitlePage({Key? key}) : super(key: key);

  @override
  State<SearchByTitlePage> createState() => _SearchByTitlePageState();
}

class _SearchByTitlePageState extends State<SearchByTitlePage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  Future<void> _performSearch(String query) async {
    try {
      final results = await Api().getSearchByTitle(query);
      setState(() {
        _searchResults = results;
        //print("search: ${_searchResults}");
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to search: $e'),
        ),
      );
    }
  }

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white.withOpacity(0.9)),
              decoration: const InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String query = _searchController.text.trim();
              if (query.isNotEmpty) {
                _performSearch(query);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            child: const Text(
              'Search',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ), 
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final result = _searchResults[index];
                return ListTile(
                  leading: result['poster_path'] != null
                  ?Image.network(
                    '${Constants.imagePath}${result['poster_path']}',
                    width: 40,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                  :const SizedBox(
                    width: 40, 
                    height: 200,
                    child: Placeholder(),
                  ),
                  title: Text(result['title'] ?? result['name'] ?? ''),
                  subtitle: Text(result['media_type'] == 'movie' ? 'Movie' : 'TV Show'),
                  onTap: () {
                    if (result['media_type'] == 'movie') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(
                            movie: Movie(
                              title: result['title'] ?? '',
                              backDropPath: result['backdrop_path'] ?? '',
                              originalTitle: result['original_title'] ?? '',
                              overview: result['overview'] ?? '',
                              posterPath: result['poster_path'] ?? '',
                              popularity: result['popularity'] ?? 0.0,
                              releaseDate: result['release_date'] ?? '',
                              voteAverage: result['vote_average'] ?? 0.0,
                            ),
                          ),
                        ),
                      );
                    } else if (result['media_type'] == 'tv') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TVDetailsPage(
                            tv: TV(
                              backDropPath: result['backdrop_path'] ?? '',
                              name: result['name'] ?? '',
                              overview: result['overview'] ?? '',
                              posterPath: result['poster_path'] ?? '',
                              popularity: result['popularity'] ?? 0.0,
                              firstAirDate: result['first_air_date'] ?? '',
                              voteAverage: result['vote_average'] ?? 0.0,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}