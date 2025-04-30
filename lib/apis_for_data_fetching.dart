// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:my_music_app/UIs/Search/search_controller.dart';
// import 'package:my_music_app/enum.dart';
// import 'package:my_music_app/UIs/Search/search_widgets.dart';

// class ApiForDataFetching {
//   static const String baseUrl = "https://saavn.dev/api";
//   static const String globalSearch = "/search";
//   static const String searchForSong = "/search/songs";
//   static const String searchForAlbum = "/search/albums";
//   static const String searchForArtist = "/search/artists";
//   static const String searchForPlaylist = "/search/playlists";

//   static Future<void> fetchResults({
//     required String api,
//     required String query,
//   }) async {
//     SearchControllerClass.fetchingResultNotifier.value = FetchingStatus.loading;
//     String finalUrl = "$api?query=$query";
//     final response = await http.get(Uri.parse(finalUrl));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       Map<String, dynamic> results = {};
//       results['topQuery'] = data['data']['topQuery']['results'] ?? [];
//       results['songs'] = data['data']['songs']['results'] ?? [];
//       results['albums'] = data['data']['albums']['results'] ?? [];
//       results['artists'] = data['data']['artists']['results'] ?? [];
//       results['playlists'] = data['data']['playlists']['results'] ?? [];

//       SearchControllerClass.results = results;

//       // fetchingFunction(results);

//       print("mayank +  ${results['playlists']}");
//       SearchControllerClass.fetchingResultNotifier.value =
//           FetchingStatus.success;
//     } else {
//       SearchControllerClass.fetchingResultNotifier.value = FetchingStatus.error;
//       throw Exception('Failed to load data');
//     }
//   }
// }


// // response structure
// // any api will return a json object with the following structure
// // {
// //   "status": "success",
// //   "data": {}
// // }

// // data will be a json object with the following structure
// // {
// //   objectType: "topQuery" | "songs" | "albums" | "artists" | "playlists" 
// // }

// // objectType will be one of the following
// // topQuery:
// // {
// //   results: [  // array of objects
// //     {
// //       
// //     }
// //   ]
// // }


