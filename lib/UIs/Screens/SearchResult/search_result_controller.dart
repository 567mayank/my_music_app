import 'package:dart_ytmusic_api/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_music_app/enum.dart';

class SearchResultController {
  static BuildContext? context;
  static String searchQuery = "";

  static ValueNotifier<SearchResultType> searchResultTypeNotifier =
      ValueNotifier(SearchResultType.all);

  // for storing all search result
  static ValueNotifier<Map<String, List<dynamic>>> allSearchResultNotifier =
      ValueNotifier({
        "songs": [],
        "artists": [],
        "albums": [],
        "playlists": [],
      });

  // for storing song result
  static ValueNotifier<List<SongDetailed>> songResultNotifier = ValueNotifier(
    [],
  );

  // for storing artist result
  static ValueNotifier<List<ArtistDetailed>> artistResultNotifier =
      ValueNotifier([]);

  // for storing album result
  static ValueNotifier<List<AlbumDetailed>> albumResultNotifier = ValueNotifier(
    [],
  );

  // for storing playlist result
  static ValueNotifier<List<PlaylistDetailed>> playlistResultNotifier =
      ValueNotifier([]);
}
