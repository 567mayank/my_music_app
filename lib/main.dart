import 'package:flutter/material.dart';
import 'package:my_music_app/Layout.dart';
import 'package:my_music_app/Theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'May Music App',
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeClass.backgroundColor,
        useMaterial3: true,
        splashColor: Colors.transparent,
      ),
      home: const Layout(),
    );
  }
}
