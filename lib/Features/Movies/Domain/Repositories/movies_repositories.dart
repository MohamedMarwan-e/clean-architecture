import 'package:dartz/dartz.dart';
import 'package:movie_app/Core/errors/failures.dart';

import '../Entities/movie.dart';


abstract class MoviesRepository {

  Future<Either<Failure,List<Movie>>> fetchMoviesData();

}