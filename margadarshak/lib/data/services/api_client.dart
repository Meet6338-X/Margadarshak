/// A very small HTTP client used by the adapters that talk to a backend.
///
/// The mobile app ships its own data pack, so this client is not on the happy
/// path. It exists so that a REST source can be swapped in for the data pack
/// without touching the repositories.
library;

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/failure.dart';
import '../../core/result.dart';

/// Talks to a stateless REST API.
class ApiClient {
  /// Creates a client for [baseUrl].
  ApiClient({
    required this.baseUrl,
    http.Client? client,
    this.timeout = const Duration(seconds: 20),
  }) : _client = client ?? http.Client();

  /// The root of the API, without a trailing slash.
  final String baseUrl;

  /// How long a single request may take.
  final Duration timeout;

  final http.Client _client;

  /// Whether this client points at a real server.
  bool get isConfigured => baseUrl.trim().isNotEmpty;

  /// Performs a `GET` and decodes the response as a JSON object.
  Future<Result<Map<String, dynamic>>> getJson(
    String path, {
    Map<String, String>? query,
    Map<String, String>? headers,
  }) async {
    final result = await _get(path, query: query, headers: headers);
    return result.flatMap((body) {
      final decoded = jsonDecode(body);
      if (decoded is Map<String, dynamic>) {
        return Result<Map<String, dynamic>>.success(decoded);
      }
      return Result<Map<String, dynamic>>.failure(
        Failure.network('The API did not return a JSON object.'),
      );
    });
  }

  /// Performs a `GET` and decodes the response as a JSON array.
  Future<Result<List<dynamic>>> getJsonList(
    String path, {
    Map<String, String>? query,
    Map<String, String>? headers,
  }) async {
    final result = await _get(path, query: query, headers: headers);
    return result.flatMap((body) {
      final decoded = jsonDecode(body);
      if (decoded is List) {
        return Result<List<dynamic>>.success(decoded);
      }
      return Result<List<dynamic>>.failure(
        Failure.network('The API did not return a JSON array.'),
      );
    });
  }

  Future<Result<String>> _get(
    String path, {
    Map<String, String>? query,
    Map<String, String>? headers,
  }) async {
    if (!isConfigured) {
      return Result<String>.failure(
        Failure.unavailable('No API base URL is configured for this build.'),
      );
    }
    try {
      final uri = Uri.parse('$baseUrl$path').replace(queryParameters: query);
      final response = await _client.get(uri, headers: headers).timeout(timeout);
      if (response.statusCode != 200) {
        return Result<String>.failure(
          Failure.network('The API returned ${response.statusCode}.'),
        );
      }
      return Result<String>.success(response.body);
    } catch (error, stackTrace) {
      return Result<String>.failure(Failure.network(error, stackTrace));
    }
  }

  /// Closes the underlying connection.
  void close() => _client.close();
}
