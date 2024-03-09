// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String labelText;
  String? Function(String?)? validator;
  CustomTextFormField(
      {Key? key, required this.controller, required this.labelText, validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      style: TextStyle(color: Color(0xFFA7A7A7)),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
