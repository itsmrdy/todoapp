import 'package:equatable/equatable.dart';

/// An object returned by use cases when an error has occurred.
///
/// Failures are typically used to wrap exceptions thrown by services,
/// populated by a user-friendly message that will be displayed by the
/// presentation layer.
abstract class Failure with EquatableMixin {
  const Failure({required this.message});

  /// User-friendly message often displayed to the user.
  ///
  /// Keep this message less than or equal to 60 characters.
  final String message;

  @override
  List<Object> get props => [message];
}
