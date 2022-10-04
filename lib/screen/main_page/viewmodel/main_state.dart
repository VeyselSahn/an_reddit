part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({this.posts = const <PostModel>[], this.afterPost = ''});
  final List<PostModel> posts;
  final String afterPost;

  MainState copyWith({
    List<PostModel>? posts,
    String? afterPost,
  }) {
    return MainState(
      posts: posts ?? this.posts,
      afterPost: afterPost ?? this.afterPost,
    );
  }

  @override
  List<Object> get props => [posts, afterPost];
}
