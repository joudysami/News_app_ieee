import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app/core/constant/api_endpoints.dart';
import 'package:news_app/core/data/data_source/news_data_source.dart';
import 'package:news_app/core/data/model/article_news_responced/article_news.dart';
import 'package:news_app/core/data/model/article_news_responced/source.dart';
import 'package:news_app/core/network/api_client.dart';

class NewsDataSourceImple implements NewsDataSource {
  final Dio _apiClient = ApiClient.dio;

  @override
  Future<ArticleNews> getNews({required String sourceId}) async {
    try {
      final response = await _apiClient.get(
        '/top-headlines',
        queryParameters: {"sources": sourceId, "apiKey": ApiEndpoints.apiKey},
      );
      log("response${response.data}");
      if (response.statusCode == 200) {
        return ArticleNews.fromJson(response.data);
      }
    } catch (e) {
      log("error${e.toString()}");
    }
    throw Exception("Something went wrong");
  }

  @override
  Future<List<Source>> getSource({String? category}) async {
    try {
      final response = await _apiClient.get(
        'top-headlines/sources',
        queryParameters: {"category": category, "apiKey": ApiEndpoints.apiKey},
      );

      if (response.statusCode == 200) {
        log("response is 200000000000000000000000000000000 in get Sources");

        return List<Source>.from(
            (response.data['sources'] as List).map((e) => Source.fromJson(e)));
      }
    } catch (e) {
      log("error${e.toString()}");
    }
    throw Exception("Something went wrong");
  }
}
