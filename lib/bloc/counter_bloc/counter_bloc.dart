import 'package:bloc_flutter_tut/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_flutter_tut/bloc/counter_bloc/counter_state.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  /// [_increment] method invoked when increment add button is tapped
  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  /// [_decrement] method invoked when decrement remove button is tapped
  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
