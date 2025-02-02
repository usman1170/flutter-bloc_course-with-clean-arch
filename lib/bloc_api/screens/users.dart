import 'dart:developer';

import 'package:bloc_course/bloc_api/bloc/posts_bloc.dart';
import 'package:bloc_course/bloc_api/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    context.read<PostsBloc>().add(Fetchusers());
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
            log(state.users.length.toString());
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
                  return Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        onChanged: (value) {
                          context.read<PostsBloc>().add(
                                SearchItem(
                                  value,
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
                              itemCount: state.tempUsers.isEmpty
                                  ? state.users.length
                                  : state.tempUsers.length,
                              itemBuilder: (context, index) {
                                final user = state.tempUsers.isEmpty
                                    ? state.users[index]
                                    : state.tempUsers[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        "${user.id} = ${user.name.toString()}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(user.email.toString()),
                                      trailing:
                                          Text(user.address!.city.toString()),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ]);
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
