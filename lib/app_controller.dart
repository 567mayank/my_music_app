import 'package:flutter/material.dart';
import 'package:my_music_app/api_for_data_fetching2.dart';
import 'package:my_music_app/UIs/responsive.dart';
class AppController {
  static void initGame(BuildContext context) {
    ApiForDataFetching2.initYtMusic();
    Responsive.initScreenSize(context);
    return;
  }
}
