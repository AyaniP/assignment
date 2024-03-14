import 'package:flutter/material.dart';
import 'package:assignment/constants.dart';
import 'package:assignment/models/movie.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.transparent,
            expandedHeight: 525,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagePath}${movie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: 
                [
                  const Text(
                    'Overview', 
                    style: TextStyle(fontSize: 20, color: Colors.black)
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.overview,
                    style: const TextStyle(fontSize: 20, color: Colors.black)
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Row(
                            children: [
                              const Text(
                                'Release date: ', 
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              Text(
                                movie.releaseDate, 
                                style: const TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ), 
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Row(
                            children: [
                              const Text(
                                'Rating: ', 
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              const Icon(
                                Icons.star, 
                                color: Colors.amber,
                              ),
                              Text(
                                '${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: const TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ), 
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

