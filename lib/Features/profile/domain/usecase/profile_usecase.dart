import 'dart:io';
import 'package:news_app/Features/profile/domain/repo/profile_repo.dart';

class ProfileUsecase {
  final ProfileRepo repo;

  ProfileUsecase(this.repo);

  Future<void> saveImage(File image) {
    return repo.saveProfileImage(image);
  }

  Future<String?> getImage() {
    return repo.getProfileImage();
  }
}