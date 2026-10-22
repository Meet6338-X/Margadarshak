/// Tiny logging facade so the rest of the app never calls `print` directly.
library;

import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Severity of a log record.
enum LogLevel {
  /// Verbose diagnostics.
  debug,

  /// Notable but expected events.
  info,

  /// Something that may need attention.
  warning,

  /// Something failed.
  error,
}

/// Application logger.
abstract final class AppLogger {
  static const String _name = 'margadarshak';

  /// Logs a debug message.
  static void debug(String message, {Object? data}) => _log(LogLevel.debug, message, data: data);

  /// Logs an informational message.
  static void info(String message, {Object? data}) => _log(LogLevel.info, message, data: data);

  /// Logs a warning.
  static void warning(String message, {Object? data}) => _log(LogLevel.warning, message, data: data);

  /// Logs an error together with its stack trace.
  static void error(String message, Object error, [StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(message, name: _name, error: error, stackTrace: stackTrace);
    }
  }

  static void _log(LogLevel level, String message, {Object? data}) {
    if (!kDebugMode) return;
    developer.log(message, name: '$_name.${level.name}', error: data);
  }
}
