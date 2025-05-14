import 'package:flutter/material.dart';
import 'package:my_music_app/UIs/Widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text("Home", style: TextStyle(color: Colors.white))],
        ),
      ),
      bottomNavigationBar: bottomNavigationBarWidget(),
    );
  }
}
