import 'package:flutter/material.dart';
import '../../../api_for_data_fetching2.dart';
import '../../../enum.dart';

class SearchControllerClass {
  static final TextEditingController searchController = TextEditingController();
  static var fetchingResult = FetchingStatus.nothing;
  static List<String> results = [];

  static ValueNotifier<FetchingStatus> fetchingResultNotifier = ValueNotifier(
    FetchingStatus.nothing,
  );

  static void onChange(String value) {
    validateSearch(value);
  }

  static void onSubmit(String value) {
    validateSearch(value);
  }

  static void validateSearch(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return;
    }

    ApiForDataFetching2.search(value);
  }
}
