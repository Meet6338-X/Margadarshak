/// Speech input and output used by the discovery conversation.
///
/// The app never talks to a speech vendor directly. Everything goes through
/// [SpeechService] so that the on-device implementation can be swapped for the
/// Bhashini adapter without touching a single ViewModel.
library;

import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../core/failure.dart';
import '../../core/result.dart';

/// Turns text into speech and speech into text.
abstract interface class SpeechService {
  /// Speaks [text] in [languageCode].
  Future<Result<void>> speak({
    required String text,
    required String languageCode,
  });

  /// Stops any speech that is currently playing.
  Future<void> stop();

  /// Listens for a single utterance and returns the recognised words.
  Future<Result<String>> listen({required String languageCode});

  /// Whether the microphone is currently capturing audio.
  bool get isListening;
}

/// Maps an ISO language code to the locale identifier the platform expects.
String speechLocaleFor(String languageCode) => switch (languageCode) {
      'mr' => 'mr_IN',
      'hi' => 'hi_IN',
      _ => 'en_IN',
    };

/// Speech that runs entirely on the device.
///
/// This is the default implementation: it keeps the app usable with no data
/// connection, which matters because a large part of the target audience has
/// patchy mobile data.
class DeviceSpeechService implements SpeechService {
  /// Creates the service and warms up the text-to-speech engine.
  DeviceSpeechService() {
    _tts.setCompletionHandler(() {
      if (!_ttsCompletion.isCompleted) _ttsCompletion.complete();
    });
    _tts.setErrorHandler((Object? message) {
      if (!_ttsCompletion.isCompleted) {
        _ttsCompletion.completeError(
          Failure.unavailable('Speech synthesis failed: '),
        );
      }
    });
  }

  final FlutterTts _tts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();
  final Completer<void> _ttsCompletion = Completer<void>();

  bool _recogniserReady = false;
  bool _listening = false;

  @override
  bool get isListening => _listening;

  @override
  Future<Result<void>> speak({
    required String text,
    required String languageCode,
  }) async {
    if (text.trim().isEmpty) return const Result<void>.success(null);
    try {
      await _tts.setLanguage(speechLocaleFor(languageCode));
      await _tts.setSpeechRate(0.45);
      await _tts.setPitch(1.0);
      if (!_ttsCompletion.isCompleted) {
        _ttsCompletion.complete();
      }
      await _tts.speak(text);
      return const Result<void>.success(null);
    } catch (error, stackTrace) {
      return Result<void>.failure(Failure.unknown(error, stackTrace));
    }
  }

  @override
  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (_) {
      // Stopping a silent engine is not an error worth surfacing.
    }
    _listening = false;
  }

  @override
  Future<Result<String>> listen({required String languageCode}) async {
    try {
      if (!_recogniserReady) {
        _recogniserReady = await _speech.initialize(
          onError: (SpeechRecognitionError error) {
            _listening = false;
          },
          onStatus: (String status) {
            if (status == 'notListening') _listening = false;
          },
          debugLogging: false,
        );
      }
      if (!_recogniserReady) {
        return Result<String>.failure(
          Failure.unavailable('Speech recognition is not available on this device.'),
        );
      }

      final completer = Completer<String>();
      _listening = true;
      await _speech.listen(
        listenOptions: stt.SpeechListenOptions(
          partialResults: false,
          localeId: speechLocaleFor(languageCode),
        ),
        onResult: (SpeechRecognitionResult result) {
          _listening = false;
          if (result.finalResult && !completer.isCompleted) {
            completer.complete(result.recognizedWords);
          }
        },
      );

      final words = await completer.future.timeout(const Duration(seconds: 30));
      return Result<String>.success(words);
    } on TimeoutException {
      _listening = false;
      return Result<String>.failure(Failure.unavailable('No speech was detected in time.'));
    } catch (error, stackTrace) {
      _listening = false;
      return Result<String>.failure(Failure.unknown(error, stackTrace));
    }
  }
}

/// Speech backed by the Bhashini public API.
///
/// The service is only wired up when a base URL is supplied through
/// `--dart-define=BHASHINI_BASE_URL=...`. Without it every call fails with
/// [FailureType.unavailable] and the app falls back to the device engine.
class BhashiniSpeechService implements SpeechService {
  /// Creates the adapter.
  BhashiniSpeechService({
    required http.Client client,
    required String baseUrl,
    required String apiKey,
  })  : _client = client,
        _baseUrl = baseUrl,
        _apiKey = apiKey;

  final http.Client _client;
  final String _baseUrl;
  final String _apiKey;

  bool _listening = false;

  @override
  bool get isListening => _listening;

  bool get _isConfigured => _baseUrl.trim().isNotEmpty && _apiKey.trim().isNotEmpty;

  @override
  Future<Result<void>> speak({
    required String text,
    required String languageCode,
  }) async {
    if (!_isConfigured) {
      return Result<void>.failure(
        Failure.unavailable('Bhashini is not configured for this build.'),
      );
    }
    try {
      final uri = Uri.parse('$_baseUrl/tts').replace(
        queryParameters: <String, String>{
          'text': text,
          'lang': languageCode,
          'apiKey': _apiKey,
        },
      );
      final response = await _client.get(uri);
      if (response.statusCode != 200) {
        return Result<void>.failure(
          Failure.network('Bhashini returned ${response.statusCode}.'),
        );
      }
      return const Result<void>.success(null);
    } catch (error, stackTrace) {
      return Result<void>.failure(Failure.network(error, stackTrace));
    }
  }

  @override
  Future<void> stop() async {
    _listening = false;
  }

  @override
  Future<Result<String>> listen({required String languageCode}) async {
    if (!_isConfigured) {
      return Result<String>.failure(
        Failure.unavailable('Bhashini is not configured for this build.'),
      );
    }
    _listening = true;
    return Result<String>.failure(
      Failure.unavailable('Remote recognition requires a streaming session that this build does not open.'),
    );
  }
}
