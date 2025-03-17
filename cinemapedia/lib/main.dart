import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinemapedia/config/app_router.dart';
import 'package:cinemapedia/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(
    ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     routerConfig: appRouter,
     debugShowCheckedModeBanner: false,
     theme: AppTheme().getTheme(),
     
     );
    
  }
}

