import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movieDetails/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MovieDataSource{

  final dio = Dio(BaseOptions(
    baseUrl:"https://api.themoviedb.org/3",
    queryParameters: {
      "apy_key": Enviroment.moviedb,
      "language":"es"
    },
    headers: {
      "Authorization": "Bearer ${Enviroment.movieToken}"
    }
  ));


  List<Movie> _jsonToMovie(Map<String,dynamic> json){
    final MovieDbResponse movieDbResponse= MovieDbResponse.fromJson(json);

    final List<Movie> movies=movieDbResponse.results
    .where((moviedb) => moviedb.posterPath !="no-poster",)
    .map(
      (moviedb)=> MovieMapper.movieDBToentity(moviedb)).toList();
      return movies;
  }
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{

    final response= await dio.get("/movie/now_playing",queryParameters: {
      "page":page
    } );
    return  _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async{
    final response= await dio.get("/movie/popular",queryParameters: {
      "page":page
    } );
    return  _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    final response= await dio.get("/movie/top_rated",queryParameters: {
      "page":page
    } );
    return  _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response= await dio.get("/movie/upcoming",queryParameters: {
      "page":page
    } );
    return  _jsonToMovie(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async{
    final response= await dio.get("/movie/$id");
    if(response.statusCode !=200) throw Exception("Movie with id: $id not found");

    final movieDetails= MovieDetails.fromJson(response.data);
    final Movie movie=  MovieMapper.MovieDetailsToEntity(movieDetails);
    return movie;
  }

}