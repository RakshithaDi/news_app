import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  String buttonTitle;
  void Function() onPressed;
  CustomSaveButton(
      {super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          // Add onPressed callback
          onPressed();
        },
        style: ButtonStyle(
          // Configure the button's background color with a gradient
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsetsDirectional.zero),
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.transparent), // Set background color to transparent
          overlayColor: MaterialStateProperty.all<Color>(Colors
              .transparent), // Set overlay color to transparent to remove the default splash effect
          elevation: MaterialStateProperty.all<double>(
              0), // Set elevation to 0 to remove the default shadow
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(
                  color: Colors
                      .transparent), // Set the border side color to transparent to remove the default border
            ),
          ),
        ),
        child: Container(
          width: double.maxFinite,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                  width: 0,
                  color: const Color(0xFFFFB3B6)), // Add a grey color border
              gradient: const LinearGradient(
                colors: [Color(0xFFFF3A44), Color(0xFFFF8086)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: Text(
                buttonTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold), // Specify text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
