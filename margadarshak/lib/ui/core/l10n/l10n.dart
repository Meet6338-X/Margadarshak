/// Convenience access to the generated localisations.
library;

import 'package:flutter/widgets.dart';

import '../../../l10n/generated/app_localizations.dart';

/// Gives a [BuildContext] a short hand for the localisations.
extension AppLocalizationsX on BuildContext {
  /// The localisations for the current locale.
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// The language code of the current locale, for example `mr`.
  String get languageCode => Localizations.localeOf(this).languageCode;
}
