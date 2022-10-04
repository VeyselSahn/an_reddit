part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  const MainEvent();
  @override
  List<Object> get props => [];
}

class AddPosts extends MainEvent {
  const AddPosts({required this.posts});
  final List<PostModel> posts;

  @override
  List<Object> get props => [posts];
}
