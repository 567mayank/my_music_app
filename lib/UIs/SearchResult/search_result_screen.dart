import 'package:flutter/material.dart';
import 'package:my_music_app/UIs/SearchResult/search_result_controller.dart';
import 'package:my_music_app/enum.dart';
import 'search_result_widgets.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
