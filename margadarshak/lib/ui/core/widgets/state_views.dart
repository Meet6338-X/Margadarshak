/// The three states every data driven screen can be in.
library;

import 'package:flutter/material.dart';

/// Shown while the first load is running.
class LoadingView extends StatelessWidget {
  /// Creates the view.
  const LoadingView({super.key, this.message});

  /// An optional message under the spinner.
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CircularProgressIndicator(),
          if (message != null) ...<Widget>[
            const SizedBox(height: 16),
            Text(message!, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}

/// Shown when something went wrong and the user can try again.
class ErrorView extends StatelessWidget {
  /// Creates the view.
  const ErrorView({
    super.key,
    this.title,
    this.body,
    this.onRetry,
    this.retryLabel,
  });

  /// The headline.
  final String? title;

  /// The supporting line.
  final String? body;

  /// Called when the user asks to try again.
  final VoidCallback? onRetry;

  /// The label of the retry button.
  final String? retryLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 12),
            if (title != null) ...<Widget>[
              Text(title!, style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
              const SizedBox(height: 8),
            ],
            if (body != null)
              Text(
                body!,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            if (onRetry != null) ...<Widget>[
              const SizedBox(height: 20),
              FilledButton.tonal(onPressed: onRetry, child: Text(retryLabel ?? 'Retry')),
            ],
          ],
        ),
      ),
    );
  }
}

/// Shown when a list is legitimately empty.
class EmptyView extends StatelessWidget {
  /// Creates the view.
  const EmptyView({
    super.key,
    required this.title,
    this.body,
    this.icon = Icons.inbox_outlined,
    this.action,
  });

  /// The headline.
  final String title;

  /// The supporting line.
  final String? body;

  /// The icon above the headline.
  final IconData icon;

  /// An optional call to action.
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 44, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(height: 12),
            Text(title, style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
            if (body != null) ...<Widget>[
              const SizedBox(height: 8),
              Text(
                body!,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...<Widget>[
              const SizedBox(height: 20),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
