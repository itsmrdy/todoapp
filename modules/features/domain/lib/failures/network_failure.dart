import 'package:domain/failures/abstracts/failure.dart';

/// A [Failure] thrown when a network issue has been detected.
class NetworkFailure extends Failure {
  const NetworkFailure(
      {String message = 'There is limited or no internet connection'})
      : super(message: message);
}
