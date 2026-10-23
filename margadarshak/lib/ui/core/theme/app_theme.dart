/// The visual language of the app.
library;

import 'package:flutter/material.dart';

import '../../../domain/models/enums.dart';

/// The colours, shapes and text styles used across the app.
///
/// The palette is deliberately warm and high contrast: the app is used on
/// cheap phones, outdoors, and by people who read Marathi and Hindi.
abstract final class AppTheme {
  /// The seed colour the whole scheme is derived from.
  static const Color seed = Color(0xFF00695C);

  /// The colour used for verified records.
  static const Color verified = Color(0xFF2E7D32);

  /// The colour used for a match the student qualifies for.
  static const Color eligible = Color(0xFF1B5E20);

  /// The colour used for a record that still needs information.
  static const Color needsInfo = Color(0xFFEF6C00);

  /// The colour used for a record the student does not qualify for.
  static const Color notEligible = Color(0xFF6D4C41);

  /// The corner radius used by cards and sheets.
  static const double radius = 16;

  /// The spacing unit used by the layouts.
  static const double gap = 12;

  /// The light theme.
  static ThemeData light() => _build(Brightness.light);

  /// The dark theme.
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(seedColor: seed, brightness: brightness);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        surfaceTintColor: scheme.surfaceTint,
        centerTitle: false,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}

/// The semantic colours resolved for the brightness the app is running in.
class AppThemeColors {
  /// Creates the palette.
  const AppThemeColors({
    required this.verified,
    required this.eligible,
    required this.needsInfo,
    required this.notEligible,
  });

  /// The colour used for verified records.
  final Color verified;

  /// The colour used for a match the student qualifies for.
  final Color eligible;

  /// The colour used for a record that still needs information.
  final Color needsInfo;

  /// The colour used for a record the student does not qualify for.
  final Color notEligible;

  /// Resolves the palette for the theme in [context].
  factory AppThemeColors.of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppThemeColors(
      verified: isDark ? const Color(0xFF81C784) : AppTheme.verified,
      eligible: isDark ? const Color(0xFF81C784) : AppTheme.eligible,
      needsInfo: isDark ? const Color(0xFFFFB74D) : AppTheme.needsInfo,
      notEligible: isDark ? const Color(0xFFBCAAA4) : AppTheme.notEligible,
    );
  }

  /// The colour that matches [status].
  Color status(EligibilityStatus status) => switch (status) {
        EligibilityStatus.eligible => eligible,
        EligibilityStatus.needsInfo => needsInfo,
        EligibilityStatus.notEligible => notEligible,
      };
}
