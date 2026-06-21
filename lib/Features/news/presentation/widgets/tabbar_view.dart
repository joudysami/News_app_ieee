import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:news_app/Features/news/presentation/widgets/view_news.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_state.dart';
import 'package:news_app/Features/news/data/models/article_news_responced/source.dart';
import 'package:news_app/core/state/app_status.dart';

class tabbar_view extends StatelessWidget {
  const tabbar_view({
    super.key,
    required this.sources,
    required HomeCubit homeCubit,
  }) : _homeCubit = homeCubit;

  final List<Source> sources;
  final HomeCubit _homeCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
  child: BlocBuilder<HomeCubit, HomeState>(
    bloc: _homeCubit,
    buildWhen: (previous, current) =>
        previous.responseNewsArticle != current.responseNewsArticle,
    builder: (context, state) {
      if (state.getNewsStatus.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
        itemCount:
            state.responseNewsArticle?.articles?.length ?? 0,
        itemBuilder: (context, index) {
          final article =
              state.responseNewsArticle!.articles![index];

          return ViewNews(
            url: article.url,
            content: article.content,
            title: article.title ?? '',
            description: article.description ?? '',
            imageurl: article.urlToImage ?? '',
            publishedAt: article.publishedAt ?? '',
            author: article.author ?? '',
            article: article.toJson(),
          );
        },
      );
    },
  ),
);
  }
}
