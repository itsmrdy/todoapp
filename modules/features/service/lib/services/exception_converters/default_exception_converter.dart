import 'package:core/logger/logger.dart';
import 'package:domain/failures/unknown_failure.dart';
import 'package:service/services/exception_converters/abstracts/exception_converter.dart';

/// If [Exception] occurs, then [UnknownFailure] is returned.
///
/// If no error occurs, then value [T] is returned.
class DefaultExceptionConverter<T>
    extends ExceptionConverter<T, Exception, UnknownFailure> {
  const DefaultExceptionConverter();

  @override
  UnknownFailure onException({
    required Logger logger,
    required String message,
    required Exception exception,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  }) {
    logger.error(
      '$message – Unknown failure occurred.',
      error: exception,
      stackTrace: stackTrace,
      data: data,
    );

    return const UnknownFailure();
  }
}
