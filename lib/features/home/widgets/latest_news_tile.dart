import 'package:flutter/material.dart';

class LatestNewsTileItem extends StatelessWidget {
  String imagePath;
  String title1;
  String title2;
  String title3;
  void Function() onTap;

  LatestNewsTileItem({
    super.key,
    required this.imagePath,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 240,
          width: 320,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(8)),
          child: Stack(
            // alignment: Alignment.center,
            children: [
              Center(
                child: Image.network(
                  imagePath,
                  cacheHeight: 300,
                  cacheWidth: 300,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                      height: 240,
                      width: 320,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: SizedBox()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      title1,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                    Text(
                      title2,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                    const Spacer(),
                    Text(
                      title3,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
