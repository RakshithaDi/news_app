import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/localization/english_content.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/common/utils/const_keys.dart';
import 'package:news_app/features/home/models/news_article_success_response.dart';
import 'package:news_app/features/home/providers/news_dashboard_provider.dart';
import 'package:news_app/features/home/screens/news%20details%20view/news_details_view.dart';
import 'package:news_app/features/home/screens/notificaitions/news_notification.dart';
import 'package:news_app/features/home/screens/news%20search/news_search_screen.dart';
import 'package:news_app/features/home/utils/news_date_time_converter.dart';
import 'package:news_app/features/home/utils/news_helper.dart';
import 'package:news_app/features/home/widgets/custom_category_button.dart';
import 'package:news_app/features/home/widgets/latest_news_tile.dart';
import 'package:news_app/features/home/widgets/medium_size_news_tile.dart';
import 'package:news_app/features/home/widgets/nav_bar_item.dart';
import 'package:news_app/features/home/widgets/search_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = NewsHelper.categoryList.first;

  @override
  Widget build(BuildContext context) {
    final newsDashboardProvider =
        Provider.of<NewsDashboardProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: RefreshIndicator(
            onRefresh: () async {
              newsDashboardProvider.callTopHeadlinesGetAPI();
              newsDashboardProvider.callGetNewsByCategoryApi(
                  category: selectedCategory);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: SearchTextField(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsSearchScreen(),
                              ));
                        },
                        controller: _searchController,
                        suffixIconPath: TEXT_FIELD_SEARCH_IC,
                        onSuffixTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsSearchScreen(),
                              ));
                        },
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      InkResponse(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NewsNotificationScreen(),
                              ));
                        },
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                  Consumer<NewsDashboardProvider>(
                      builder: (context, newsDashboardProvider, _) {
                    return newsDashboardProvider.isLatestNewsLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Visibility(
                            visible:
                                newsDashboardProvider.articles!.isNotEmpty ??
                                    false,
                            child: Container(
                              height: 250,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    newsDashboardProvider.articles!.length,
                                itemBuilder: (context, index) {
                                  var newsData =
                                      newsDashboardProvider.articles![index];
                                  return LatestNewsTileItem(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewsDetailsScreen(
                                            article: newsDashboardProvider
                                                .articles![index],
                                          ),
                                        ),
                                      );
                                    },
                                    imagePath: newsData.urlToImage ?? "",
                                    title1: "by ${newsData.author}",
                                    title2: newsData.title ?? "N/A",
                                    title3: newsData.description ?? "N/A",
                                  );
                                },
                              ),
                            ),
                          );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      itemCount: NewsHelper.categoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var data = NewsHelper.categoryList[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomCategoryButton(
                            buttonTitle: data,
                            isSelected: selectedCategory == data,
                            onPressed: () {
                              setState(() {
                                selectedCategory = data;
                                newsDashboardProvider.callGetNewsByCategoryApi(
                                    category: selectedCategory);
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
                  Consumer<NewsDashboardProvider>(
                      builder: (context, provider, _) {
                    return provider.isNewsByCategoryLoading
                        ? const Center(
                            child: const LinearProgressIndicator(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0;
                                  i < provider.categoryArticles!.length;
                                  i++)
                                MediumSizeNewsTileItem(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewsDetailsScreen(
                                            article:
                                                provider.categoryArticles![i],
                                          ),
                                        ),
                                      );
                                    },
                                    imagePath: provider
                                            .categoryArticles![i].urlToImage ??
                                        "",
                                    title1:
                                        provider.categoryArticles![i].title ??
                                            "N/A",
                                    title2:
                                        provider.categoryArticles![i].author ??
                                            "N/A",
                                    title3: NewsDateTimeConverter.formatDate(
                                        provider.categoryArticles![i]
                                                .publishedAt ??
                                            ""))
                            ],
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
