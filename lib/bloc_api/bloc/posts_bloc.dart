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
  final PostsRepository postsRepository = PostsRepository();
  PostsBloc() : super(const PostsState()) {
    on<FetchPosts>(_fetchPosts);
    on<FetchComments>(_fetchComments);
    on<Fetchusers>(_fetchUsers);
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
}
