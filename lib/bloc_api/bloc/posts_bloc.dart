import 'package:bloc/bloc.dart';
import 'package:bloc_course/bloc_api/models/comments.dart';
import 'package:bloc_course/bloc_api/models/posts.dart';
import 'package:bloc_course/bloc_api/models/user_model.dart';
import 'package:bloc_course/bloc_api/repositopy/api_repo.dart';
import 'package:bloc_course/bloc_api/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<PostsModel> tempPost = [];
  List<UsersModel> tempUser = [];
  List<CommentsModel> tempCmt = [];
  final PostsRepository postsRepository = PostsRepository();
  PostsBloc() : super(const PostsState()) {
    on<FetchPosts>(_fetchPosts);
    on<FetchComments>(_fetchComments);
    on<Fetchusers>(_fetchUsers);
    on<SearchItem>(_filter);
  }
  void _fetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    try {
      final posts = await postsRepository.getPosts();

      emit(state.copyWith(
          posts: posts,
          apiStatus: APIStatus.complete,
          msg: "Api status Success"));
    } catch (e) {
      emit(state.copyWith(apiStatus: APIStatus.failed, msg: e.toString()));
    }
  }

  void _fetchComments(FetchComments event, Emitter<PostsState> emit) async {
    await postsRepository.getComments().then((onValue) {
      emit(state.copyWith(
          comments: onValue,
          apiStatus: APIStatus.complete,
          msg: "Api status Success"));
    }).onError((error, stackTrace) {
      emit(state.copyWith(apiStatus: APIStatus.failed, msg: error.toString()));
    });
  }

  void _fetchUsers(Fetchusers event, Emitter<PostsState> emit) async {
    await postsRepository.getUsers().then((onValue) {
      emit(state.copyWith(
          users: onValue,
          apiStatus: APIStatus.complete,
          msg: "Api status Success"));
    }).onError((error, stackTrace) {
      emit(state.copyWith(apiStatus: APIStatus.failed, msg: error.toString()));
    });
  }

  void _filter(SearchItem event, Emitter<PostsState> emit) async {
    if (event.search.isEmpty) {
      emit(state.copyWith(
          tempComments: [], tempPosts: [], tempUsers: [], searchMsg: ""));
    } else {
      tempCmt = state.comments
          .where(
            (element) => element.email
                .toString()
                .toLowerCase()
                .contains(event.search.toLowerCase()),
          )
          .toList();
      tempPost = state.posts
          .where(
            (element) => element.title
                .toString()
                .toLowerCase()
                .contains(event.search.toLowerCase()),
          )
          .toList();
      tempUser = state.users
          .where(
            (element) =>
                element.name
                    .toString()
                    .toLowerCase()
                    .contains(event.search.toLowerCase()) ||
                element.email
                    .toString()
                    .toLowerCase()
                    .contains(event.search.toLowerCase()),
          )
          .toList();

      if (tempCmt.isEmpty && tempPost.isEmpty && tempUser.isEmpty) {
        emit(state.copyWith(
            tempComments: [],
            tempPosts: [],
            tempUsers: [],
            searchMsg: "No Data Found for ${event.search}"));
      } else {
        emit(state.copyWith(
          tempComments: tempCmt,
          tempPosts: tempPost,
          tempUsers: tempUser,
          searchMsg: "",
        ));
      }
    }
  }
}
