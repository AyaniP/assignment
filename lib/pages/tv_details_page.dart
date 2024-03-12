import 'package:assignment/constants.dart';
import 'package:assignment/models/tv.dart';
import 'package:assignment/widgets/back_button.dart';
import 'package:flutter/material.dart';



class TVDetailsPage extends StatelessWidget {
  const TVDetailsPage({super.key, required this.tv});

  final TV tv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackBttn(),
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
                  '${Constants.imagePath}${tv.posterPath}',
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
                    style: TextStyle(fontSize: 20)
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tv.overview,
                    style: const TextStyle(fontSize: 20)
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
                                'First Air Date: ', 
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                tv.firstAirDate, 
                                style: const TextStyle(fontSize: 16),
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
                                style: TextStyle(fontSize: 16),
                              ),
                              const Icon(
                                Icons.star, 
                                color: Colors.amber,
                              ),
                              Text(
                                '${tv.voteAverage.toStringAsFixed(1)}/10',
                                style: const TextStyle(fontSize: 16),
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
