abstract class Logger {
  /// Fine-grained informational events useful for debugging an application.
  ///
  /// The [message] provides details about the log.
  /// The [error] is an optional parameter containing the exception thrown that
  /// triggered the log.
  /// The [stackTrace] that comes together with the [error].
  /// The [data] provides additional information about the log.
  void debug(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  });

  /// Informational messages that states the progress of the application at a
  /// coarse-grained level.
  ///
  /// The [message] provides details about the log.
  /// The [error] is an optional parameter containing the exception thrown that
  /// triggered the log.
  /// The [stackTrace] that comes together with the [error].
  /// The [data] provides additional information about the log.
  void info(
    String message, {
    Map<String, dynamic>? data,
    dynamic error,
    StackTrace? stackTrace,
  });

  /// Possible error events that still allows the application to continue
  /// running.
  ///
  /// The [message] provides details about the log.
  /// The [error] is an optional parameter containing the exception thrown that
  /// triggered the log.
  /// The [stackTrace] that comes together with the [error].
  /// The [data] provides additional information about the log.
  void warn(
    String message, {
    Map<String, dynamic>? data,
    dynamic error,
    StackTrace? stackTrace,
  });

  /// Error events that are unhandled or that can break the application.
  ///
  /// This types of logs are reported to Crashlytics.
  ///
  /// The [message] provides details about the log.
  /// The [error] is an optional parameter containing the exception thrown that
  /// triggered the log.
  /// The [stackTrace] that comes together with the [error].
  /// The [data] provides additional information about the log.
  void error(
    String message, {
    Map<String, dynamic>? data,
    dynamic error,
    StackTrace? stackTrace,
  });
}
