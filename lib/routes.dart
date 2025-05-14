import 'package:my_music_app/UIs/Screens/Home/home_screen.dart';
import 'package:my_music_app/UIs/Screens/Search/search_screen.dart';
import 'package:my_music_app/UIs/Screens/SearchResult/search_result_screen.dart';

var routes = {
  "/home": (context) => const HomeScreen(),
  "/search": (context) => const SearchScreen(),
  "/searchResult": (context) => const SearchResultScreen(),
};
