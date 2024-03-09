import 'package:flutter/material.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/common/utils/screen_size_util.dart';
import 'package:news_app/features/authentication/screens/user_sign_in/user_sign_in.dart';
import 'package:news_app/features/authentication/screens/user_sign_up/user_sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: Builder(builder: (context) {
        ScreenSizeUtil.init(context);
        return ScreenSignIn();
      }),
    );
  }
}
