import 'package:flutter/material.dart';
import 'package:my_music_app/UIs/Screens/SearchResult/search_result_controller.dart';
import 'package:my_music_app/utils.dart';
import '../../../api_for_data_fetching2.dart';
import '../../../enum.dart';

class SearchControllerClass {
  static final TextEditingController searchController = TextEditingController();
  static var fetchingResult = FetchingStatus.nothing;
  static List<String> results = [];
  static BuildContext? context;

  static ValueNotifier<FetchingStatus> fetchingResultNotifier = ValueNotifier(
    FetchingStatus.nothing,
  );

  static void onChange(String value) {
    value = validateSearch(value) ?? "";
    if (value == "") {
      return;
    }
    ApiForDataFetching2.searchForSuggestions(value);
  }

  static void onSubmit(String value) {
    value = validateSearch(value) ?? "";
    if (context != null && value != "") {
      ApiForDataFetching2.getSearchResultForAll(value);
      SearchResultController.searchQuery = value;
      Navigator.pushNamed(
        context!,
        '/searchResult',
        arguments: {"searchQuery": value},
      );
    }
  }
}
