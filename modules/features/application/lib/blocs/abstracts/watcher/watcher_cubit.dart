import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/extensions/dartz_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failures/abstracts/failure.dart';
import 'package:equatable/equatable.dart';

part 'watcher_state.dart';

/// Runs a stream of [ReturnType].
///
/// To start the watcher, make a [watch].
///
/// If a [Failure] occurs while attempting to run the stream, then
/// [WatchFailed] is emitted.
abstract class WatcherCubit<ReturnType> extends Cubit<WatcherState> {
  WatcherCubit() : super(WatcherInitial());

  /// The last result emitted by these method.
  ReturnType? _value;

  StreamSubscription<ReturnType>? _streamSubscription;

  Future<Either<Failure, Stream<ReturnType>>> onWatch();

  ReturnType? get value => _value;

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> watch() async {
    final result = await onWatch();

    if (isClosed) {
      return;
    }

    if (result.isLeft()) {
      emit(WatchFailed(failure: result.left()));
    }

    _streamSubscription = result.right().listen(
          (event) => emit(WatchValueChanged<ReturnType>(value: _value = event)),
        );
  }
}
