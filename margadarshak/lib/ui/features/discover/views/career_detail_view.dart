/// The page that shows one career in full.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../core/failure.dart';
import '../../../../domain/models/career.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../../domain/models/opportunity.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';

/// Shows the career, its study path and the opportunities that lead to it.
class CareerDetailView extends StatefulWidget {
  /// Creates the page.
  const CareerDetailView({super.key, required this.careerId});

  /// The identifier of the career to show.
  final String careerId;

  @override
  State<CareerDetailView> createState() => _CareerDetailViewState();
}

class _CareerDetailViewState extends State<CareerDetailView> {
  Career? _career;
  List<Opportunity> _opportunities = const [];
  bool _isLoading = true;
  Failure? _failure;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final dependencies = context.read<AppDependencies>();

    final careerResult = await dependencies.careerRepository.getById(widget.careerId);
    final career = careerResult.valueOrNull;
    final opportunityResult =
        await dependencies.opportunityRepository.getForCareer(widget.careerId);

    if (!mounted) return;
    setState(() {
      _career = career;
      _opportunities = opportunityResult.valueOrNull ?? const [];
      _failure = career == null ? careerResult.failureOrNull : null;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final career = _career;
    final languageCode = context.languageCode;

    return Scaffold(
      appBar: AppBar(title: Text(career?.title.resolve(languageCode) ?? l10n.appTitle)),
      body: _isLoading
          ? const LoadingView()
          : career == null
              ? ErrorView(
                  body: _failure?.message ?? l10n.commonErrorBody,
                  onRetry: _load,
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        InfoChip(label: careerCategoryText(l10n, career.category)),
                        if (career.nonStem) InfoChip(label: l10n.discoverExploreMore),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(career.summary.resolve(languageCode)),
                    const SizedBox(height: 20),
                    SectionHeader(title: l10n.discoverEducationPath),
                    AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: career.educationPath
                            .map((step) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text('• $step'),
                                ))
                            .toList(growable: false),
                      ),
                    ),
                    if (career.entrySteps.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      SectionHeader(title: l10n.discoverEntrySteps),
                      AppCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: career.entrySteps
                              .map((step) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Text('• ${step.resolve(languageCode)}'),
                                  ))
                              .toList(growable: false),
                        ),
                      ),
                    ],
                    if (_opportunities.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      SectionHeader(title: l10n.oppTitle),
                      ..._opportunities.map(
                        (opportunity) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: AppCard(
                            onTap: () => context.push('/opportunity/${opportunity.id}'),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  opportunity.title.resolve(languageCode),
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(opportunity.summary.resolve(languageCode)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                  ],
                ),
    );
  }
}
