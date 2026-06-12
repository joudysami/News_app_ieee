import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/cubit/home_cubit/home_state.dart';
import 'package:news_app/core/data/data_source/news_data_source_imple.dart';
import 'package:news_app/core/state/app_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(getSourceStatus: AppStatus.initial));
  final NewsDataSourceImple _newsDataSourceImple = NewsDataSourceImple();
  String? categoryid;
  String? sourceId;

  void selectCategoryId(String id) async {
    categoryid = id;
  }

  void selectSourceId(String id) {
    sourceId = id;
  }

  Future<void> getNews() async {
    if (sourceId == null || sourceId!.isEmpty) return;
    emit(state.copyWith(getNewsStatus: AppStatus.loading));
    try {
      var response = await _newsDataSourceImple.getNews(sourceId: sourceId!);
      emit(
        state.copyWith(
          getNewsStatus: AppStatus.success,
          responseNewsArticle: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(getNewsStatus: AppStatus.error));
    }
  }

  Future<void> getSource() async {
    emit(state.copyWith(getSourceStatus: AppStatus.loading));
    try {
      var response = await _newsDataSourceImple.getSource(category: categoryid);

      emit(
        state.copyWith(
          getSourceStatus: AppStatus.success,
          source: response,
        ),
      );

      if (response.isNotEmpty) {
        sourceId = response.first.id;
        await getNews();
      }

      log("Response is Sucess and The state is $state");
      // print(response);
    } catch (e) {
      emit(state.copyWith(getSourceStatus: AppStatus.error));
    }
  }
}
