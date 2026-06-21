abstract class PostState {}
class PostInitial extends PostState{}
class PostLoading extends PostState{}
class PostSuccess extends PostState{
  final List<dynamic>? posts;
  PostSuccess({this.posts});

}
class PostFailure extends PostState{
  final String error;
  PostFailure({required this.error});
  
}
class ViewPostsSuccess extends PostState {
  final List posts;
  ViewPostsSuccess({required this.posts});
}
