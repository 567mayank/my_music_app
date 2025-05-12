import 'package:flutter/material.dart';
import 'dart:math';

class Responsive {
  static BuildContext? context;
  static double? deviceWidth;
  static double? deviceHeight;
  static double? paddingTop;
  static double? paddingBottom;
  static double? paddingLeft;
  static double? paddingRight;
  static MediaQueryData? mediaQueryData;

  static void initScreenSize(BuildContext context) {
    Responsive.context = context;
    mediaQueryData = MediaQuery.of(context);

    // setting the width and height of the screen
    deviceWidth = mediaQueryData!.size.width;
    deviceHeight = mediaQueryData!.size.height;

    // setting the padding of the screen
    paddingTop = mediaQueryData!.padding.top;
    paddingBottom = mediaQueryData!.padding.bottom;
    paddingLeft = mediaQueryData!.padding.left;
    paddingRight = mediaQueryData!.padding.right;
  }

  static double getPixelUsingPercentage({
    double percentage = 1,
    bool width = false,
    bool height = false,
  }) {
    assert(
      !(width == true && height == true),
      "width and height cannot be true at the same time",
    );
    assert(
      percentage > 0 && percentage <= 1,
      "percentage must be greater than 0 and less than or equal to 1",
    );
    if (width) {
      return deviceWidth! * percentage;
    } else if (height) {
      return deviceHeight! * percentage;
    }
    return min(deviceWidth!, deviceHeight!) * percentage;
  }

  static double getScreenWidth() {
    if (deviceWidth == null) {
      initScreenSize(context!);
    }
    return deviceWidth!;
  }

  static double getScreenHeight() {
    if (deviceHeight == null) {
      initScreenSize(context!);
    }
    return deviceHeight!;
  }
}
