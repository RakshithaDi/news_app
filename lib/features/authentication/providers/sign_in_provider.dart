import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/common/utils/const_keys.dart';
import 'package:news_app/common/widgets/common_alert_boxes.dart';
import 'package:news_app/features/authentication/models/user_model.dart';
import 'package:news_app/features/home/screens/home_screen.dart';
import 'package:news_app/features/home/screens/navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  bool _isLoading = false;

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

  void showLoadingIndicator() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoadingIndicator() {
    _isLoading = false;
    notifyListeners();
  }
}
