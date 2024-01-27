import 'package:bloc_flutter_tut/bloc/counter/counter_bloc.dart';
import 'package:bloc_flutter_tut/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_flutter_tut/bloc/switch/switch_bloc.dart';
import 'package:bloc_flutter_tut/bloc/todo/todo_bloc.dart';
import 'package:bloc_flutter_tut/utils/image_picker_utils.dart';
import 'package:bloc_flutter_tut/view/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// To use multi providers
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(
            ImagePickerUtils(),
          ),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const CounterScreen(),
        // home: const SwitchScreen(),
        // home: const ImagePickerScreen(),
        home: const TodoScreen(),
      ),
    );
  }
}
