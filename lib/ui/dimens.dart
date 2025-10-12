import 'package:flutter/widgets.dart';

class Dimens {
  static const double bannerHeight = 140;
  static const double figmaBannerWidth = 327;
  static const double navHeight = 70;

  static EdgeInsets contentPadding(double horizontal, double top, {double bottom = 18}) =>
      EdgeInsets.fromLTRB(horizontal, top, horizontal, bottom);

  static double horizontalByScreen(double screenWidth) =>
      ((screenWidth - figmaBannerWidth) / 2).clamp(16.0, 32.0);
}
