import 'package:news_app/Features/profile/data/repo/profile_repo_impl.dart';
import 'package:news_app/Features/profile/data/local_data/storage_image.dart';
import 'package:news_app/Features/profile/domain/repo/profile_repo.dart';
import 'package:news_app/Features/profile/domain/usecase/profile_usecase.dart';
import 'package:news_app/Features/profile/presentation/cubit/profile_cubit.dart';

import 'package:news_app/core/DI/core_di/injection.dart';

Future<void> initProfileFeature() async {
  getit.registerLazySingleton (() => ProfileLocalService());

  

  getit.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getit(), ));

  getit.registerLazySingleton<ProfileUsecase>(() => ProfileUsecase(getit()));

  getit.registerFactory(() => ProfileCubit(getit()));

      
}