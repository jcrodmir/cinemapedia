import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';


class MovieRepositoryImpl extends MovieRepository {

  final MovieDataSource datasource;
  MovieRepositoryImpl(this.datasource);

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // TODO: implement getPopular
    return datasource.getPopular(page:page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // TODO: implement getTopRated
    return datasource.getTopRated();
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    return datasource.getPopular();
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    // TODO: implement getMovieById
    return datasource.getMovieById(id);
  }

  

}