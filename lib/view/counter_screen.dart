import 'package:bloc_flutter_tut/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_flutter_tut/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_flutter_tut/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              /// To avoid unnecessary rebuild if the state is same
              buildWhen: (previous, current) =>
                  previous.counter != current.counter,

              /// It returns state widget
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    /// To increment
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text('Add'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    /// To decrement
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text('Remove'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
