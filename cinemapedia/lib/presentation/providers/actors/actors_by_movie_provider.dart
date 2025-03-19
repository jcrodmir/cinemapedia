import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final actorsMovieProvider = StateNotifierProvider<ActorsMovieNotifier, Map<String, List<Actor>>>((ref) {
  
  final actorRepository = ref.watch( actorRepositoryProvider );

  return ActorsMovieNotifier(getActor: actorRepository.getActorsByMovie);
});



typedef GetActorCallback = Future<List<Actor>>Function(String movieId);

class ActorsMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {

  final GetActorCallback getActor;

  ActorsMovieNotifier({
    required this.getActor,
  }): super({});


  Future<void> loadActors( String movieId ) async {
    if ( state[movieId] != null ) return;
    final actor = await getActor( movieId );
    state = { ...state, movieId: actor };
  }

}