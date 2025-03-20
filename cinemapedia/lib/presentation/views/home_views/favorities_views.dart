import 'package:flutter/material.dart';

class FavoritiesViews extends StatelessWidget {
  const FavoritiesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorities View"),
      ),
      body: Center(
        child: Text("Favoritos"),
      ),
    );
  }
}