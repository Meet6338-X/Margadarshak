/// Opens the official source of a record in the browser.
library;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/l10n.dart';

/// Opens [url] in the device browser.
///
/// Every opportunity the app shows points at an official page. Opening it is
/// how the student checks the claim, so a failure here has to be visible.
Future<bool> openOfficialSource(BuildContext context, String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null || !uri.hasScheme) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.commonErrorBody)),
      );
    }
    return false;
  }

  try {
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.commonErrorBody)),
      );
    }
    return opened;
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.commonErrorBody)),
      );
    }
    return false;
  }
}
