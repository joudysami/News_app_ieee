import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/discovery/presentation/cubit/view_post/view_cubit.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/post_state.dart';
import 'package:news_app/core/constant/app_color.dart';
class ViewHistoryCount extends StatefulWidget {
  const ViewHistoryCount({super.key});

  @override
  State<ViewHistoryCount> createState() => _ViewHistoryCountState();
}

class _ViewHistoryCountState extends State<ViewHistoryCount> {
  @override
  void initState() {
    super.initState();
    context.read<ViewPostsCubit>().getViewPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewPostsCubit, PostState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostFailure) {
          return Center(child: Text(state.error));
        }

        if (state is ViewPostsSuccess) {
          final viewPosts = state.posts ;

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
                "Viewed",
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
