import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/profile/domain/usecase/profile_usecase.dart';
import 'package:news_app/Features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit  extends Cubit<ProfileState>{
   final ProfileUsecase usecase;

  ProfileCubit(this.usecase):super(ProfileInitial());

  Future<void>loadImage() async {
    final path=await usecase.getImage();
    if (path != null) {
      emit(ProfileSuccess(path));

    }
    
  }
   
   Future<void> saveImage(File image) async {
    emit(ProfileLoading());
     await usecase.saveImage(image);
    emit(ProfileSuccess(image.path));

   }
}