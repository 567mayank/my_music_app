import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:my_music_app/UIs/Screens/Search/search_controller.dart';
import 'package:my_music_app/UIs/Screens/SearchResult/search_result_controller.dart';
import 'package:my_music_app/enum.dart';

class ApiForDataFetching2 {
  static final ytmusic = YTMusic();

  static Future<void> initYtMusic() async {
    await ytmusic.initialize();
  }

  static Future<void> search(String query) async {
    SearchControllerClass.fetchingResultNotifier.value = FetchingStatus.loading;
    SearchControllerClass.results = await ytmusic.getSearchSuggestions(query);
    SearchControllerClass.fetchingResultNotifier.value = FetchingStatus.success;
  }

  static Future<void> getSearchResultForAll(String query) async {
    List<dynamic> searchResults = await ytmusic.search(query);

    // for segregating all search result into different categories
    Map<String, List<dynamic>> allSearchResult = {
      "songs": [],
      "artists": [],
      "albums": [],
      "playlists": [],
    };

    for (var res in searchResults) {
      if (res is SongDetailed || res is VideoDetailed) {
        allSearchResult["songs"]!.add(res);
      } else if (res is ArtistDetailed) {
        allSearchResult["artists"]!.add(res);
      } else if (res is AlbumDetailed) {
        allSearchResult["albums"]!.add(res);
      } else if (res is PlaylistDetailed) {
        allSearchResult["playlists"]!.add(res);
      }
    }

    // for storing search result in allSearchResultNotifier
    SearchResultController.allSearchResultNotifier.value = allSearchResult;
  }
}
