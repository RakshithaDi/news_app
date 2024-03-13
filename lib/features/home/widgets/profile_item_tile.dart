import 'package:flutter/material.dart';

class ProfileItemTile extends StatelessWidget {
  String titie;
  String subtitle;
  ProfileItemTile({super.key, required this.titie, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              titie,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: Colors.grey,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Divider(
            color: Colors.grey,
            height: 10,
          ),
        ),
      ],
    );
  }
}
