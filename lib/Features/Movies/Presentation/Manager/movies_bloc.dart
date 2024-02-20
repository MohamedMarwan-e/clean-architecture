import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/Entities/movie.dart';
import '../../Domain/Use_Cases/movies_usecase.dart';
import '../Views/movie_details_screen.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetAllMoviesUseCase getAllMoviesUseCase;

  MoviesBloc({required this.getAllMoviesUseCase}) : super(MoviesInitial()) {
    on<MoviesEvent>((event, emit) async{
      if(event is FetchMovies){
        emit(FetchMoviesLoading());
        final result = await getAllMoviesUseCase();
        result.fold((failure) {
          emit(FetchMoviesFailure(failure.errMessage));
        }, (movies) {
          emit(FetchMoviesSuccess(movies: movies));
        });
      }else if(event is OpenMovieDialog){
        showDialog(
            context: event.context,
            builder: (BuildContext context) {
              return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.1, end: 1.0),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return Opacity(opacity: value,
                      child: MovieDetailsDialog(movie: event.movie),
                    );
                  }
              );
            });
      }
    });
  }


}
