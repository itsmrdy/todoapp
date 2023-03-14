import 'package:core/logger/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failures/abstracts/failure.dart';

/// An abstract class that converts exception [E] to failure [F] if exception
/// [E] occurs while running [call].
///
/// If no error occurs, then value [T] is returned.
abstract class ExceptionConverter<T, E extends Exception, F extends Failure> {
  const ExceptionConverter();

  Future<Either<Failure, T>> call({
    required Future<Either<Failure, T>> Function() action,
    required Logger logger,
    required String failureMessage,
    Map<String, dynamic>? failureData,
  }) async {
    try {
      return await action();
    } on E catch (exception, stackTrace) {
      return Left(onException(
        logger: logger,
        message: failureMessage,
        exception: exception,
        stackTrace: stackTrace,
        data: failureData,
      ));
    }
  }

  F onException({
    required Logger logger,
    required String message,
    required E exception,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  });
}
