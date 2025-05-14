import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/UIs/Screens/SearchResult/search_result_controller.dart';
import 'package:my_music_app/UIs/Widgets/album.dart';
import 'package:my_music_app/UIs/Widgets/artist.dart';
import 'package:my_music_app/api_for_data_fetching2.dart';
import 'package:my_music_app/responsive.dart';
import 'package:my_music_app/UIs/Widgets/song.dart';

Widget header() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // for naivagting back to search screen
          },
          child: Row(
            spacing: 10,
            children: [
              Icon(
                Icons.arrow_back_ios_new_outlined,
                color: ThemeClass.textColor,
                size: 20,
              ),
              Text(
                "Search Results",
                style: TextStyle(color: ThemeClass.textColor, fontSize: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            SearchResultController.searchQuery,
            style: TextStyle(
              color: ThemeClass.textColor,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget optionsScroller() {
  List<String> options = ["All", "Songs", "Albums", "Artists", "Playlists"];
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        spacing: 10,
        children: List.generate(options.length, (index) {
          return optionBox(options[index]);
        }),
      ),
    ),
  );
}

Widget optionBox(String option) {
  return GestureDetector(
    onTap: () {
      // For displaying the results of the selected option
      ApiForDataFetching2.getSearchResultForAll(
        SearchResultController.searchQuery,
      );
    },
    child: Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeClass.textColor),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ThemeClass.textColor.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        option,
        style: TextStyle(
          color: ThemeClass.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget songColumn(List<dynamic> songs) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: Responsive.getPixelForWidth(4)),
    child: Column(
      children: [
        Column(
          children: [heading("Songs"), ...songList(songs: songs, length: 3)],
        ),
      ],
    ),
  );
}

Widget albumColumn(List<dynamic> albums) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: Responsive.getPixelForWidth(4)),
    child: Column(
      children: [
        heading("Albums"),
        ...albumList(
          albums: albums,
          rowCount: 1,
          columnCount: 2,
          margin: Responsive.getPixel(4),
        ),
      ],
    ),
  );
}

Widget artistColumn(List<dynamic> artists) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: Responsive.getPixelForWidth(4)),
    child: Column(
      children: [heading("Artists"), artistList(artists, length: 4)],
    ),
  );
}

Widget heading(String text, {bool showArrow = true, Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: Responsive.getPixel(10),
          fontWeight: FontWeight.bold,
          color: ThemeClass.textColor,
        ),
      ),
      if (showArrow)
        IconButton(
          onPressed: () {
            onTap?.call();
          },
          icon: Icon(Icons.arrow_forward, size: Responsive.getPixel(8)),
          color: ThemeClass.textColor,
        ),
    ],
  );
}
