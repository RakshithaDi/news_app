// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/common/theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String labelText;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  bool? obscureText;
  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.inputFormatters,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      cursorColor: Colors.black,
      style: const TextStyle(color: AppTheme.textFiledInputTextColor),
      cursorErrorColor: AppTheme.textFiledErrorColor,
      decoration: InputDecoration(
        labelText: labelText,
        errorStyle: const TextStyle(color: AppTheme.textFiledErrorColor),
        labelStyle: const TextStyle(color: AppTheme.textFiledLabelColor),
        fillColor: Colors.white,
        filled: true,
        errorMaxLines: 3,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppTheme.textFiledErrorColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppTheme.textFiledErrorColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      //inputFormatters: inputFormatters,
      validator: validator,
    );
  }
}
