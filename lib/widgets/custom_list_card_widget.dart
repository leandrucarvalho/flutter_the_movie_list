import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_movie_list/models/movie_model.dart';
import 'package:the_movie_list/pages/details_page.dart';
import 'package:the_movie_list/thema/thema_colors.dart';
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
            color: ThemaColors.cardColor,
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
                      style: const TextStyle(
                        color: ThemaColors.primaryColor,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                      softWrap: true,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.fireFlameCurved,
                          color: Color(0xFFE25822),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Popularidade: ${movie.popularity}',
                          style: const TextStyle(
                            color: ThemaColors.primaryColor,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Votos: ${movie.voteAverage}',
                          style: const TextStyle(
                            color: ThemaColors.primaryColor,
                            fontFamily: 'Roboto',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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
