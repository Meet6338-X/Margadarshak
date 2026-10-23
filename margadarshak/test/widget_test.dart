/// Widget tests for the sign-in screen.
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/core/result.dart';
import 'package:margadarshak/domain/models/auth_user.dart';
import 'package:margadarshak/domain/models/enums.dart';
import 'package:margadarshak/domain/repositories/repositories.dart';
import 'package:margadarshak/l10n/generated/app_localizations.dart';
import 'package:margadarshak/ui/features/auth/view_models/auth_view_model.dart';
import 'package:margadarshak/ui/features/auth/views/login_view.dart';
import 'package:provider/provider.dart';

/// A repository that records what the screen asked it to do.
class _FakeAuthRepository implements AuthRepository {
  AuthUser? signedInUser;

  @override
  Future<Result<AuthUser?>> currentUser() async => const Result<AuthUser?>.success(null);

  @override
  Stream<AuthUser?> authStateChanges() => const Stream<AuthUser?>.empty();

  @override
  Future<Result<AuthUser>> signIn({
    required String userId,
    required String displayName,
    required UserRole role,
  }) async {
    signedInUser = AuthUser(
      userId: 'local_student_1',
      displayName: displayName,
      role: role,
    );
    return Result<AuthUser>.success(signedInUser!);
  }

  @override
  Future<Result<void>> signOut() async => const Result<void>.success(null);
}

void main() {
  Widget buildApp(_FakeAuthRepository repository) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (_) => AuthViewModel(authRepository: repository),
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: <Locale>[
          Locale('en'),
          Locale('hi'),
          Locale('mr'),
        ],
        home: LoginView(),
      ),
    );
  }

  testWidgets('shows the app name and both roles', (tester) async {
    final repository = _FakeAuthRepository();

    await tester.pumpWidget(buildApp(repository));

    expect(find.text('Margadarshak'), findsOneWidget);
    expect(find.text('I am a student'), findsOneWidget);
    expect(find.text('I am a teacher or mentor'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('refuses to continue without a name', (tester) async {
    final repository = _FakeAuthRepository();

    await tester.pumpWidget(buildApp(repository));
    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(find.textContaining('name is required'), findsOneWidget);
    expect(repository.signedInUser, isNull);
  });

  testWidgets('signs the student in with the typed name', (tester) async {
    final repository = _FakeAuthRepository();

    await tester.pumpWidget(buildApp(repository));
    await tester.enterText(find.byType(TextField), 'Asha');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(repository.signedInUser, isNotNull);
    expect(repository.signedInUser!.displayName, 'Asha');
    expect(repository.signedInUser!.role, UserRole.student);
  });

  testWidgets('can be signed in as a facilitator', (tester) async {
    final repository = _FakeAuthRepository();

    await tester.pumpWidget(buildApp(repository));
    await tester.enterText(find.byType(TextField), 'Kiran');
    await tester.tap(find.text('I am a teacher or mentor'));
    await tester.pump();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(repository.signedInUser!.role, UserRole.facilitator);
  });
}
