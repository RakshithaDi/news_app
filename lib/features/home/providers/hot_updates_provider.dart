import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/features/home/models/news_article_success_response.dart';
import 'package:news_app/features/home/services/news_api_service.dart';
import 'package:news_app/features/home/utils/news_helper.dart';

class HotUpdatesProvider extends ChangeNotifier {
  bool _isLatestNewsLoading = false;
  bool get isLatestNewsLoading => _isLatestNewsLoading;
  //for latest news data
  NewsArticleSuccessResponse? _latestNewsData = NewsArticleSuccessResponse();
  List<Articles>? get articles => _latestNewsData!.articles ?? [];

  HotUpdatesProvider() {
    callTopHeadlinesGetAPI();
  }

  Future<void> callTopHeadlinesGetAPI() async {
    try {
      showLoadingIndicator();
      _latestNewsData = await NewsApiService.getTopHeadingNews();
    } catch (e) {
      log(e.toString());
    } finally {
      hideLoadingIndicator();
    }
  }

  void showLoadingIndicator() {
    _isLatestNewsLoading = true;
    notifyListeners();
  }

  void hideLoadingIndicator() {
    _isLatestNewsLoading = false;
    notifyListeners();
  }
}
