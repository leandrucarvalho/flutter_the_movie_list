import 'package:flutter/material.dart';
import 'package:the_movie_list/models/movie_model.dart';
import 'package:the_movie_list/pages/details_page.dart';
import 'package:the_movie_list/utils/apis.utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsPage(movie: movie),
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: const Color(0xFF404040),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title!,
                      style: Theme.of(context).textTheme.titleMedium,
                      softWrap: true,
                    ),
                    const Spacer(),
                    Text('Popularidade: ${movie.popularity}'),
                    const Spacer(),
                    Text('Votos: ${movie.voteAverage}'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
