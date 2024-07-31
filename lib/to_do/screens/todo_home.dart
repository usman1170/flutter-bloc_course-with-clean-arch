import 'dart:developer';
import 'package:bloc_course/to_do/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  final TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log("todo top build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text("No Items"),
            );
          } else {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text(state.items[index]),
                      trailing: IconButton(
                          onPressed: () {
                            context.read<TodoBloc>().add(
                                RemoveToDoEvent(index: state.items[index]));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add title"),
                content: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      TextField(
                        controller: _title,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cencel"),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_title.text != "") {
                                context.read<TodoBloc>().add(AddToDoEvent(
                                      title: _title.text.toString(),
                                    ));
                                _title.clear();
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text("Add"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
