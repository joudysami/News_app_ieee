import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/news/domain/usecase/news_usecase.dart';
import 'package:news_app/Features/news/domain/usecase/source_usecase.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_state.dart';
import 'package:news_app/core/state/app_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._newsUsecase,
    this._sourceUsecase,
  ) : super(
          HomeState(
            getSourceStatus: AppStatus.initial,
            getNewsStatus: AppStatus.initial,
          ),
        );

  final NewsUsecase _newsUsecase;
  final SourceUsecase _sourceUsecase;

  String? categoryId;
  String? sourceId;

  void selectCategoryId(String id) {
  categoryId = id;
  sourceId = null;

  emit(state.copyWith());

  getSource();
}
  void selectSourceId(String id) {
    sourceId = id;
    emit(state.copyWith());
  }


  Future<void> getSource() async {
    emit(state.copyWith(getSourceStatus: AppStatus.loading),);

    try {
      final response = await _sourceUsecase.getSource( category: categoryId, );
      emit(
        state.copyWith(
          getSourceStatus: AppStatus.success,
          source: response,
        ),
      );

     if (response.isNotEmpty && sourceId == null) {
  sourceId = response.first.id;
  await getNews(sourceId: sourceId!);
}

      log("Sources loaded successfully");
    } catch (e) {
      log(e.toString());

      emit(
        state.copyWith(getSourceStatus: AppStatus.error,));
    }
  }

  Future<void> getNews({required String sourceId}) async {
  emit(state.copyWith(getNewsStatus: AppStatus.loading));

  try {
    final response = await _newsUsecase.getNews(sourceId: sourceId);

    emit(state.copyWith(
      getNewsStatus: AppStatus.success,
      responseNewsArticle: response,
    ));
  } catch (e) {
    emit(state.copyWith(getNewsStatus: AppStatus.error));
  }
}
}