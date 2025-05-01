import 'package:dart_ytmusic_api/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_music_app/enum.dart';

class SearchResultController {
  static ValueNotifier<SearchResultType> searchResultTypeNotifier =
      ValueNotifier(SearchResultType.all);

  static Map<String, dynamic> convertSearchResultIntoMap(
    SearchResult searchResult,
  ) {
    if (searchResult is VideoDetailed) {
      return {
        "type": "video",
        "videoId": searchResult.videoId,
        "name": searchResult.name,
        "duration": searchResult.duration,
        "thumbnails": searchResult.thumbnails,
        ...convertArtistBasicIntoMap(searchResult.artist),
      };
    } else if (searchResult is ArtistDetailed) {
      return {
        "type": "artist",
        "artistId": searchResult.artistId,
        "name": searchResult.name,
        "thumbnails": searchResult.thumbnails,
      };
    } else if (searchResult is AlbumDetailed) {
      return {
        "type": "album",
        "albumId": searchResult.albumId,
        "name": searchResult.name,
        "year": searchResult.year,
        "thumbnails": searchResult.thumbnails,
        "playlistId": searchResult.playlistId,
        ...convertArtistBasicIntoMap(searchResult.artist),
      };
    } else if (searchResult is PlaylistDetailed) {
      return {
        "type": "playlist",
        "playlistId": searchResult.playlistId,
        "name": searchResult.name,
        "thumbnails": searchResult.thumbnails,
        ...convertArtistBasicIntoMap(searchResult.artist),
      };
    }
    return {};
  }

  static Map<String, dynamic> convertArtistBasicIntoMap(ArtistBasic artist) {
    return {"artistId": artist.artistId, "name": artist.name};
  }
}
