/// Failure taxonomy shared by every layer of the application.
///
/// The UI never sees raw exceptions: services translate them into a [Failure]
/// so that ViewModels can render a meaningful message and retry where it makes
/// sense.
library;

import 'package:meta/meta.dart';

/// The kind of problem that occurred.
enum FailureType {
  /// The device could not reach the remote service.
  network,

  /// Local persistence (Drift) failed.
  storage,

  /// The user is not signed in, or their session expired.
  auth,

  /// The requested record does not exist.
  notFound,

  /// The input failed a business rule.
  validation,

  /// A service is not configured for this build (for example Firebase).
  unavailable,

  /// The operation was cancelled deliberately.
  cancelled,

  /// Anything that does not fit a more specific bucket.
  unknown,
}

/// An immutable description of something that went wrong.
@immutable
class Failure {
  const Failure({
    required this.type,
    required this.message,
    this.cause,
    this.stackTrace,
  });

  /// Creates a failure describing an unexpected error.
  factory Failure.unknown(Object error, [StackTrace? stackTrace]) => Failure(
        type: FailureType.unknown,
        message: error.toString(),
        cause: error,
        stackTrace: stackTrace,
      );

  /// Creates a failure describing an unreachable service.
  factory Failure.network(Object error, [StackTrace? stackTrace]) => Failure(
        type: FailureType.network,
        message: error.toString(),
        cause: error,
        stackTrace: stackTrace,
      );

  /// Creates a failure describing a local storage problem.
  factory Failure.storage(Object error, [StackTrace? stackTrace]) => Failure(
        type: FailureType.storage,
        message: error.toString(),
        cause: error,
        stackTrace: stackTrace,
      );

  /// Creates a failure describing a missing record.
  factory Failure.notFound(String what) => Failure(
        type: FailureType.notFound,
        message: '$what was not found.',
      );

  /// Creates a failure describing invalid user input.
  factory Failure.validation(String message) => Failure(
        type: FailureType.validation,
        message: message,
      );

  /// Creates a failure describing a service that is switched off in this build.
  factory Failure.unavailable(String message) => Failure(
        type: FailureType.unavailable,
        message: message,
      );

  /// Creates a failure describing an authentication problem.
  factory Failure.auth(String message) => Failure(
        type: FailureType.auth,
        message: message,
      );

  /// What kind of problem this is.
  final FailureType type;

  /// A human readable, already-localised-at-the-edge description.
  final String message;

  /// The original error, kept for logging and debugging.
  final Object? cause;

  /// The stack trace that belongs to [cause], when available.
  final StackTrace? stackTrace;

  @override
  String toString() => 'Failure(${type.name}): $message';
}
