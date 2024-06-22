// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @riverpod
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodtest/state.dart';

// @riverpod
class controllerRiverpod extends Notifier<AppStateTest> {
  int counter = 0;

  void increment() {
    counter++;
    state = SuccessStates(counter: counter);
  }


  @override
  AppStateTest build() => LoadingStates();
}
