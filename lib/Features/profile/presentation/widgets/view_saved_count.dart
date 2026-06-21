import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/post_state.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/save_post/save_cubit.dart';
import 'package:news_app/core/constant/app_color.dart';

class ViewSavedCount extends StatefulWidget {
  const ViewSavedCount({super.key});

  @override
  State<ViewSavedCount> createState() => _ViewSavedCountState();
}

class _ViewSavedCountState extends State<ViewSavedCount> {
  @override
  void initState() {
    super.initState();
    context.read<SavedPostsCubit>().getSavedPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedPostsCubit, PostState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostFailure) {
          return Center(child: Text(state.error));
        }

        if (state is PostSuccess) {
          final viewPosts = state.posts ?? [];

          return Column(
            children: [
              Text(
                viewPosts.length.toString(), 
                style:  TextStyle(
                  color: AppColor.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 4),
               Text(
                "Saved",
                style: TextStyle(color: AppColor.grey),
              ),
            ],
          );
        }

        return  SizedBox();
      },
    );
  }
   
  
}