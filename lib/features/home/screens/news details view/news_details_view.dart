import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/common/utils/screen_size_util.dart';
import 'package:news_app/features/home/models/news_article_success_response.dart';
import 'package:news_app/features/home/utils/news_date_time_converter.dart';

class NewsDetailsScreen extends StatefulWidget {
  final Articles article;
  const NewsDetailsScreen({super.key, required this.article});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey,
                    child: Image.network(
                      alignment: Alignment.topCenter,
                      widget.article.urlToImage ?? "",
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      height: ScreenSizeUtil.screenHeight * 0.5,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey,
                        height: ScreenSizeUtil.screenHeight * 0.5,
                        width: double.maxFinite,
                        child: const Icon(
                          Icons.error,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: ScreenSizeUtil.screenHeight * 0.35,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20, top: 80),
                        child: SingleChildScrollView(
                          child: Text(
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2E0505),
                            ),
                            widget.article.description ?? "",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: ScreenSizeUtil.screenHeight * 0.3),
                      child: IntrinsicHeight(
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 141),
                          width: double.maxFinite,
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFF5F5F5).withOpacity(0.5),
                                const Color(0xFF8F8F8F).withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                              child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      NewsDateTimeConverter.formatDate(
                                          widget.article.publishedAt ?? "N/A"),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF2E0505),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.article.title ?? "N/A",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2E0505),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Published by ${widget.article.author ?? "N/A"}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2E0505),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Image.asset(
                        BACK_BTN_IC,
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: Image.asset(FAB_IC),
      ),
    );
  }
}
