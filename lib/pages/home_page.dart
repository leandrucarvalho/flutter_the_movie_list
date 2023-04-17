import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_movie_list/controllers/movie_controller.dart';
import 'package:the_movie_list/models/movie_model.dart';
import 'package:the_movie_list/models/movies_model.dart';
import 'package:the_movie_list/repositories/movies_repository_imp.dart';
import 'package:the_movie_list/services/dio_service_imp.dart';
import 'package:the_movie_list/widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF606060),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Movies',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFFFFFFFF),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: _controller.onChanged,
                        )
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: ValueListenableBuilder<List<Movie>>(
                  valueListenable: _controller.searchMovies,
                  builder: (context, listMovies, _) {
                    if (listMovies.isNotEmpty) {
                      return ListView.separated(
                        itemCount: listMovies.length,
                        itemBuilder: (_, index) => CustomListCardWidget(
                          movie: listMovies[index],
                        ),
                        separatorBuilder: (_, __) => const Divider(),
                      );
                    }
                    return ValueListenableBuilder<Movies?>(
                      valueListenable: _controller.movies,
                      builder: (_, movies, __) {
                        return movies != null
                            ? ListView.separated(
                                itemCount: _controller
                                        .movies.value?.listmovies?.length ??
                                    0,
                                itemBuilder: (_, index) => CustomListCardWidget(
                                  movie: movies.listmovies![index],
                                ),
                                separatorBuilder: (_, __) => const Divider(),
                              )
                            : Lottie.asset('assets/lottie.json');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
