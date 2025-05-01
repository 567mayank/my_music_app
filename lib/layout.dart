import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/UIs/SearchResult/search_result_screen.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBarWidget(),
      body: const SearchResultScreen(),
    );
  }
}

Widget bottomNavigationBarWidget() {
  return BottomNavigationBar(
    backgroundColor: ThemeClass.backgroundColor,
    selectedItemColor: ThemeClass.secondaryColor,
    unselectedItemColor: ThemeClass.secondaryColor,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        label: 'Library',
      ),
    ],
  );
}
