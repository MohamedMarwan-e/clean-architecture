import '../../../../Core/constants.dart';
import '../../../../Core/utils/api_services.dart';
import '../Models/movies_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieDetails>> getAllMovies();
}


class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiService apiService;
  MovieRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieDetails>> getAllMovies() async{
    final response = await apiService.get(
        endPoint: Constants.movie,
        query: {
          "api_key": Constants.apiKey,
        }
    );
    PopularMovieModel popularMovieModel = PopularMovieModel.fromJson(response.data);

    return popularMovieModel.results!;
  }

}