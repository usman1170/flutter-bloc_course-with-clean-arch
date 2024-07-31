// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddToDoEvent extends TodoEvent {
  final String title;

  const AddToDoEvent({required this.title});
  @override
  List<Object?> get props => [title];
}

class RemoveToDoEvent extends TodoEvent {
  final Object index;
  const RemoveToDoEvent({
    required this.index,
  });
  @override
  List<Object?> get props => [index];
}
