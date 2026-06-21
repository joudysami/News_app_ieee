import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/post_state.dart';
import 'package:news_app/Features/discovery/data/view_post.dart';

class ViewPostsCubit extends Cubit<PostState> {
  ViewPostsCubit() : super(PostInitial());

  final ViewPost _repo = ViewPost();

  Future<void> getViewPosts() async {
    emit(PostLoading());
    try {
      final posts = await _repo.getViewPosts();
      emit(ViewPostsSuccess(posts: posts));
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }

  Future<void> saveViewPost(Map article) async {
    try {
      await _repo.viewPost(article);
      await getViewPosts();
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }
}