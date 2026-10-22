/// The application shell.
library;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/config/app_config.dart';
import '../l10n/generated/app_localizations.dart';
import '../ui/core/theme/app_theme.dart';
import 'dependency_injection.dart';
import 'locale_controller.dart';
import 'router.dart';
import 'session_controller.dart';

/// The root widget of the app.
class MargadarshakApp extends StatefulWidget {
  /// Creates the app.
  const MargadarshakApp({super.key, required this.dependencies});

  /// Everything the screens need, built once at start-up.
  final AppDependencies dependencies;

  @override
  State<MargadarshakApp> createState() => _MargadarshakAppState();
}

class _MargadarshakAppState extends State<MargadarshakApp> {
  late final SessionController _session;
  late final LocaleController _locale;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _session = SessionController(
      authRepository: widget.dependencies.authRepository,
      studentRepository: widget.dependencies.studentRepository,
    );
    _locale = LocaleController();
    _router = createRouter(_session);
    _session.start();
  }

  @override
  void dispose() {
    _router.dispose();
    _locale.dispose();
    _session.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDependencies>.value(value: widget.dependencies),
        ChangeNotifierProvider<SessionController>.value(value: _session),
        ChangeNotifierProvider<LocaleController>.value(value: _locale),
      ],
      child: ListenableBuilder(
        listenable: _locale,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Margadarshak',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            locale: _locale.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppConfig.supportedLocales
                .map((code) => Locale(code))
                .toList(growable: false),
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
