// ignore_for_file: public_member_api_docs, sort_constructors_first

sealed class AppStateTest {
  Widget when<Widget>({
    required Widget Function() loading,
    required Widget Function() error,
    required Widget Function(int data) data,
  }) {
    return switch (this) {
      LoadingStates() => loading(),
      ErrorStates() => error(),
      SuccessStates(counter: final int counter) => data(counter),
    };
  }

  Widget maybeWhen<Widget>({
    required Widget Function() orElse,
    Widget Function()? loading,
    Widget Function()? error,
    Widget Function(int data)? data,
  }) {
    return switch (this) {
      LoadingStates() => loading?.call() ?? orElse(),
      ErrorStates() => error?.call() ?? orElse(),
      SuccessStates(counter: final int counter) => data?.call(counter) ?? orElse(),
    };
  }
}

class LoadingStates extends AppStateTest {}

class SuccessStates extends AppStateTest {
  int counter = 0;
  SuccessStates({
    required this.counter,
  });
}

class ErrorStates extends AppStateTest {}
