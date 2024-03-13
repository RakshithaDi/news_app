import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/common/constants.dart';
import 'package:news_app/common/utils/endpoints.dart';
import 'package:news_app/common/utils/logger.dart';
import 'package:news_app/common/widgets/common_alert_boxes.dart';
import 'package:news_app/features/home/models/news_article_success_response.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/main.dart';

class NewsApiService {
  static Future<NewsArticleSuccessResponse?> searchNewsArticles({
    required String query,
    required String sortBy,
    required bool istopHeadlines,
    required String category,
  }) async {
    var url = "";
    //call topheadline search url
    if (istopHeadlines) {
      url =
          '${TOP_HEADLINES_SEARCH_URL}q=$query&country=de&category=$category&from=2024-03-12&sortBy=$sortBy&apiKey=${Contants.newsApikey}';
    } else {
      url =
          '${NEWS_ARTICLE_SEARCH_URL}q=$query&from=2024-03-12&sortBy=$sortBy&apiKey=${Contants.newsApikey}';
    }

    try {
      final response = await http.get(
        Uri.parse(url),
      );
      NewsLogger.printApiResponse(response.body);
      if (response.statusCode == 200) {
        return NewsArticleSuccessResponse.fromJson(json.decode(response.body));
      } else {
        log('Error: ${response.reasonPhrase}');
      }
    } on http.ClientException catch (e) {
      log('Exception: $e');
      // Handle no internet exception
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: "No Internet",
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    } on TimeoutException catch (e) {
      log('Timeout Exception: $e');
      // Handle timeout
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: "Request Time Out!",
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    } catch (e, tracktrace) {
      log('General Exception: $e');
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: e.toString() + tracktrace.toString(),
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    }

    return NewsArticleSuccessResponse();
  }

  static Future<NewsArticleSuccessResponse?> getTopHeadingNews() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${TOP_HEADLINES_SEARCH_URL}country=us&apiKey=${Contants.newsApikey}'),
      );
      NewsLogger.printApiResponse(response.body);
      if (response.statusCode == 200) {
        return NewsArticleSuccessResponse.fromJson(json.decode(response.body));
      } else {
        log('Error: ${response.reasonPhrase}');
      }
    } on http.ClientException catch (e) {
      log('Exception: $e');
      // Handle no internet exception
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: "No Internet",
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    } on TimeoutException catch (e) {
      log('Timeout Exception: $e');
      // Handle timeout
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: "Request Time Out!",
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    } catch (e, tracktrace) {
      log('General Exception: $e');
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: e.toString() + tracktrace.toString(),
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    }

    return NewsArticleSuccessResponse();
  }

  static Future<NewsArticleSuccessResponse?> getNewsByCategory(
      {required String category}) async {
    try {
      final response = await http.get(
        Uri.parse(
            '${TOP_HEADLINES_SEARCH_URL}country=us&category=$category&apiKey=${Contants.newsApikey}'),
      );
      NewsLogger.printApiResponse(response.body);
      if (response.statusCode == 200) {
        return NewsArticleSuccessResponse.fromJson(json.decode(response.body));
      } else {
        log('Error: ${response.reasonPhrase}');
      }
    } on http.ClientException catch (e) {
      log('Exception: $e');
      // Handle no internet exception
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: "No Internet",
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    } on TimeoutException catch (e) {
      log('Timeout Exception: $e');
      // Handle timeout
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: "Request Time Out!",
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    } catch (e, tracktrace) {
      log('General Exception: $e');
      Alerts.showOkAlert(
        navigatorKey!.currentContext!,
        title: "Error",
        content: e.toString() + tracktrace.toString(),
        onPressed: () {
          Navigator.pop(navigatorKey!.currentContext!);
        },
      );
    }

    return NewsArticleSuccessResponse();
  }
}
