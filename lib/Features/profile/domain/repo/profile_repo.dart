import 'dart:io';

import 'package:news_app/Features/profile/domain/entity/profile_user_entity.dart';

abstract class ProfileRepo {
  Future<ProfileUserEntity> getProfile();
  Future<void> saveProfileImage(File image);

  Future<String?> getProfileImage();
}