import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/errors/failures.dart';
import '../../Domain/Entities/movie.dart';
import '../../Domain/Repositories/movies_repositories.dart';
import '../Data_Sources/movie_remote_data_source.dart';

class MoviesImplRepo implements MoviesRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MoviesImplRepo({required this.movieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> fetchMoviesData() async{
    try{
      final remoteMovies = await movieRemoteDataSource.getAllMovies();
      return Right(remoteMovies);
    }on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}