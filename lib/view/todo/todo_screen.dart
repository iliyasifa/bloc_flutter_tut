import 'package:bloc_flutter_tut/bloc/todo/todo_bloc.dart';
import 'package:bloc_flutter_tut/bloc/todo/todo_event.dart';
import 'package:bloc_flutter_tut/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Generate list of todo tasks
          for (int i = 1; i <= 10; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: 'Task: $i'));
          }
        },
        child: const Icon(Icons.add_task),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      /// To remove todo task
                      context
                          .read<TodoBloc>()
                          .add(RemoveTodoEvent(index: index));
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Tasks found'),
            );
          }
        },
      ),
    );
  }
}
