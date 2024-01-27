import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_tut/bloc/todo/todo_event.dart';
import 'package:bloc_flutter_tut/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  /// [_addTodoEvent] to add task
  void _addTodoEvent(
    AddTodoEvent event,
    Emitter<TodoState> emit,
  ) {
    todoList.add(event.task);
    emit(state.copyWith(
      todoList: List.from(todoList),
    ));
  }

  /// [_removeTodoEvent] to remove task using list index
  void _removeTodoEvent(
    RemoveTodoEvent event,
    Emitter<TodoState> emit,
  ) {
    todoList.removeAt(event.index);
    emit(state.copyWith(
      todoList: List.from(todoList),
    ));
  }
}
