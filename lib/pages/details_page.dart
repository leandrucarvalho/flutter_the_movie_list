import 'package:flutter/material.dart';
import 'package:the_movie_list/models/movie_model.dart';
import 'package:the_movie_list/utils/apis.utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id!,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath ?? ""),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) {
                        return child;
                      } else {
                        return const CircularProgressIndicator.adaptive();
                      }
                    },
                  ),
                ),
              ),
              Text(
                movie.overview!,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.title),
                  Text(movie.originalTitle!,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.date_range_outlined),
                  Text(
                    movie.releaseDate!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
