import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../../Core/constants.dart';
import '../../../../../Core/widgets/custom_image.dart';
import '../../../Domain/Entities/movie.dart';
import '../../Manager/movies_bloc.dart';

class MoviesItemWidget extends StatelessWidget {
  final Movie movie;
  const MoviesItemWidget({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GetIt.I<MoviesBloc>().add(OpenMovieDialog(context,movie)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.333 - 4 ,
        child: Column(
            children: [
              CustomImage(
                Constants.imagesBaseUrl + movie.posterPath!,
                width: MediaQuery.of(context).size.width * 0.33 - 12,
                height: 200.h, horizontal: 4,
                borderRadius: BorderRadius.circular(12),
              ),
              SizedBox(height: 6.h),
              Text(movie.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white)
              ),
              SizedBox(height: 12.h),
            ]),
      ),
    );
  }
}