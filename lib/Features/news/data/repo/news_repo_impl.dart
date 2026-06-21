import 'package:news_app/Features/news/data/models/article_news_responced/article_news.dart';
import 'package:news_app/Features/news/data/models/article_news_responced/source.dart';
import 'package:news_app/Features/news/domain/repo/news_data_source.dart';

class NewsRepoImpl implements NewsDataSource {
  final NewsDataSource _newsDataSource;

  NewsRepoImpl(this._newsDataSource);

  @override
  Future<ArticleNews> getNews({required String sourceId}) async {
  
    return await _newsDataSource.getNews(sourceId: sourceId);
  }

  @override
  Future<List<Source>> getSource({String? category}) async {
    return await _newsDataSource.getSource(category: category);
  }
}