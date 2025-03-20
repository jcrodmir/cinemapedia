
import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularProvider.notifier).loadNextPage();
    ref.read(upcomingProvider.notifier).loadNextPage();
    ref.read(topRatedProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading= ref.watch(initialLoadingProvider);

    if(initialLoading) return FullScreenLoader();


    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularProvider);
    final upcomingMovies = ref.watch(upcomingProvider);
    final topRatedMovies = ref.watch(topRatedProvider);
    //final moviesSlides = ref.watch(moviesSlideshowProvider);

    

    if (nowPlayingMovies.isEmpty) return CircularProgressIndicator();

    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        slivers: [
      
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  CustomAppbar(),
                  MoviesSlideshow(movies: nowPlayingMovies),
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: "En cines",
                    subTitle: "Lunes 20",
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                    },
                  ),
      
                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: "Proximamente",
                    subTitle: "Este mes",
                    loadNextPage: () {
                      ref.read(upcomingProvider.notifier).loadNextPage();
                    },
                  ),
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: "Populares",
                    loadNextPage: () {
                      ref.read(popularProvider.notifier).loadNextPage();
                    },
                  ),
                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: "Mejor Calificadas",
                    subTitle: "De todos los tiempos",
                    loadNextPage: () {
                      ref.read(topRatedProvider.notifier).loadNextPage();
                    },
                  ),
      
                  const SizedBox(height: 50),
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
