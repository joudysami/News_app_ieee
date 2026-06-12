import 'package:flutter/material.dart';
import 'package:news_app/Features/auth/ui/widgets/tabbar_view.dart';
import 'package:news_app/Features/cubit/home_cubit/home_cubit.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/data/model/article_news_responced/source.dart';

class tabbar extends StatelessWidget {
  const tabbar({
    super.key,
    required this.sources,
    required HomeCubit homeCubit,
  }) : _homeCubit = homeCubit;

  final List<Source> sources;
  final HomeCubit _homeCubit;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Column(children: [
        TabBar(
          dividerColor: AppColor.black,
          indicatorColor: AppColor.black,
          labelColor: AppColor.white,
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColor.white,
          labelStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.white),
          onTap: (value) {
            final sourceId = sources[value].id;
            if (sourceId == null || sourceId.isEmpty) return;
            _homeCubit.selectSourceId(sourceId);
            _homeCubit.getNews();
          },
          tabs: sources
              .map((source) => Tab(
                    text: source.name ?? "",
                  ))
              .toList(),
        ),
        Expanded(
          child: tabbar_view(
            sources: sources,
            homeCubit: _homeCubit,
          ),
        ),
      ]),
    );
  }
}
