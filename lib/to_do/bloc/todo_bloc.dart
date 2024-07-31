import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> items = [];
  TodoBloc() : super(const TodoState()) {
    on<AddToDoEvent>(addItem);
    on<RemoveToDoEvent>(deleteItem);
  }
  void addItem(AddToDoEvent event, Emitter<TodoState> emit) {
    items.add(event.title);
    emit(state.copyWith(items: List.from(items)));
  }

  void deleteItem(RemoveToDoEvent event, Emitter<TodoState> emit) {
    items.remove(event.index);
    emit(state.copyWith(items: List.from(items)));
  }
}
