import 'package:flutter/material.dart';

class AppTheme {
  //define app colors here
  static const Color primaryColor = Colors.white;
  static const Color scaffoldColor = Colors.white;

  static const LinearGradient linearGradientStyle = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3A44), // Starting color
      Color(0xFF8086), // Ending color
    ],
  );

  //light theme
  static final lightTheme = ThemeData(
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: "MadimiOne",
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldColor,
  );
}
