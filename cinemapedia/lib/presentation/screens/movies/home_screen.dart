import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen
 extends StatelessWidget {

  static const name="home-screen";
  const HomeScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView()

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
  void initState(){
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  
  }


  @override
  Widget build(BuildContext context) {

    final nowPlayinhMovies= ref.watch(nowPlayingMoviesProvider);

    if(nowPlayinhMovies.isEmpty) return CircularProgressIndicator();

    return ListView.builder(
      itemCount: nowPlayinhMovies.length,
      itemBuilder: (context, index) {
        final movie= nowPlayinhMovies[index];
        return ListTile(
          title: Text(movie.title),

        );
      },
    );
  }
}