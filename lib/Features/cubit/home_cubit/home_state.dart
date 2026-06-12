import 'package:news_app/core/data/model/article_news_responced/article_news.dart';
import 'package:news_app/core/data/model/article_news_responced/source.dart';
import 'package:news_app/core/state/app_status.dart';

class HomeState {
  final AppStatus getNewsStatus;
  final AppStatus getSourceStatus;
  final ArticleNews? responseNewsArticle;
  final List<Source>? source;
  HomeState({this.getNewsStatus = AppStatus.initial, this.responseNewsArticle, this.source, required this.getSourceStatus});
  HomeState copyWith({
    AppStatus? getNewsStatus,
    ArticleNews? responseNewsArticle,
    List<Source>? source,
    AppStatus? getSourceStatus,
  }) {
    return HomeState(
      getNewsStatus: getNewsStatus ?? this.getNewsStatus,
      responseNewsArticle: responseNewsArticle ?? this.responseNewsArticle,
      source: source ?? this.source,
       getSourceStatus: getSourceStatus ?? this.getSourceStatus,
    );
  }
}
