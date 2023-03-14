part of 'runner_cubit.dart';


abstract class RunnerState with EquatableMixin {
  const RunnerState();
}

class RunnerInitial extends RunnerState {
  const RunnerInitial();

  @override
  List<Object?> get props => [];
}

class Running<Params> extends RunnerState {
  const Running({required this.params});

  final Params params;

  @override
  List<Object?> get props => [params];
}

class RunFailed<Params> extends RunnerState {
  const RunFailed({
    required this.params,
    required this.failure,
  });

  final Failure failure;
  final Params params;

  @override
  List<Object?> get props => [failure, params];
}

class RunSuccess<ReturnType> extends RunnerState {
  const RunSuccess({required this.runToken, required this.result});

  final int runToken;
  final ReturnType result;

  @override
  List<Object?> get props => [runToken, result];
}

/// This is emitted when the runner cubit value has been reset to `null`.
class Reset extends RunnerState {
  const Reset();

  @override
  List<Object?> get props => [];
}
