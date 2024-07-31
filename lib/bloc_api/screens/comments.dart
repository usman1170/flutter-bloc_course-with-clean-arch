import 'dart:developer';

import 'package:bloc_course/bloc_api/bloc/posts_bloc.dart';
import 'package:bloc_course/bloc_api/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    context.read<PostsBloc>().add(FetchComments());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("API Responses"),
          centerTitle: true,
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            log(state.apiStatus.toString());
            switch (state.apiStatus) {
              case APIStatus.failed:
                return Center(
                  child: Text(state.msg),
                );
              case APIStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case APIStatus.complete:
                if (state.posts.isEmpty) {
                  return const Center(child: Text("No Data"));
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          onChanged: (value) {
                            context.read<PostsBloc>().add(
                                  SearchItem(
                                    value.toString(),
                                  ),
                                );
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Search by email",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: state.searchMsg.isNotEmpty
                            ? Center(child: Text(state.searchMsg))
                            : ListView.builder(
                                itemCount: state.tempComments.isEmpty
                                    ? state.comments.length
                                    : state.tempComments.length,
                                itemBuilder: (context, index) {
                                  final comments = state.tempComments.isEmpty
                                      ? state.comments[index]
                                      : state.tempComments[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: ListTile(
                                        title: Text(
                                          "${comments.id} = ${comments.email.toString()}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle:
                                            Text(comments.body.toString()),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                }

              default:
                return Center(
                  child: Text(state.msg),
                );
            }
          },
        ),
      ),
    );
  }
}
