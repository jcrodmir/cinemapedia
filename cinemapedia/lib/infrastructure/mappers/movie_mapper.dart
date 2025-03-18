//Leer modelos y crear mi entidad
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';



class MovieMapper {
  static Movie movieDBToentity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != "" 
    ? "https://image.tmdb.org/t/p/w400/${moviedb.backdropPath}"
    :"https://www.redbubble.com/es/i/poster/404-No-encontrado-de-BrainChaos/147174010.LVTDI",
    genreIds: moviedb.genreIds.map((e)=> e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != '' 
    ?"https://image.tmdb.org/t/p/w500/${moviedb.posterPath}"
    :"no-poster",
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
