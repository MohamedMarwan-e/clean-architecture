import 'package:flutter/material.dart';
import 'package:movie_app/Core/widgets/custom_image.dart';

import '../../../../Core/constants.dart';
import '../../Domain/Entities/movie.dart';

class MovieDetailsDialog extends StatelessWidget {
  final Movie movie;
  const MovieDetailsDialog({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                Constants.imagesBaseUrl + movie.posterPath!,
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height * 0.4,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(height: 10),
              Text(movie.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 10),
              Text(movie.overview,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
              ),
            ]),
        ),
      ),
    );
  }
}
