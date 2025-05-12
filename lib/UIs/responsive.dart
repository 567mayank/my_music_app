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
    double percentage = 100,
    bool width = false,
    bool height = false,
    double? parentHeight,
    double? parentWidth,
  }) {
    // just to make sure parameters passed are correct
    assert(
      !(width == true && height == true),
      "width and height cannot be true at the same time",
    );
    assert(
      percentage > 0 && percentage <= 100,
      "percentage must be greater than 0 and less than or equal to 100",
    );
    assert(
      (parentHeight == null && parentWidth == null) ||
          (parentHeight != null && parentWidth != null),
      "parentHeight and parentWidth must be provided or none of them",
    );

    // getting the reference height and width based on the parent height and width
    double referenceHeight = parentHeight ?? deviceHeight!;
    double referenceWidth = parentWidth ?? deviceWidth!;

    // returning the pixel value based on the width or height
    if (width) {
      return referenceWidth * (percentage / 100);
    } else if (height) {
      return referenceHeight * (percentage / 100);
    }
    return min(referenceWidth, referenceHeight) * (percentage / 100);
  }

  static double getPixel(
    double percentage, {
    double? parentHeight,
    double? parentWidth,
  }) {
    return getPixelUsingPercentage(
      percentage: percentage,
      parentHeight: parentHeight,
      parentWidth: parentWidth,
    );
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
