import 'package:domain/failures/abstracts/failure.dart';

/// A [Failure] thrown when an error occurred that has not been properly
/// handled or its cause cannot properly be determined.
class UnknownFailure extends Failure {
  const UnknownFailure(
      {String message = "Something went wrong! We're looking into it"})
      : super(message: message);
}
