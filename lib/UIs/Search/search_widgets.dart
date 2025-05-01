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

Widget recommendationList() {
  return ValueListenableBuilder(
    valueListenable: SearchControllerClass.fetchingResultNotifier,
    builder: (context, value, child) {
      if (value != FetchingStatus.nothing &&
          SearchControllerClass.results.isNotEmpty) {
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
