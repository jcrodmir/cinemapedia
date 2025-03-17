import 'package:cinemapedia/config/app_router.dart';
import 'package:cinemapedia/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

