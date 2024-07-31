// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final APIStatus apiStatus;
  final List<PostsModel> posts;
  final List<CommentsModel> comments;
  final List<UsersModel> users;
  final String msg;

  const PostsState({
    this.msg = "",
    this.apiStatus = APIStatus.loading,
    this.posts = const <PostsModel>[],
    this.comments = const <CommentsModel>[],
    this.users = const <UsersModel>[],
  });

  PostsState copyWith({
    APIStatus? apiStatus,
    List<PostsModel>? posts,
    List<CommentsModel>? comments,
    List<UsersModel>? users,
    String? msg,
  }) {
    return PostsState(
      apiStatus: apiStatus ?? this.apiStatus,
      posts: posts ?? this.posts,
      msg: msg ?? this.msg,
      comments: comments ?? this.comments,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [apiStatus, posts, msg, comments, users];
}

final class PostsInitial extends PostsState {}
