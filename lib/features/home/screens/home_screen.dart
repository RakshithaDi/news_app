import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/localization/english_content.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/common/utils/const_keys.dart';
import 'package:news_app/features/home/widgets/custom_category_button.dart';
import 'package:news_app/features/home/widgets/latest_news_tile.dart';
import 'package:news_app/features/home/widgets/medium_size_news_tile.dart';
import 'package:news_app/features/home/widgets/nav_bar_item.dart';
import 'package:news_app/features/home/widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "";
  List<String> categoryList = [
    "hello",
    "news",
    "currency",
    "method",
    "home",
    "profile"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(child: SearchTextField()),
                    const SizedBox(
                      width: 15,
                    ),
                    InkResponse(
                      child: Image.asset(
                        NOTIFICATION_IC,
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest News",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: Color(0xFF0080FF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Color(0xFF0080FF),
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return LatestNewsTileItem(
                        imagePath: APP_LOGO,
                        title1: "by Ryan Browne",
                        title2:
                            "Crypto investors should be prepared to lose all their money, BOE governor says",
                        title3:
                            "“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”",
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = categoryList[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CustomCategoryButton(
                          buttonTitle: data,
                          isSelected: selectedCategory == data,
                          onPressed: () {
                            setState(() {
                              selectedCategory = data;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < 22; i++)
                  MediumSizeNewsTileItem(
                      imagePath: APP_LOGO,
                      title1:
                          "5 things to know about the 'conundrum' of lupus ddd  dd",
                      title2: "Matt Villano",
                      title3: "Sunday, 9 May 2021")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
