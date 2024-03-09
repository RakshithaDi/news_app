import 'package:flutter/material.dart';

class ScreenSizeUtil {
  static late double _screenWidth;
  static late double _screenHeight;

  static void init(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

  static double get screenWidth => _screenWidth;

  static double get screenHeight => _screenHeight;
}
