import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/features/home/screens/dashboard/home_screen.dart';
import 'package:news_app/features/home/screens/news%20details%20view/news_details_view.dart';
import 'package:news_app/features/home/screens/profile/my_profile_view.dart';
import 'package:news_app/features/home/widgets/nav_bar_item.dart';

import '../../../common/utils/assets_paths.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedNavIndex = 0;

  Widget _getScreen() {
    if (selectedNavIndex == 0) {
      return HomeScreen();
    } else if (selectedNavIndex == 1) {
      return const Center(
        child: Text("Favourite Screen"),
      );
    } else {
      return MyProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _getScreen(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.only(bottom: 5),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 20),
                          blurRadius: 20,
                        )
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          NavBarItem(
                            iconPath: selectedNavIndex == 0
                                ? HOME_ACTIVE_IC
                                : HOME_INACTIVE_IC,
                            itemIndex: 0,
                            selectedIndex: selectedNavIndex,
                            onTap: (index) {
                              setState(() {
                                selectedNavIndex = index;
                              });
                            },
                            title: "Home",
                          ),
                          Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 10),
                                height: 4,
                                width: 32,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                ),
                              ),
                              NavBarItem(
                                iconPath: selectedNavIndex == 1
                                    ? FAVOURITE_ACTIVE_IC
                                    : FAVOURITE_INACTIVE_IC,
                                itemIndex: 1,
                                selectedIndex: selectedNavIndex,
                                onTap: (index) {
                                  setState(() {
                                    selectedNavIndex = index;
                                  });
                                },
                                title: "Favourtie",
                              ),
                            ],
                          ),
                          NavBarItem(
                            iconPath: selectedNavIndex == 2
                                ? PROFILE_ACTIVE_IC
                                : PROFILE_INACTIVE_IC,
                            itemIndex: 2,
                            selectedIndex: selectedNavIndex,
                            onTap: (index) {
                              setState(() {
                                selectedNavIndex = index;
                              });
                            },
                            title: "Profile",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
