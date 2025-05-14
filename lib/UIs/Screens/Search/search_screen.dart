import 'package:flutter/material.dart';
import 'package:my_music_app/UIs/Screens/Search/search_controller.dart';
import 'package:my_music_app/UIs/Screens/Search/search_widgets.dart';
import 'package:my_music_app/UIs/Widgets/bottom_navigation_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    SearchControllerClass.context = context;
  }

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
