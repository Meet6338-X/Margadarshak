/// The sign-in screen.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/enums.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_widgets.dart';
import '../view_models/auth_view_model.dart';

/// Lets a student or a facilitator start using the app.
class LoginView extends StatelessWidget {
  /// Creates the view.
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = context.watch<AuthViewModel>();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          children: <Widget>[
            Text(
              context.l10n.appTitle,
              style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.appTagline,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            Text(context.l10n.authYourName, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            TextField(
              onChanged: viewModel.setDisplayName,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(hintText: context.l10n.authYourNameHint),
            ),
            const SizedBox(height: 24),
            _RoleOption(
              title: context.l10n.authIAmStudent,
              body: context.l10n.authStudentBody,
              icon: Icons.school_outlined,
              selected: viewModel.role == UserRole.student,
              onTap: () => viewModel.setRole(UserRole.student),
            ),
            const SizedBox(height: 12),
            _RoleOption(
              title: context.l10n.authIAmFacilitator,
              body: context.l10n.authFacilitatorBody,
              icon: Icons.groups_outlined,
              selected: viewModel.role == UserRole.facilitator,
              onTap: () => viewModel.setRole(UserRole.facilitator),
            ),
            if (viewModel.failure != null) ...<Widget>[
              const SizedBox(height: 16),
              Text(
                viewModel.failure!.message,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
              ),
            ],
            const SizedBox(height: 32),
            PrimaryButton(
              label: context.l10n.authContinue,
              busy: viewModel.isBusy,
              onPressed: () => viewModel.signIn(),
            ),
          ],
        ),
      ),
    );
  }
}

/// A card that lets the person pick who they are.
class _RoleOption extends StatelessWidget {
  const _RoleOption({
    required this.title,
    required this.body,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String body;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppCard(
      onTap: onTap,
      color: selected ? theme.colorScheme.primaryContainer : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: selected ? theme.colorScheme.onPrimaryContainer : theme.colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: selected ? theme.colorScheme.onPrimaryContainer : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: selected
                        ? theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (selected)
            Icon(Icons.check_circle, color: theme.colorScheme.onPrimaryContainer),
        ],
      ),
    );
  }
}
