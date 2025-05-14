import 'package:dart_ytmusic_api/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_music_app/enum.dart';

class SearchResultController {
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


  // for converting search result into map
  // static Map<String, dynamic> convertSearchResultIntoMap(var searchResult) {
  //   if (searchResult is SongDetailed) {
  //     return {
  //       "type": "song",
  //       "videoId": searchResult.videoId,
  //       "name": searchResult.name,
  //       "duration": searchResult.duration,
  //       "thumbnails": searchResult.thumbnails,
  //       ...convertArtistBasicIntoMap(searchResult.artist),
  //     };
  //   } else if (searchResult is VideoDetailed) {
  //     return {
  //       "type": "video",
  //       "videoId": searchResult.videoId,
  //       "name": searchResult.name,
  //       "duration": searchResult.duration,
  //       "thumbnails": searchResult.thumbnails,
  //       ...convertArtistBasicIntoMap(searchResult.artist),
  //     };
  //   } else if (searchResult is ArtistDetailed) {
  //     return {
  //       "type": "artist",
  //       "artistId": searchResult.artistId,
  //       "name": searchResult.name,
  //       "thumbnails": searchResult.thumbnails,
  //     };
  //   } else if (searchResult is AlbumDetailed) {
  //     return {
  //       "type": "album",
  //       "albumId": searchResult.albumId,
  //       "name": searchResult.name,
  //       "year": searchResult.year,
  //       "thumbnails": searchResult.thumbnails,
  //       "playlistId": searchResult.playlistId,
  //       ...convertArtistBasicIntoMap(searchResult.artist),
  //     };
  //   } else if (searchResult is PlaylistDetailed) {
  //     return {
  //       "type": "playlist",
  //       "playlistId": searchResult.playlistId,
  //       "name": searchResult.name,
  //       "thumbnails": searchResult.thumbnails,
  //       ...convertArtistBasicIntoMap(searchResult.artist),
  //     };
  //   }
  //   return {};
  // }

  // // for converting artist basic into map
  // static Map<String, dynamic> convertArtistBasicIntoMap(ArtistBasic artist) {
  //   return {"artistId": artist.artistId, "artistName": artist.name};
  // }