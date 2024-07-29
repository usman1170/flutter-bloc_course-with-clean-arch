import 'package:bloc/bloc.dart';
import 'package:bloc_course/counter/bloc/counter_events.dart';
import 'package:bloc_course/counter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncreamentCounter>(_incrementCounter);
    on<DecreamentCounter>(_decrementCounter);
  }
  void _incrementCounter(
    IncreamentCounter event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrementCounter(
    DecreamentCounter event,
    Emitter<CounterState> emit,
  ) {
    if (state.counter != 0) {
      emit(state.copyWith(counter: state.counter - 1));
    }
  }
}
