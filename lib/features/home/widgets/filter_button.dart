import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  String buttonTitle;
  String imagePath;
  void Function() onPressed;
  bool isSelected;
  FilterButton(
      {super.key,
      required this.imagePath,
      required this.isSelected,
      required this.buttonTitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
              width: 2,
              color: isSelected
                  ? const Color(0xFFFFB3B6)
                  : Color(0xFFF0F1FA)), // Add a grey color border
          gradient: LinearGradient(
            colors: isSelected
                ? [Color(0xFFFF3A44), Color(0xFFFF8086)]
                : [Colors.white, Colors.white], // Specify your gradient colors
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 10,
                width: 11,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                buttonTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white : Color(0xFF2E0505),
                ), // Specify text color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
