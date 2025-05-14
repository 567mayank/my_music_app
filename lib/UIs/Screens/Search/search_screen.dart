import 'package:flutter/material.dart';
import 'package:my_music_app/UIs/Screens/Search/search_widgets.dart';
import 'package:my_music_app/UIs/Widgets/bottom_navigation_bar.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(children: [searchBar(), recommendationList()]),
        bottomNavigationBar: bottomNavigationBarWidget(),
      ),
    );
  }
}
