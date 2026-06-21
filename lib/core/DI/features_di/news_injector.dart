import 'package:news_app/Features/news/data/data_source/news_data_source_imple.dart';
import 'package:news_app/Features/news/domain/repo/news_data_source.dart';
import 'package:news_app/Features/news/domain/usecase/news_usecase.dart';
import 'package:news_app/Features/news/domain/usecase/source_usecase.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:news_app/core/DI/core_di/injection.dart';

Future<void> initNewsFeature() async {
  
  getit.registerLazySingleton<NewsDataSource>(
  () => NewsDataSourceImple(),
);

  getit.registerLazySingleton<NewsUsecase>(() => 
  NewsUsecase(getit()),);

  getit.registerLazySingleton<SourceUsecase>(() => 
  SourceUsecase(getit()),);

  getit.registerFactory(() => HomeCubit(
         getit<NewsUsecase>(),
      getit<SourceUsecase>(),
      ));
}
