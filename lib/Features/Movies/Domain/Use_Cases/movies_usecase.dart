import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../Entities/movie.dart';
import '../Repositories/movies_repositories.dart';

class GetAllMoviesUseCase {
  final MoviesRepository moviesRepository;
  GetAllMoviesUseCase(this.moviesRepository);


  Future<Either<Failure, List<Movie>>> call() async {
    return await moviesRepository.fetchMoviesData();
  }
}