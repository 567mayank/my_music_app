import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/app_controller.dart';
import 'package:my_music_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppController.initGame(
      context,
    ); // initializing the game like yt music api and screen size

    return MaterialApp(
      initialRoute: "/search",
      routes: routes,
      title: 'May Music App',
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeClass.backgroundColor,
        useMaterial3: true,
        splashColor: Colors.transparent,
      ),
    );
  }
}
