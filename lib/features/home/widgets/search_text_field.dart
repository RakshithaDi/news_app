import 'package:flutter/material.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/common/utils/const_keys.dart';

class SearchTextField extends StatelessWidget {
  void Function() onSuffixTap;
  void Function(String)? onChanged;
  String suffixIconPath;
  TextEditingController controller;
  void Function()? onTap;
  SearchTextField(
      {super.key,
      required this.controller,
      required this.onSuffixTap,
      this.onChanged,
      this.onTap,
      required this.suffixIconPath});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      onChanged: (value) {
        onChanged != null ? onChanged!(value) : null;
      },
      style: const TextStyle(
          fontFamily: Font_Family_Nunito,
          fontSize: 13,
          color: Color.fromARGB(255, 0, 0, 0)),
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        hintText: "Dogecoin to the Moon...",
        suffixIconConstraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
        suffixIcon: GestureDetector(
          onTap: () {
            onSuffixTap();
          },
          child: Row(
            children: [
              Image.asset(
                suffixIconPath,
                width: 15,
                height: 15,
              ),
            ],
          ),
        ),
        hintStyle: const TextStyle(
            fontFamily: Font_Family_Nunito,
            fontSize: 13,
            color: Color(0xFF818181)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF0F1FA), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF0F1FA), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF0F1FA), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF0F1FA), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF0F1FA), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }
}
