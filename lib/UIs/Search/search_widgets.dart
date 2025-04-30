import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/UIs/Search/search_controller.dart';
import 'package:my_music_app/app_controller.dart';
import 'package:my_music_app/enum.dart';

Widget searchBar() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0.0),
    child: TextField(
      controller: SearchControllerClass.searchController,
      style: const TextStyle(color: ThemeClass.textColor),
      maxLines: 1,
      cursorColor: ThemeClass.secondaryColor,
      decoration: InputDecoration(
        hintText: 'Search songs, artists, albums...',
        hintStyle: const TextStyle(color: ThemeClass.secondaryColor),
        prefixIcon: const Icon(Icons.search, color: ThemeClass.secondaryColor),
        // suffixIcon: SearchControllerClass.searchController.text.isNotEmpty
        //     ? IconButton(
        //         icon: const Icon(Icons.clear,
        //             color: ThemeClass.secondaryColor),
        //         onPressed: () {
        //           setState(() {
        //             SearchControllerClass.searchController.clear();
        //           });
        //         },
        //       )
        //     : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ThemeClass.secondaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ThemeClass.secondaryColor),
        ),
      ),
      onChanged: (value) {
        SearchControllerClass.onChange(value);
      },
      onSubmitted: (value) {
        SearchControllerClass.onSubmit(value);
      },
    ),
  );
}

// class SearchResultCard extends StatefulWidget {
//   const SearchResultCard({super.key});

//   @override
//   State<SearchResultCard> createState() => _SearchResultCardState();
// }

// class _SearchResultCardState extends State<SearchResultCard> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: SearchControllerClass.fetchingResultNotifier,
//       builder: (context, value, child) {
//         if (value == FetchingStatus.success) {
//           return Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   searchResultCard(
//                     "Top",
//                     SearchControllerClass.results['topQuery'] ?? [],
//                   ),
//                   searchResultCard(
//                     "Songs",
//                     SearchControllerClass.results['songs'] ?? [],
//                   ),
//                   searchResultCard(
//                     "Albums",
//                     SearchControllerClass.results['albums'] ?? [],
//                   ),
//                   searchResultCard(
//                     "Artists",
//                     SearchControllerClass.results['artists'] ?? [],
//                   ),
//                   searchResultCard(
//                     "Playlists",
//                     SearchControllerClass.results['playlists'] ?? [],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//         return Container(
//           child: Text("Nothing to show", style: TextStyle(color: Colors.white)),
//         );
//       },
//     );
//   }

//   Widget searchResultCard(String title, List<dynamic> data) {
//     if (data.isEmpty) {
//       return Container();
//     }
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 35,
//                   fontWeight: FontWeight.w600,
//                   color: ThemeClass.textColor,
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: List.generate(data.length, (index) {
//               return searchResultTile(data[index]);
//             }),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget searchResultTile(dynamic data) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               data['image'][AppController.getQuality()]['url'],
//               width: 60,
//               height: 60,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(
//                   width: 60,
//                   height: 60,
//                   color: ThemeClass.secondaryColor,
//                   child: const Icon(
//                     Icons.music_note,
//                     color: ThemeClass.primaryColor,
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data['title'],
//                   style: const TextStyle(
//                     color: ThemeClass.textColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   data['singers'] ?? '',
//                   style: const TextStyle(
//                     color: ThemeClass.secondaryColor,
//                     fontSize: 14,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

Widget recommendationList() {
  // List<String> results = [
  //   "WAVY (OFFICIAL VIDEO) KARAN AUJLA",
  //   "LATEST PUNJABI SONGS 2024",
  //   "URL: VXN6kouNNtQ",
  // ];
  return ValueListenableBuilder(
    valueListenable: SearchControllerClass.fetchingResultNotifier,
    builder: (context, value, child) {
      if (value != FetchingStatus.nothing && SearchControllerClass.results.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            itemCount: SearchControllerClass.results.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: ThemeClass.secondaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        SearchControllerClass.results[index],
                        style: const TextStyle(
                          color: ThemeClass.textColor,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "Nothing to show",
          style: TextStyle(color: ThemeClass.textColor),
        ),
      );
    },
  );
}
