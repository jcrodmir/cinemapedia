import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider= Provider<List<Movie>>((ref){
  final nowPlayinhMovies=ref.watch(nowPlayingMoviesProvider);

  if(nowPlayinhMovies.isEmpty) return[];

  return nowPlayinhMovies.sublist(0,6);
});