import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';

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
            "Wavy",
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
    },
    child: Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        // color: ThemeClass.secondaryColor,
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
