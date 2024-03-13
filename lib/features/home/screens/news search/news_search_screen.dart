import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:news_app/common/utils/assets_paths.dart";
import "package:news_app/features/home/providers/news_search_provider.dart";
import "package:news_app/features/home/screens/news%20details%20view/news_details_view.dart";
import "package:news_app/features/home/utils/news_date_time_converter.dart";
import "package:news_app/features/home/utils/news_helper.dart";
import "package:news_app/features/home/widgets/custom_category_button.dart";
import "package:news_app/features/home/widgets/custom_save_button.dart";
import "package:news_app/features/home/widgets/filter_bottom_sheet.dart";
import "package:news_app/features/home/widgets/filter_button.dart";
import "package:news_app/features/home/widgets/latest_news_tile.dart";
import "package:news_app/features/home/widgets/medium_size_news_tile.dart";
import "package:news_app/features/home/widgets/search_text_field.dart";
import "package:news_app/main.dart";
import "package:provider/provider.dart";

class NewsSearchScreen extends StatefulWidget {
  NewsSearchScreen({super.key});

  @override
  State<NewsSearchScreen> createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends State<NewsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final newsSearchProvider = Provider.of<NewsSearchProvider>(
      navigatorKey!.currentContext!,
      listen: false);
  String selectedCategory = "";
  bool istopHeadlines = false;
  List<String> selectedFilters = [];
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  //calling news search function
  void callSearchApi() {
    newsSearchProvider.callNewsSearchApi(
      query: _searchController.text.trim(),
      sortBy:
          selectedFilters.isEmpty ? "" : selectedFilters.first.toLowerCase(),
      istopHeadlines: istopHeadlines,
      category: selectedCategory,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SearchTextField(
                      controller: _searchController,
                      suffixIconPath: CLOSE_IC,
                      onChanged: (val) async {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce = Timer(Duration(milliseconds: 500), () {
                          callSearchApi();
                        });
                      },
                      onSuffixTap: () {
                        _searchController.clear();
                        callSearchApi();
                      },
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FilterButton(
                        buttonTitle: "Filter",
                        imagePath: FILTER_IC,
                        isSelected: true,
                        onPressed: () {
                          FilterBottomSheet.show(
                            this.context,
                            filters: NewsHelper.filters,
                            selectedFilters: selectedFilters,
                            onFilterPressed: () {
                              setState(() {});
                            },
                            onSaveButtonPressed: () {
                              Navigator.pop(context);
                              callSearchApi();
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
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
                                    if (selectedCategory == data) {
                                      selectedCategory = "";
                                      istopHeadlines = false;
                                      callSearchApi();
                                    } else {
                                      selectedCategory = data;
                                      istopHeadlines = true;
                                      callSearchApi();
                                    }
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<NewsSearchProvider>(
                    builder: (context, newsProvider, _) {
                  return newsProvider.isLoading
                      ? const Center(
                          child: LinearProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: newsProvider.resultCount > 0
                                        ? "About ${newsProvider.resultCount} result for "
                                        : "No results found ",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: _searchController.text,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            for (int i = 0;
                                i < newsProvider.articles!.length;
                                i++)
                              MediumSizeNewsTileItem(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewsDetailsScreen(
                                        article: newsProvider.articles![i],
                                      ),
                                    ),
                                  );
                                },
                                imagePath:
                                    newsProvider.articles![i].urlToImage ?? "",
                                title1:
                                    newsProvider.articles![i].title ?? "N/A",
                                title2:
                                    newsProvider.articles![i].author ?? "N/A",
                                title3: NewsDateTimeConverter.formatDate(
                                    newsProvider.articles![i].publishedAt ??
                                        ""),
                              )
                          ],
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
