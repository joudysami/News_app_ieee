import 'package:news_app/Features/news/data/models/article_news_responced/source.dart';
import 'package:news_app/Features/news/domain/repo/news_data_source.dart';

class SourceUsecase {
   final NewsDataSource _newsDataSource;
  SourceUsecase(this._newsDataSource);
  Future<List<Source>> getSource({String? category}) async {
    return await _newsDataSource.getSource(category: category);

}
}