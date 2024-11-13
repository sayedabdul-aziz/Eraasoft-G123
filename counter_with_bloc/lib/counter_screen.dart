import 'package:counter_with_bloc/bloc/counter_bloc.dart';
import 'package:counter_with_bloc/bloc/counter_event.dart';
import 'package:counter_with_bloc/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        body: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state is UpdateCounterState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text("Counter value has been updated successfully")));
            }
          },
          builder: (context, state) {
            if (state is UpdateCounterLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.read<CounterBloc>().counter.toString(),
                      style: const TextStyle(fontSize: 50)),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            // context.read<CounterCubit>().remove();
                            context
                                .read<CounterBloc>()
                                .add(RemoveCounterEvent());
                          },
                          icon: const Icon(Icons.remove)),
                      const SizedBox(width: 50),
                      IconButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(AddCounterEvent());
                            // context.read<CounterCubit>().add();
                            // BlocProvider.of<CounterCubit>(context).add();
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  )
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}
