import 'package:flutter/material.dart';
import 'package:my_music_app/UIs/Screens/SearchResult/search_result_controller.dart';
import 'package:my_music_app/enum.dart';
import 'search_result_widgets.dart';
import 'package:my_music_app/UIs/Widgets/bottom_navigation_bar.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    super.initState();
    SearchResultController.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          header(),
          optionsScroller(),
          ValueListenableBuilder(
            valueListenable: SearchResultController.searchResultTypeNotifier,
            builder: (context, value, child) {
              if (value == SearchResultType.all) {
                return allResult();
              } else if (value == SearchResultType.songs) {
                return Container();
              } else if (value == SearchResultType.albums) {
                return Container();
              } else if (value == SearchResultType.artists) {
                return Container();
              }
              return Container();
            },
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBarWidget(),
    );
  }
}

Widget allResult() {
  return ValueListenableBuilder(
    valueListenable: SearchResultController.allSearchResultNotifier,
    builder: (context, value, child) {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              songColumn(value["songs"] ?? []),
              albumColumn(value["albums"] ?? []),
              artistColumn(value["artists"] ?? []),
              // ...playlistList(value["playlists"] ?? []),
            ],
          ),
        ),
      );
    },
  );
}
