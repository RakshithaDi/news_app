import 'package:flutter/material.dart';
import 'package:news_app/common/utils/regex_keys.dart';

class TextFieldValiations {
  static String? validatePassword(String value) {
    RegExp regex = RegExp(RegexHelper.password_regex);
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 6 characters long and contain both letters and numbers.';
    }
    return null;
  }

  static String? validateEmail(String value) {
    RegExp regex = RegExp(RegexHelper.email_regex);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
}
