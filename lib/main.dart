import 'package:bloc_flutter_tut/bloc/counter/counter_bloc.dart';
import 'package:bloc_flutter_tut/bloc/switch/switch_bloc.dart';
import 'package:bloc_flutter_tut/view/switch/switch_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const CounterScreen(),
        home: const SwitchScreen(),
      ),
    );
  }
}
