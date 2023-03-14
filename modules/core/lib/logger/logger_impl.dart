import 'package:core/logger/logger.dart';
import 'package:logger/logger.dart' as logs;

class LoggerImpl extends Logger {
  LoggerImpl();

  final _logger = logs.Logger(printer: SimpleLogPrinter());

  @override
  void debug(
    String message, {
    Map<String, dynamic>? data,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.d('$message ${data ?? ''}', error, stackTrace);

  @override
  void info(
    String message, {
    Map<String, dynamic>? data,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.i('$message ${data ?? ''}', error, stackTrace);

  @override
  void warn(
    String message, {
    Map<String, dynamic>? data,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _logger.w('$message ${data ?? ''}', error, stackTrace);

  @override
  void error(
    String message, {
    Map<String, dynamic>? data,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    // _firebaseCrashlytics.recordError(
    //   error,
    //   stackTrace,
    //   reason: data,
    // );

    _logger.e('$message ${data ?? ''}', error, stackTrace);
  }
}

/// A modified version of [logs.PrettyPrinter] that only shows 1 stack trace
/// line.
class SimpleLogPrinter extends logs.PrettyPrinter {
  bool _discardDeviceStacktraceLine(String line) {
    final deviceStackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

    final match = deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(2)!.startsWith('package:logger');
  }

  bool _discardWebStacktraceLine(String line) {
    final webStackTraceRegex = RegExp(r'^((packages|dart-sdk)\/[^\s]+\/)');

    final match = webStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(1)!.startsWith('packages/logger') ||
        match.group(1)!.startsWith('dart-sdk/lib');
  }

  @override
  String? formatStackTrace(StackTrace? stackTrace, int methodCount) {
    final lines = stackTrace.toString().split('\n');
    final formatted = <String>[];
    int count = 0;

    for (final line in lines) {
      if (_discardDeviceStacktraceLine(line) ||
          _discardWebStacktraceLine(line)) {
        continue;
      }

      if (count > 0) {
        formatted.add(line.replaceFirst(RegExp(r'#\d+\s+'), ''));
      }

      if (++count == methodCount) {
        break;
      }
    }

    if (formatted.isEmpty) {
      return null;
    } else {
      return formatted.join('\n');
    }
  }
}
