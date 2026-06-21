import 'dart:io';

import 'package:news_app/Features/profile/data/local_data/storage_image.dart';
import 'package:news_app/Features/profile/domain/entity/profile_user_entity.dart';
import 'package:news_app/Features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileLocalService localService;

  ProfileRepoImpl(this.localService);

  @override
  Future<void> saveProfileImage(File image) async {
    await localService.saveImagePath(
      image.path,
    );
  }

  @override
  Future<String?> getProfileImage() async {
    return await localService.getImagePath();
  }

  @override
  Future<ProfileUserEntity> getProfile() {
  
    throw UnimplementedError();
  }
}