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
              return const AllResult();
            } else if (value == SearchResultType.songs) {
              return const SongsResult();
            } else if (value == SearchResultType.albums) {
              return const AlbumsResult();
            } else if (value == SearchResultType.artists) {
              return const ArtistsResult();
            }
            return const PlaylistsResult();
          },
        ),
      ],
    );
  }
}

class AllResult extends StatelessWidget {
  const AllResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SongsResult extends StatelessWidget {
  const SongsResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AlbumsResult extends StatelessWidget {
  const AlbumsResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ArtistsResult extends StatelessWidget {
  const ArtistsResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlaylistsResult extends StatelessWidget {
  const PlaylistsResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
