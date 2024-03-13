import 'package:flutter/material.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/features/home/providers/hot_updates_provider.dart';
import 'package:news_app/features/home/utils/news_date_time_converter.dart';
import 'package:news_app/features/home/widgets/notifcation_news_thumbnail.dart';
import 'package:provider/provider.dart';

class NewsNotificationScreen extends StatelessWidget {
  const NewsNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsUpdatesProvider =
        Provider.of<HotUpdatesProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Hot Updates",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFFFF3A44),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: RefreshIndicator(
            onRefresh: () async {
              newsUpdatesProvider.callTopHeadlinesGetAPI();
            },
            child: SingleChildScrollView(
              child: Consumer<HotUpdatesProvider>(
                  builder: (context, newsUpdatesProvider, _) {
                return newsUpdatesProvider.isLatestNewsLoading
                    ? LinearProgressIndicator()
                    : Column(
                        children: [
                          for (int i = 0;
                              i < newsUpdatesProvider.articles!.length;
                              i++)
                            NewsThumbnailItem(
                              publishDate: NewsDateTimeConverter.formatDate(
                                  newsUpdatesProvider
                                          .articles![i].publishedAt ??
                                      ""),
                              publishedBy:
                                  'Published by ${newsUpdatesProvider.articles![i].author ?? "N/A"}',
                              title: newsUpdatesProvider.articles![i].title ??
                                  "N/A",
                              imagePath:
                                  newsUpdatesProvider.articles![i].urlToImage ??
                                      "",
                              content: newsUpdatesProvider
                                      .articles![i].description ??
                                  "N/A",
                            ),
                        ],
                      );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
