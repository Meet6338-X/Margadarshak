/// Holds the language the app is shown in.
library;

import 'package:flutter/material.dart';

/// Lets the student switch the language of the app.
class LocaleController extends ChangeNotifier {
  /// Creates the controller.
  LocaleController({Locale locale = const Locale('en')}) : _locale = locale;

  Locale _locale;

  /// The language the app is shown in.
  Locale get locale => _locale;

  /// The language codes the app ships with.
  static const List<Locale> supported = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
  ];

  /// Switches the app to [locale].
  void setLocale(Locale locale) {
    if (_locale.languageCode == locale.languageCode) return;
    _locale = locale;
    notifyListeners();
  }
}
