/// The language model that personalises the explanation of a match.
///
/// The model is deliberately not allowed to invent opportunities. It receives
/// the records it may talk about and every citation it returns is checked
/// against that list before the answer reaches the student.
library;

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/failure.dart';
import '../../core/result.dart';
import '../../domain/models/explanation.dart';

/// Asks a language model to explain a set of verified records.
abstract interface class LlmService {
  /// Explains the given records in [languageCode].
  ///
  /// [allowedOpportunityIds] is the closed set of records the model is allowed
  /// to mention. An answer that cites anything else is rejected.
  Future<Result<Explanation>> complete({
    required String prompt,
    required List<String> allowedOpportunityIds,
    required String languageCode,
  });
}

/// Talks to a self-hosted or remote open-weight model over HTTP.
class RemoteLlmService implements LlmService {
  /// Creates the client.
  RemoteLlmService({
    required http.Client client,
    required String baseUrl,
    required String apiKey,
  })  : _client = client,
        _baseUrl = baseUrl,
        _apiKey = apiKey;

  final http.Client _client;
  final String _baseUrl;
  final String _apiKey;

  @override
  Future<Result<Explanation>> complete({
    required String prompt,
    required List<String> allowedOpportunityIds,
    required String languageCode,
  }) async {
    if (_baseUrl.trim().isEmpty) {
      return Result<Explanation>.failure(
        Failure.unavailable('No language model endpoint is configured for this build.'),
      );
    }

    try {
      final response = await _client.post(
        Uri.parse('$_baseUrl/explain'),
        headers: <String, String>{
          'content-type': 'application/json',
          if (_apiKey.isNotEmpty) 'authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode(<String, Object?>{
          'prompt': prompt,
          'language': languageCode,
          'allowed_opportunity_ids': allowedOpportunityIds,
        }),
      );

      if (response.statusCode != 200) {
        return Result<Explanation>.failure(
          Failure.network('The language model returned ${response.statusCode}.'),
        );
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        return Result<Explanation>.failure(
          Failure.network('The language model returned an unexpected payload.'),
        );
      }

      final cited = <String>[];
      final rawCited = decoded['cited_opportunity_ids'];
      if (rawCited is List) {
        for (final entry in rawCited) {
          if (entry is String) cited.add(entry);
        }
      }

      final invented = cited.where((id) => !allowedOpportunityIds.contains(id)).toList();
      if (invented.isNotEmpty) {
        return Result<Explanation>.failure(
          Failure.validation(
            'The answer cited records that are not in the verified set: ${invented.join(', ')}.',
          ),
        );
      }

      final hasMatch = decoded['has_verified_match'] == true;
      if (hasMatch && cited.isEmpty) {
        return Result<Explanation>.failure(
          Failure.validation('The answer claimed a match without citing a record.'),
        );
      }

      final steps = <String>[];
      final rawSteps = decoded['next_steps'];
      if (rawSteps is List) {
        for (final entry in rawSteps) {
          if (entry is String) steps.add(entry);
        }
      }

      return Result<Explanation>.success(
        Explanation(
          text: decoded['text'] is String ? decoded['text'] as String : '',
          citedOpportunityIds: cited,
          nextSteps: steps,
          hasVerifiedMatch: hasMatch,
          languageCode: languageCode,
          generatedAt: DateTime.now(),
        ),
      );
    } catch (error, stackTrace) {
      return Result<Explanation>.failure(Failure.network(error, stackTrace));
    }
  }
}
