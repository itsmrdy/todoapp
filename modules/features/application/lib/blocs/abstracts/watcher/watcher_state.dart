part of 'watcher_cubit.dart';

abstract class WatcherState with EquatableMixin {
  const WatcherState();
}

class WatcherInitial extends WatcherState {
  @override
  List<Object?> get props => [];
}

/// A state emitted when starting the stream fails.
class WatchFailed extends WatcherState {
  const WatchFailed({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

/// Emitted when a new value is returned by the stream.
class WatchValueChanged<ReturnType> extends WatcherState {
  const WatchValueChanged({required this.value});

  final ReturnType value;

  @override
  List<Object?> get props => [value];
}
