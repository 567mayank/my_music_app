import 'package:flutter/material.dart';
import '../../apis_for_data_fetching.dart';
import '../../enum.dart';

class SearchControllerClass {
  static final TextEditingController searchController = TextEditingController();
  static var fetchingResult = FetchingStatus.nothing;
  static Map<String, dynamic> results = {};

  static ValueNotifier<FetchingStatus> fetchingResultNotifier =
      ValueNotifier(FetchingStatus.nothing);

  static void onChange(String value) {
    // print("mayank $value");
  }

  static void onSubmit(String value) {
    validateSearch(value);
  }

  static void validateSearch(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return;
    }

    String searchQuery = value.trim().split(" ").join("%20");
    ApiForDataFetching.fetchResults(
        api: "${ApiForDataFetching.baseUrl}${ApiForDataFetching.globalSearch}",
        query: searchQuery);
  }
}
