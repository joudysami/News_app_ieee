import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/post_state.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/save_post/save_cubit.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({super.key, required this.article});

  final Map article;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedPostsCubit, PostState>(
      builder: (context, state) {
        final save = context.read<SavedPostsCubit>();

        final isSaved = save.isPostSaved(article['url']);

        return IconButton(
          icon: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.red,
          ),
          onPressed: () {
            if (isSaved) {
              save.removePost(article);
            } else {
              save.savePost(article);
            }
          },
        );
      },
    );
  }
}