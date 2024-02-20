part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class FetchMoviesLoading extends MoviesState {}

class FetchMoviesFailure extends MoviesState {
  final String errMessage;

  const FetchMoviesFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}

class FetchMoviesSuccess extends MoviesState {
  final List<Movie> movies;
  const FetchMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}