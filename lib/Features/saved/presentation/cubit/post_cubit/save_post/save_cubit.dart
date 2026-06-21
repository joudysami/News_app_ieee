import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/post_state.dart';
import 'package:news_app/Features/saved/data/local_data_source/save_post.dart';

class SavedPostsCubit extends Cubit<PostState> {
  SavedPostsCubit() : super(PostInitial());

  final SavePost _repo = SavePost();

  Future<void> getSavedPosts() async {
    emit(PostLoading());
    try {
      final posts = await _repo.getSavedPosts();
      emit(PostSuccess(posts: posts));
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }

  Future<void> savePost(Map article) async {
    try {
      await _repo.savePost(article);
      await getSavedPosts();
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }

  Future<void> removePost(Map article) async {
    try {
      await _repo.removePost(article);
      await getSavedPosts();
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }

bool isPostSaved(String? url) {
  if (url == null || url.isEmpty) {
    return false;
  }

  final currentState = state;
  if (currentState is PostSuccess) {
    final posts = currentState.posts ?? [];
    return posts.any((p) => p is Map && p['url']?.toString() == url);
  }

  return false;
}

  
}