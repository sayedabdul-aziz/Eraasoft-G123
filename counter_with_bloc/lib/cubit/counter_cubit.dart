import 'package:counter_with_bloc/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(InitCounterState());

  int counter = 0;

  add() {
    counter++;
    emit(UpdateCounterLoadingState());
  }

  remove() {
    counter--;
    emit(UpdateCounterState());
  }
}


// Animal ==> Cat / Dog
// Cat c = Cat();
// Animal c = Cat();
// Cat c = Animal();

// Bloc Provider vs Bloc Consumer vs Bloc Builder vs Bloc Listener