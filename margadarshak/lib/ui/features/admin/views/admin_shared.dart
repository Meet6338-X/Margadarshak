/// Small building blocks shared by the admin editors.
library;

import 'package:flutter/material.dart';

/// A labelled row of choice chips used for the enum fields.
class AdminChipGroup extends StatelessWidget {
  /// Creates the group.
  const AdminChipGroup({required this.label, required this.children, super.key});

  /// The label above the chips.
  final String label;

  /// The chips themselves.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 6),
          Wrap(spacing: 8, runSpacing: 6, children: children),
        ],
      ),
    );
  }
}

/// The text a field should keep when the admin leaves it untouched.
String adminTextOr(TextEditingController controller, String? fallback) {
  final value = controller.text.trim();
  if (value.isNotEmpty) return value;
  return fallback ?? '';
}

/// The bottom padding an editor needs above the keyboard.
double adminKeyboardInset(BuildContext context) =>
    MediaQuery.of(context).viewInsets.bottom + 24;
