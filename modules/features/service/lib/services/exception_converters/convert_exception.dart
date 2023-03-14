import 'package:codenic_logger/src/message_log.dart';
import 'package:core/logger/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failures/abstracts/failure.dart';
import 'package:domain/failures/unknown_failure.dart';
import 'package:service/services/exception_converters/abstracts/exception_converter.dart';
import 'package:service/services/exception_converters/default_exception_converter.dart';

/// Converts the possible [Exception] thrown by [action] into a [Failure].
///
/// If no error occurs, then value [T] is returned.
///
/// If the [Exception] does not have an exception converter, then it will be
/// converted to [UnknownFailure] by default.
///
/// If [exceptionConverters] is `null`, then all [Exception] will be converted
/// to [UnknownFailure].
///
/// NOTE: [DefaultExceptionConverter] is added to the [exceptionConverters] by
/// default.
Future<Either<Failure, T>> convertExceptionIfThrown<T>({
  required Future<Either<Failure, T>> Function() action,
  required Logger logger,
  required String failureMessage,
  Map<String, dynamic>? failureData,
  List<ExceptionConverter<T, Exception, Failure>>? exceptionConverters, required MessageLog messageLog,
}) async {
  try {
    if (exceptionConverters == null) {
      return await DefaultExceptionConverter<T>()(
        action: action,
        logger: logger,
        failureMessage: failureMessage,
        failureData: failureData,
      );
    }

    final extendedExceptionConverters = [
      ...exceptionConverters,
      DefaultExceptionConverter<T>(),
    ];

    return await extendedExceptionConverters
        .fold<Future<Either<Failure, T>> Function()>(
      action,
      (previousValue, element) => () => element.call(
            action: previousValue,
            logger: logger,
            failureMessage: failureMessage,
            failureData: failureData,
          ),
    )();
  } catch (exception, stackTrace) {
    logger.error(
      'Convert exception if thrown failed – Exception is a non-Exception data type.',
      error: exception,
      stackTrace: stackTrace,
    );

    return const Left(UnknownFailure());
  }
}
