/// Shared building blocks for every screen.
library;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// The primary call to action of a screen.
class PrimaryButton extends StatelessWidget {
  /// Creates the button.
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.busy = false,
  });

  /// The text on the button.
  final String label;

  /// Called when the button is tapped.
  final VoidCallback? onPressed;

  /// An optional leading icon.
  final IconData? icon;

  /// Whether the button shows a spinner instead of its label.
  final bool busy;

  @override
  Widget build(BuildContext context) {
    if (busy) {
      return const SizedBox(
        height: 52,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (icon == null) {
      return FilledButton(onPressed: onPressed, child: Text(label));
    }
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}

/// A secondary, less important action.
class SecondaryButton extends StatelessWidget {
  /// Creates the button.
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  /// The text on the button.
  final String label;

  /// Called when the button is tapped.
  final VoidCallback? onPressed;

  /// An optional leading icon.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return OutlinedButton(onPressed: onPressed, child: Text(label));
    }
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}

/// A rounded container used for every block of content.
class AppCard extends StatelessWidget {
  /// Creates the card.
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppTheme.gap + 4),
    this.color,
  });

  /// The content of the card.
  final Widget child;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// The padding around [child].
  final EdgeInsetsGeometry padding;

  /// An optional background colour.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: color ?? theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppTheme.radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

/// A titled section with an optional trailing action.
class SectionHeader extends StatelessWidget {
  /// Creates the header.
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
  });

  /// The title of the section.
  final String title;

  /// An optional supporting line.
  final String? subtitle;

  /// An optional trailing widget, usually a text button.
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.gap, top: AppTheme.gap),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: theme.textTheme.titleMedium),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      subtitle!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (action != null) action!,
        ],
      ),
    );
  }
}

/// A single number with a label, used for points, streaks and counts.
class StatTile extends StatelessWidget {
  /// Creates the tile.
  const StatTile({
    super.key,
    required this.value,
    required this.label,
    this.icon,
  });

  /// The number to show.
  final String value;

  /// The label under the number.
  final String label;

  /// An optional icon.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (icon != null) Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// A small pill used for categories, kinds and tags.
class InfoChip extends StatelessWidget {
  /// Creates the chip.
  const InfoChip({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.selected = false,
    this.onTap,
  });

  /// The text on the chip.
  final String label;

  /// An optional leading icon.
  final IconData? icon;

  /// An optional colour for the text and the icon.
  final Color? color;

  /// Whether the chip is in a selected state.
  final bool selected;

  /// Called when the chip is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effective = color ?? theme.colorScheme.primary;
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (icon != null) ...<Widget>[
          Icon(icon, size: 15, color: selected ? theme.colorScheme.onPrimaryContainer : effective),
          const SizedBox(width: 4),
        ],
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: selected ? theme.colorScheme.onPrimaryContainer : effective,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );

    return Material(
      color: selected ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7), child: content),
      ),
    );
  }
}
