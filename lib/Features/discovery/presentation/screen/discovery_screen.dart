import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/news/presentation/widgets/view_news.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/post_state.dart';
import 'package:news_app/Features/discovery/presentation/cubit/view_post/view_cubit.dart';
import 'package:news_app/core/constant/app_color.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
   @override
  void initState() {
    super.initState();
    context.read<ViewPostsCubit>().getViewPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discovery",
          style: TextStyle(color: AppColor.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            color: AppColor.blue,
            height: 1,
          ),
        ),
      ),
      body: BlocBuilder<ViewPostsCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostFailure) {
            return Center(child: Text(state.error));
          }
          if (state is ViewPostsSuccess) {
            final viewPosts = state.posts ;
            return ListView.builder(
              itemCount: viewPosts.length,
              itemBuilder: (context, index) {
                final article = viewPosts[index];
                return ViewNews(
                  article: article,
                  title: article['title'] ?? '',
                  author: article['author'] ?? '',
                  url: article['url'] ?? '',
                  description: article['description'] ?? '',
                  imageurl: article['urlToImage'] ?? '',
                  publishedAt: article['publishedAt'] ?? '',
                  content: article['content'] ?? '',
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
