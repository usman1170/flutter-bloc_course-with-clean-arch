// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class FetchPosts extends PostsEvent {}

class FetchComments extends PostsEvent {}

class Fetchusers extends PostsEvent {}

class SearchItem extends PostsEvent {
  String search;
  SearchItem(
    this.search,
  );
}
