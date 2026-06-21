import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/post_state.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/save_post/save_cubit.dart';
import 'package:news_app/Features/saved/presentation/widgets/saved_post.dart';
import 'package:news_app/core/constant/app_color.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});
  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
    ThemeData get theme => Theme.of(context);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SavedPostsCubit>().getSavedPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved News",
          style: TextStyle(color: AppColor.blue),
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor
      ),
      body: BlocBuilder<SavedPostsCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PostFailure) {
            return Center(child: Text(state.error));
          }

          if (state is PostSuccess) {
            final savedPosts = state.posts ?? [];

            if (savedPosts.isEmpty) {
              return const Center(child: Text("No saved news yet."));
            }

            return ListView.builder(
              itemCount: savedPosts.length,
              itemBuilder: (context, index) {
                final Article = savedPosts[index];
                final article = <String, dynamic>{};
                if (Article is Map) {
                  Article.forEach((key, value) {
                    article[key.toString()] = value;
                  });
                }

                return SavedPost(
                  title: (article['title'] ?? '').toString(),
                  author: (article['author'] ?? '').toString(),
                  publishedAt: (article['publishedAt'] ?? '').toString(),
                  article: article,
                  description: article['description']?.toString(),
                  imageurl: article['urlToImage']?.toString(),
                  content: article['content']?.toString(),
                  url: article['url']?.toString(),
                );
              },
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
