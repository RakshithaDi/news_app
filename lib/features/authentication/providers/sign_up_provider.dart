import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/common/utils/const_keys.dart';
import 'package:news_app/common/widgets/common_alert_boxes.dart';
import 'package:news_app/features/authentication/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signUp(BuildContext context, UserModel userData) async {
    //show loading indicator
    showLoadingIndicator();
    //get shared preference intance to for local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDbString = prefs.getString(userDb) ?? '[]';
    List<dynamic> userDbJson = jsonDecode(userDbString);
    List<UserModel> users =
        userDbJson.map((json) => UserModel.fromJson(json)).toList();
    // Check if user already exists
    bool userExists = users.any((user) => user.email == userData.email);
    if (userExists) {
      Alerts.showOkAlert(
        context,
        title: "Error",
        content: "User already exist with this email!",
        onPressed: () {
          Navigator.pop(context);
        },
      );
      hideLoadingIndicator();
      return;
    }

    // Add new user to the list
    users.add(userData);

    // Save updated user list to shared preferences
    await prefs.setString(
        userDb, jsonEncode(users.map((user) => user.toJson()).toList()));
    //show success alert
    Alerts.showOkAlert(
      context,
      title: "Success",
      content: "User created successfully!",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    //hide loading indicator
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
