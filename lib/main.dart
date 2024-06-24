import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_bloc.dart';
import 'providers.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterBloc = ref.watch(counterBlocProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC Riverpod Example'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          bloc: counterBloc,
          builder: (context, state) {
            return Text('Counter: ${state.value}', style: TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(IncrementCounter()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => counterBloc.add(DecrementCounter()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
