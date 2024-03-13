import 'package:flutter/material.dart';
import 'package:news_app/common/localization/english_content.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/features/authentication/providers/sign_in_provider.dart';
import 'package:news_app/features/authentication/screens/user_sign_in/user_sign_in.dart';
import 'package:news_app/features/home/screens/navigation_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  //check user authentication before navigate to next screen
  Future<void> checkUserAuthentication() async {
    final newsUpdatesProvider =
        Provider.of<SigninProvider>(context, listen: false);
    bool isAuthenticated = await newsUpdatesProvider.isAuthenticated();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (isAuthenticated) {
        //navigate to home screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationScreen(),
            ));
      } else {
        //navigate to sign in screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenSignIn(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Color.fromARGB(255, 252, 99, 107),
                  Color.fromARGB(255, 250, 146, 151),
                  Color.fromARGB(255, 250, 194, 196)
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  app_logo_name,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Image.asset(
                  APP_LOGO,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
