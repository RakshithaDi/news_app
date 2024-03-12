import 'package:flutter/material.dart';

class MediumSizeNewsTileItem extends StatelessWidget {
  String imagePath;
  String title1;
  String title2;
  String title3;
  MediumSizeNewsTileItem(
      {super.key,
      required this.imagePath,
      required this.title1,
      required this.title2,
      required this.title3});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 128,
      width: double.maxFinite,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(8)),
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              imagePath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title2,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                    const Spacer(),
                    Text(
                      title3,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
