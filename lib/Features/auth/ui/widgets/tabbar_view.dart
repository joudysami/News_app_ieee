
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:news_app/Features/auth/ui/widgets/view_news.dart';
import 'package:news_app/Features/cubit/home_cubit/home_cubit.dart';
import 'package:news_app/Features/cubit/home_cubit/home_state.dart';
import 'package:news_app/core/data/model/article_news_responced/source.dart';
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
    return TabBarView(
      children: List.generate(
        sources.length,
        (_) => BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit,
          buildWhen: (previous, current) {
            return previous.responseNewsArticle !=
                current.responseNewsArticle;
          },
          builder: (context, state) {
            return state.getNewsStatus.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: state.responseNewsArticle?.articles
                            ?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return ViewNews(
                        url: state.responseNewsArticle?.articles?[index].url,
                        content:state.responseNewsArticle?.articles?[index].content ,
                        title: state.responseNewsArticle
                                ?.articles?[index].title ??
                            '',
                        description: state.responseNewsArticle
                                ?.articles?[index].description ??
                            '',
                        imageurl: state.responseNewsArticle
                                ?.articles?[index].urlToImage ??
                            '',
                        publishedAt: state.responseNewsArticle
                                ?.articles?[index].publishedAt ??
                            '',
                        author:
                            '${state.responseNewsArticle?.articles?[index].author ?? ""}',
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
