import 'package:bloc_course/bloc_api/bloc/posts_bloc.dart';
import 'package:bloc_course/bloc_api/screens/comments.dart';
import 'package:bloc_course/bloc_api/screens/posts.dart';
import 'package:bloc_course/bloc_api/screens/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class APiHomeScreen extends StatefulWidget {
  const APiHomeScreen({super.key});

  @override
  State<APiHomeScreen> createState() => _APiHomeScreenState();
}

class _APiHomeScreenState extends State<APiHomeScreen> {
  @override
  void initState() {
    context.read<PostsBloc>().add(FetchPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("API Responses"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UsersScreen(),
                        ));
                  },
                  child: const Text("Users")),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostsScreen(),
                        ));
                  },
                  child: const Text("Posts")),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommentsScreen(),
                        ));
                  },
                  child: const Text("Comments")),
            ],
          ),
        ));
  }
}
