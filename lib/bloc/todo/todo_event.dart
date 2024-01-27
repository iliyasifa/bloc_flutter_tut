import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  final String task;

  const AddTodoEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  final int index;

  const RemoveTodoEvent({required this.index});
  @override
  List<Object> get props => [index];
}
