import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider
final CounterViewModelProvider =
    StateNotifierProvider<CounterViewModel, int>((ref) {
  return CounterViewModel();
});

// state = 0
class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0);

// increment
  void increment() {
    state = state + 1;
  }

// decrement
  void decrement() {
    if (state == 0) {
      return;
    }
    state = state - 1;
  }
}
