// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final APIStatus apiStatus;
  final List<PostsModel> posts;
  final List<CommentsModel> comments;
  final List<UsersModel> users;
  final List<PostsModel> tempPosts;
  final List<CommentsModel> tempComments;
  final List<UsersModel> tempUsers;
  final String msg;
  final String searchMsg;

  const PostsState({
    this.tempPosts = const <PostsModel>[],
    this.tempComments = const <CommentsModel>[],
    this.tempUsers = const <UsersModel>[],
    this.msg = "",
    this.searchMsg = "",
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
    List<PostsModel>? tempPosts,
    List<CommentsModel>? tempComments,
    List<UsersModel>? tempUsers,
    String? msg,
    String? searchMsg,
  }) {
    return PostsState(
      apiStatus: apiStatus ?? this.apiStatus,
      posts: posts ?? this.posts,
      msg: msg ?? this.msg,
      searchMsg: searchMsg ?? this.searchMsg,
      comments: comments ?? this.comments,
      users: users ?? this.users,
      tempPosts: tempPosts ?? this.tempPosts,
      tempComments: tempComments ?? this.tempComments,
      tempUsers: tempUsers ?? this.tempUsers,
    );
  }

  @override
  List<Object?> get props => [
        apiStatus,
        posts,
        msg,
        comments,
        users,
        tempComments,
        tempPosts,
        tempUsers,
        searchMsg
      ];
}

final class PostsInitial extends PostsState {}
