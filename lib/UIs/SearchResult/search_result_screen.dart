import 'package:flutter/material.dart';
import 'package:my_music_app/UIs/SearchResult/search_result_controller.dart';
import 'package:my_music_app/enum.dart';
import 'search_result_widgets.dart';
import 'package:my_music_app/UIs/Widgets/song.dart';
import 'package:my_music_app/UIs/Widgets/playlist.dart';
import 'package:my_music_app/UIs/Widgets/artist.dart';
import 'package:my_music_app/UIs/Widgets/album.dart';

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
              ...songList(songs: value["songs"] ?? [], length: 30),
              ...albumList(
                albums: value["albums"] ?? [],
                rowCount: 1,
                columnCount: 2,
              ),
              artistList(value["artists"] ?? [], length: 4),
              // ...playlistList(value["playlists"] ?? []),
            ],
          ),
        ),
      );
    },
  );
}
