import 'package:flutter/material.dart';
import 'package:news_app/common/utils/const_keys.dart';

class AppTheme {
  //define app colors here
  static const Color primaryColor = Colors.white;
  static const Color scaffoldColor = Colors.white;
  static const Color textFiledInputTextColor = Color(0xFFA7A7A7);
  static const Color textFiledLabelColor = Colors.black;
  static const Color textFiledErrorColor = Color(0xFFFF3A44);
  static const List<Color> primaryGradientColors = [
    Color(0xFFFF3A44),
    Color(0xFFFF8086)
  ];
  static const List<Color> formBackgroundGradientColors = [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 250, 230, 230)
  ];

  //light theme
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(primary: Color(0xFFFF8086)),
    useMaterial3: true,
    //fontFamily: "MadimiOne",
    fontFamily: Font_Family_Nunito,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldColor,
  );
}
