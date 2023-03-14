import 'dart:io';

import 'package:core/logger/logger.dart';
import 'package:domain/failures/network_failure.dart';
import 'package:service/services/exception_converters/abstracts/exception_converter.dart';

/// If [SocketException] occurs, then [NetworkFailure] is returned.
///
/// If no error occurs, then value [T] is returned.
class SocketExceptionConverter<T>
    extends ExceptionConverter<T, SocketException, NetworkFailure> {
  const SocketExceptionConverter();

  @override
  NetworkFailure onException({
    required Logger logger,
    required String message,
    required SocketException exception,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  }) {
    logger.warn(
      '$message – Network failure occurred.',
      error: exception,
      stackTrace: stackTrace,
      data: data,
    );

    return const NetworkFailure();
  }
}
