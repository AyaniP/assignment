class Movie{
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  double popularity;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'backDropPath': backDropPath,
      'originalTitle': originalTitle,
      'overview': overview,
      'posterPath': posterPath,
      'popularity': popularity,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
    };
  } 

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
    title: json["title"], 
    backDropPath: json["backdrop_path"], 
    originalTitle: json["original_title"], 
    overview: json["overview"], 
    posterPath: json["poster_path"], 
    popularity:json["popularity"],
    releaseDate: json["release_date"], 
    voteAverage: json["vote_average"]
    );
  }
}
