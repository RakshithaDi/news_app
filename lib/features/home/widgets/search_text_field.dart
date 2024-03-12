import 'package:flutter/material.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/common/utils/const_keys.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontFamily: Font_Family_Nunito,
          fontSize: 13,
          color: Color.fromARGB(255, 0, 0, 0)),
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        hintText: "Dogecoin to the Moon...",
        suffix: Image.asset(
          TEXT_FIELD_SEARCH_IC,
          width: 20,
          height: 20,
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
