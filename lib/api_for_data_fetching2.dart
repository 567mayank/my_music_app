import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:my_music_app/UIs/Search/search_controller.dart';
import 'package:my_music_app/enum.dart';

class ApiForDataFetching2 {
  static final ytmusic = YTMusic();

  static Future<void> search(String query) async {
    await ytmusic.initialize();
    SearchControllerClass.fetchingResultNotifier.value = FetchingStatus.loading;
    SearchControllerClass.results = await ytmusic.getSearchSuggestions(query);
    SearchControllerClass.fetchingResultNotifier.value = FetchingStatus.success;
    List<SearchResult> results = await ytmusic.search(query);

    // results.forEach((result) {
    //   // print("mayank ${result.toString()}");
    //   print("mayank ${result.type}");
    //   if (result is VideoDetailed) {
    //     final VideoDetailed video = result;
    //     print('mayank Found Video: ${video.name}, URL: ${video.videoId}');
    //   }
    // });

    // print("mayank ${(results)}");
  }
}


// VXN6kouNNtQ