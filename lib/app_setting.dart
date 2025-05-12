import 'package:my_music_app/enum.dart';

class AppSetting {
  static Quality qualityForImages = Quality.high;

  // for getting thumbnail url index acc to quality
  static int getQualityForThumbnail(int length) {
    if (qualityForImages == Quality.high) {
      return length - 1;
    } else if (qualityForImages == Quality.medium) {
      return length ~/ 2;
    }
    return 0;
  }
}
