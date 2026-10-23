/// A minimal, dependency-free result type used across all layers.
///
/// Using [Result] instead of throwing keeps the happy path visible in the type
/// system and forces every caller to decide what to do with an error.
library;

import 'package:meta/meta.dart';

import 'failure.dart';

/// Either a successful [T] or a [Failure].
@immutable
sealed class Result<T> {
  const Result();

  /// Wraps a value in a successful result.
  const factory Result.success(T value) = Success<T>;

  /// Wraps a failure in a failed result.
  const factory Result.failure(Failure failure) = FailureResult<T>;

  /// Whether this result holds a value.
  bool get isSuccess => this is Success<T>;

  /// Whether this result holds a failure.
  bool get isFailure => this is FailureResult<T>;

  /// The value, or `null` when this result is a failure.
  T? get valueOrNull => switch (this) {
        Success<T>(:final value) => value,
        FailureResult<T>() => null,
      };

  /// The failure, or `null` when this result is a success.
  Failure? get failureOrNull => switch (this) {
        Success<T>() => null,
        FailureResult<T>(:final failure) => failure,
      };

  /// Collapses this result into a single value.
  R fold<R>(R Function(T value) onSuccess, R Function(Failure failure) onFailure) =>
      switch (this) {
        Success<T>(:final value) => onSuccess(value),
        FailureResult<T>(:final failure) => onFailure(failure),
      };

  /// Transforms the value of a successful result, leaving failures untouched.
  Result<R> map<R>(R Function(T value) transform) => fold(
        (value) => Result<R>.success(transform(value)),
        (failure) => Result<R>.failure(failure),
      );

  /// Chains another fallible operation onto a successful result.
  Result<R> flatMap<R>(Result<R> Function(T value) transform) => fold(
        (value) => transform(value),
        (failure) => Result<R>.failure(failure),
      );

  /// Returns the value, or [fallback] when this result is a failure.
  T getOrElse(T fallback) => valueOrNull ?? fallback;
}

/// A successful [Result] holding a [value].
@immutable
final class Success<T> extends Result<T> {
  /// Creates a successful result.
  const Success(this.value);

  /// The wrapped value.
  final T value;

  @override
  bool operator ==(Object other) => identical(this, other) || (other is Success<T> && other.value == value);

  @override
  int get hashCode => Object.hash(Success, value);

  @override
  String toString() => 'Success($value)';
}

/// A failed [Result] holding a [failure].
@immutable
final class FailureResult<T> extends Result<T> {
  /// Creates a failed result.
  const FailureResult(this.failure);

  /// The wrapped failure.
  final Failure failure;

  @override
  bool operator ==(Object other) => identical(this, other) || (other is FailureResult<T> && other.failure == failure);

  @override
  int get hashCode => Object.hash(FailureResult, failure);

  @override
  String toString() => 'FailureResult($failure)';
}
