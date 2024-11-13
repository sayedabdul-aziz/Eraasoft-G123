import 'package:counter_with_bloc/bloc/counter_event.dart';
import 'package:counter_with_bloc/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitCounterState()) {
    on<AddCounterEvent>(addCounter);
    on<RemoveCounterEvent>(removeCounter);
    // on((event, emit) {
    //   if (event is AddCounterEvent) {
    //     addCounter(emit);
    //   } else if (event is RemoveCounterEvent) {
    //     removeCounter();
    //   }
    // });
  }

  int counter = 0;

  addCounter(AddCounterEvent event, Emitter<CounterState> emit) {
    counter++;
    emit(UpdateCounterState());
  }

  removeCounter(RemoveCounterEvent event, Emitter<CounterState> emit) {
    counter--;
    emit(UpdateCounterState());
  }
}
