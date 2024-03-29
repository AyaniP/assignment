class TV{
  String? backDropPath;
  String name;
  String overview;
  String posterPath;
  double popularity;
  String firstAirDate;
  double voteAverage;

  TV({
    required this.backDropPath,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
  });

  factory TV.fromJson(Map<String, dynamic> json){
    return TV(
    backDropPath: json["backdrop_path"], 
   name: json["name"], 
    overview: json["overview"], 
    posterPath: json["poster_path"], 
    popularity:json["popularity"],
    firstAirDate: json["first_air_date"], 
    voteAverage: json["vote_average"]
    );
  }
}
