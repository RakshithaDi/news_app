import 'package:flutter/material.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/common/utils/screen_size_util.dart';
import 'package:news_app/features/authentication/providers/sign_in_provider.dart';
import 'package:news_app/features/authentication/providers/sign_up_provider.dart';
import 'package:news_app/features/authentication/screens/user_sign_in/user_sign_in.dart';
import 'package:news_app/features/authentication/screens/user_sign_up/user_sign_up.dart';
import 'package:news_app/features/home/providers/hot_updates_provider.dart';
import 'package:news_app/features/home/providers/news_dashboard_provider.dart';
import 'package:news_app/features/home/providers/news_search_provider.dart';
import 'package:news_app/features/home/screens/navigation_screen.dart';
import 'package:news_app/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),
        ChangeNotifierProvider<SigninProvider>(create: (_) => SigninProvider()),
        ChangeNotifierProvider<NewsSearchProvider>(
            create: (_) => NewsSearchProvider()),
        ChangeNotifierProvider<NewsDashboardProvider>(
            create: (_) => NewsDashboardProvider()),
        ChangeNotifierProvider<HotUpdatesProvider>(
            create: (_) => HotUpdatesProvider()),
      ],
      child: MaterialApp(
        title: 'News App',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: Builder(builder: (context) {
          ScreenSizeUtil.init(context);
          return SplashScreen();
        }),
      ),
    );
  }
}
