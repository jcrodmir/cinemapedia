import 'package:cinemapedia/domain/entities/movie.dart';
//Llamamos al datasource
abstract class MovieRepository{

  Future<List<Movie>>getNowPlaying({ int page=1});


}