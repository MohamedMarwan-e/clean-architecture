part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object?> get props => [];
}
class FetchMovies extends MoviesEvent{}

class OpenMovieDialog extends MoviesEvent{
  final BuildContext context;
  final Movie movie;

  const OpenMovieDialog(this.context, this.movie);

  @override
  List<Object?> get props => [context,movie];
}