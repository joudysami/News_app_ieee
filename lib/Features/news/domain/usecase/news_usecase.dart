import 'package:news_app/Features/news/data/models/article_news_responced/article_news.dart';
import 'package:news_app/Features/news/domain/repo/news_data_source.dart';

class NewsUsecase {
  final NewsDataSource _newsDataSource;
  NewsUsecase(this._newsDataSource);

  Future<ArticleNews> getNews({required String sourceId}) async {
    return await _newsDataSource.getNews(sourceId: sourceId);
  }

}