import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final popularProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getPopular;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final upcomingProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getUpcoming;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final topRatedProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getTopRated;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


//tipo de función que se espera, caso de uso
typedef MovieCallback = Future<List<Movie>> Function({ int page });

// saber página actual , 
class MoviesNotifier extends StateNotifier<List<Movie>> {
  
  int currentPage = 0;
  bool isLoading=false;
  MovieCallback fetchMoreMovies;


  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super([]);

  Future<void> loadNextPage() async{
    if(isLoading) return;
    isLoading=true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies( page: currentPage );
    //añadimos a estados los estados que ya estaban mas las peliculas
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading= false;
  }


}