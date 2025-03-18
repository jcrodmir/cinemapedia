import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
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
