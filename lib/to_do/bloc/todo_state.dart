// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String> items;
  const TodoState({
    this.items = const [],
  });

  TodoState copyWith({List<String>? items}) {
    return TodoState(items: items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}
