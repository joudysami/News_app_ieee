import 'package:news_app/core/data/model/article_news_responced/article_news.dart';
import 'package:news_app/core/data/model/article_news_responced/source.dart';

abstract interface class NewsDataSource {
  Future<ArticleNews> getNews({required String sourceId});
  Future<List<Source>> getSource({String? category});
}
