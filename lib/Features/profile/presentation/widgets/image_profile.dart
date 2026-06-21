import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/profile/presentation/cubit/profile_cubit.dart';
import 'package:news_app/Features/profile/presentation/cubit/profile_state.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/helpers/image_helper.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  File? imageFile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileCubit>().loadImage();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColor.grey,
                          width: 2,
                        ),
                      ),
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileSuccess) {
                            return CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(
                                File(state.imagePath),
                              ),
                            );
                          }

                          return const CircleAvatar(
                            radius: 50,
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          );
                        },
                      )),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 18,
                      onPressed: () async {
                        final image = await ImageHelper.PickImageFromGallery();

                        if (image != null) {
                          context.read<ProfileCubit>().saveImage(image);
                        }
                      },
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              );
  }
}