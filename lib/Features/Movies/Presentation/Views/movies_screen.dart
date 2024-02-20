import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Features/Movies/Presentation/Views/widgets/movie_body_widget.dart';

import '../../../../Core/widgets/my_circle_progress.dart';
import '../Manager/movies_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final bloc =  GetIt.I<MoviesBloc>();
  @override
  void initState() {
    super.initState();
    bloc.add(FetchMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Movies",style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is FetchMoviesSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Wrap(
                  children: List.generate(state.movies.length, (index) =>
                      MoviesItemWidget(movie: state.movies[index]),
                  ),
                ),
              ),
            );
          }
          else if(state is FetchMoviesFailure){
            return Center(child: Text(state.errMessage,style:const TextStyle(color: Colors.white)));
          }
          else {
            return const MyCircleProgress(color: Colors.white);
          }
        }),
    );
  }
}

