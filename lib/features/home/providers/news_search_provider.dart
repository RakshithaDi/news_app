import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/features/home/models/news_article_success_response.dart';
import 'package:news_app/features/home/services/news_api_service.dart';

class NewsSearchProvider extends ChangeNotifier {
  NewsArticleSuccessResponse? _newsData = NewsArticleSuccessResponse();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int get resultCount => _newsData!.totalResults ?? 0;
  List<Articles>? get articles => _newsData!.articles ?? [];

  Future<void> callNewsSearchApi({
    required String query,
    required String sortBy,
    required bool istopHeadlines,
    required String category,
  }) async {
    showLoadingIndicator();
    try {
      _newsData = await NewsApiService.searchNewsArticles(
          query: query,
          sortBy: sortBy,
          istopHeadlines: istopHeadlines,
          category: category);
    } catch (e) {
      log(e.toString());
    } finally {
      hideLoadingIndicator();
    }
  }

  void showLoadingIndicator() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoadingIndicator() {
    _isLoading = false;
    notifyListeners();
  }
}
