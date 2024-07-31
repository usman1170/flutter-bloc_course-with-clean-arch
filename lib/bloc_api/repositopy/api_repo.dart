import 'dart:convert';
import 'dart:developer';
import 'package:bloc_course/bloc_api/models/comments.dart';
import 'package:bloc_course/bloc_api/models/posts.dart';
import 'package:bloc_course/bloc_api/models/user_model.dart';
import 'package:bloc_course/bloc_api/utils/utils.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<List<PostsModel>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(postsURL));
      final data = jsonDecode(response.body) as List;
      final posts = data.map((e) => PostsModel.fromJson(e)).toList();
      log(response.statusCode.toString());
      return posts;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<CommentsModel>> getComments() async {
    try {
      final response = await http.get(Uri.parse(commensURL));
      final data = jsonDecode(response.body) as List;
      final posts = data.map((e) => CommentsModel.fromJson(e)).toList();
      log(response.statusCode.toString());
      return posts;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<UsersModel>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(usersURL));
      final data = jsonDecode(response.body) as List;
      final posts = data.map((e) => UsersModel.fromJson(e)).toList();
      log(response.statusCode.toString());
      return posts;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}





//  final posts = data
//           .map((e) => PostsModel(
//                 userId: e["userId"],
//                 id: e["postId"],
//                 title: e["title"],
//                 body: e["body"],
//               ))
//           .toList();