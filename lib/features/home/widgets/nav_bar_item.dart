import 'package:flutter/material.dart';
import 'package:news_app/common/utils/const_keys.dart';

class NavBarItem extends StatelessWidget {
  String iconPath;
  String title;
  int selectedIndex;
  int itemIndex;
  void Function(int index) onTap;
  NavBarItem(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.onTap,
      required this.itemIndex,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(itemIndex);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: Font_Family_Nunito,
                color: selectedIndex == itemIndex
                    ? Color(0xFF2E0505)
                    : Color(0xFFA6A6A6)),
          )
        ],
      ),
    );
  }
}
