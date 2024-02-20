import '../../Domain/Entities/movie.dart';

class PopularMovieModel {
  List<MovieDetails>? results;
  PopularMovieModel({this.results});

  factory PopularMovieModel.fromJson(Map<String, dynamic> json) => PopularMovieModel(
    results: List<MovieDetails>.from(json["results"].map((x) => MovieDetails.fromJson(x))),
  );
}

class MovieDetails extends Movie{
  const MovieDetails({
    required int id,
    required String title,
    required String overview,
    required String posterPath
  }) : super(id: id, title: title, overview: overview,posterPath: posterPath);

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
    id: json["id"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    title: json["title"],
  );

}