import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  FullScreenLoader({super.key});

  final messages= <String>[
    "Cargando peliculas",
    "Comprando Peliculas",
    "Cargando populares",
    "Ya estamos",
  ];

  Stream<String> getLoadingMessages(){
    return Stream.periodic(const Duration(milliseconds: 1200), (step){
      return messages[step];
    }).take(messages.length);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Espere"),
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 10,),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if(!snapshot.hasData) return Text("Cargando");

              return Text(snapshot.data!);
            },)
        ],
      ),
    );
  }
}