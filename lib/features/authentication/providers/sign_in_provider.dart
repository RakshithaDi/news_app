import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/common/utils/const_keys.dart';
import 'package:news_app/common/widgets/common_alert_boxes.dart';
import 'package:news_app/features/authentication/models/user_model.dart';
import 'package:news_app/features/authentication/screens/user_sign_in/user_sign_in.dart';
import 'package:news_app/features/home/screens/dashboard/home_screen.dart';
import 'package:news_app/features/home/screens/navigation_screen.dart';
import 'package:news_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserModel? _loggedInUser;
  UserModel get loggedInUser => _loggedInUser ?? UserModel();

  bool get isLoading => _isLoading;

  Future<void> signIn(BuildContext context,
      {required String email, required password}) async {
    showLoadingIndicator();
    //access local storage to find email and password
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDbString = prefs.getString(userDb) ?? '[]';
    List<dynamic> userDbJson = jsonDecode(userDbString);
    List<UserModel> users =
        userDbJson.map((json) => UserModel.fromJson(json)).toList();

    // Find user with matching credentials
    UserModel? currentUser = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => UserModel(),
    );

    if (currentUser != null && currentUser.email != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(current_user, jsonEncode(currentUser.toJson()));
      _loggedInUser = currentUser;
      //navigate to home screen
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationScreen(),
          ));
    } else {
      //show success alert
      Alerts.showOkAlert(
        context,
        title: "Error",
        content: "Invalid email or password.",
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    hideLoadingIndicator();
  }

  //check whethere user is already logged in local storage
  Future<bool> isAuthenticated() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String currentUserString = prefs.getString(current_user) ?? '';
      Map<String, dynamic> currentUserJson = jsonDecode(currentUserString);
      UserModel user = UserModel.fromJson(currentUserJson);
      //if logged user is already in local storage --> navigate to main screen
      if (user.email != null && user.email!.isNotEmpty) {
        _loggedInUser = user;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    //clear logged in user from local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(current_user, "");
    _loggedInUser = UserModel();
    Navigator.pop(context);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SplashScreen()),
        (Route<dynamic> route) => false);
  }

  void showLoadingIndicator() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoadingIndicator() {
    _isLoading = false;
    notifyListeners();
  }
}
