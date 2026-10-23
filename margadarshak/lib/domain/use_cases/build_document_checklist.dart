/// Collects the documents a student has to collect.
library;

import '../models/opportunity.dart';

/// Builds a single, deduplicated document checklist.
class BuildDocumentChecklist {
  /// Creates the use case.
  const BuildDocumentChecklist();

  /// Returns the documents needed for [opportunities].
  ///
  /// Mandatory documents come first. When [careerId] is given only the
  /// documents linked to that career are returned.
  List<DocumentRequirement> call({
    required List<Opportunity> opportunities,
    String? careerId,
  }) {
    final byId = <String, DocumentRequirement>{};

    for (final opportunity in opportunities) {
      if (careerId != null && !opportunity.careerIds.contains(careerId)) {
        continue;
      }
      for (final document in opportunity.requiredDocuments) {
        byId.putIfAbsent(document.id, () => document);
      }
    }

    final documents = byId.values.toList(growable: false);
    documents.sort((a, b) {
      final byMandatory = (b.isMandatory ? 1 : 0).compareTo(a.isMandatory ? 1 : 0);
      if (byMandatory != 0) return byMandatory;
      return a.id.compareTo(b.id);
    });

    return documents;
  }
}
