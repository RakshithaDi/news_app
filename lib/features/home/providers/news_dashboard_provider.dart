import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/features/home/models/news_article_success_response.dart';
import 'package:news_app/features/home/services/news_api_service.dart';
import 'package:news_app/features/home/utils/news_helper.dart';

class NewsDashboardProvider extends ChangeNotifier {
  bool _isLatestNewsLoading = false;
  bool get isLatestNewsLoading => _isLatestNewsLoading;
  //for latest news data
  NewsArticleSuccessResponse? _latestNewsData = NewsArticleSuccessResponse();
  List<Articles>? get articles => _latestNewsData!.articles ?? [];
  //category wise news data
  bool _isNewsByCategoryLoading = false;
  bool get isNewsByCategoryLoading => _isNewsByCategoryLoading;
  NewsArticleSuccessResponse? _categoryNewsData = NewsArticleSuccessResponse();
  List<Articles>? get categoryArticles => _categoryNewsData!.articles ?? [];

  NewsDashboardProvider() {
    //call both two methods in constructor to load the data
    callTopHeadlinesGetAPI();
    callGetNewsByCategoryApi(
      category: NewsHelper.categoryList.first,
    );
  }

  Future<void> callTopHeadlinesGetAPI() async {
    try {
      showLoadingIndicator(true);
      _latestNewsData = await NewsApiService.getTopHeadingNews();
    } catch (e) {
      log(e.toString());
    } finally {
      hideLoadingIndicator(true);
    }
  }

  Future<void> callGetNewsByCategoryApi({
    required String category,
  }) async {
    showLoadingIndicator(false);
    try {
      _categoryNewsData =
          await NewsApiService.getNewsByCategory(category: category);
    } catch (e) {
      log(e.toString());
    } finally {
      hideLoadingIndicator(false);
    }
  }

  void showLoadingIndicator(bool isLatestNews) {
    if (isLatestNews) {
      _isLatestNewsLoading = true;
    } else {
      _isNewsByCategoryLoading = true;
    }
    notifyListeners();
  }

  void hideLoadingIndicator(bool isLatestNews) {
    if (isLatestNews) {
      _isLatestNewsLoading = false;
    } else {
      _isNewsByCategoryLoading = false;
    }
    notifyListeners();
  }
}
