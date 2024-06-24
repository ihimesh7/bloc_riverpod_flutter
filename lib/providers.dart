import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_bloc.dart';

// Riverpod Provider
final counterBlocProvider = Provider<CounterBloc>((ref) {
  final counterBloc = CounterBloc();
  ref.onDispose(() {
    counterBloc.close();
  });
  return counterBloc;
});
