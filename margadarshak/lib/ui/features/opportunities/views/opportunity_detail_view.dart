/// The page that shows one opportunity in full, with its rules and sources.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/eligibility_result.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../../domain/models/opportunity.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/url_opener.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/opportunity_detail_view_model.dart';

/// Shows the opportunity, the rule outcomes and the document checklist.
class OpportunityDetailView extends StatefulWidget {
  /// Creates the page.
  const OpportunityDetailView({super.key, required this.opportunityId});

  /// The identifier of the record to show.
  final String opportunityId;

  @override
  State<OpportunityDetailView> createState() => _OpportunityDetailViewState();
}

class _OpportunityDetailViewState extends State<OpportunityDetailView> {
  OpportunityDetailViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final profile = context.read<SessionController>().profile;
    if (profile == null) return;

    final dependencies = context.read<AppDependencies>();
    final viewModel = OpportunityDetailViewModel(
      opportunityRepository: dependencies.opportunityRepository,
      explanationRepository: dependencies.explanationRepository,
      evaluateEligibility: dependencies.evaluateEligibility,
      buildDocumentChecklist: dependencies.buildDocumentChecklist,
    );
    setState(() => _viewModel = viewModel);
    await viewModel.load(widget.opportunityId, profile);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.commonViewDetails),
        actions: [
          if (viewModel?.opportunity != null)
            IconButton(
              tooltip: l10n.commonOpenLink,
              icon: const Icon(Icons.open_in_new),
              onPressed: () => openOfficialSource(
                context,
                viewModel!.opportunity!.officialSourceUrl,
              ),
            ),
        ],
      ),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final opportunity = viewModel.opportunity;
                if (viewModel.isLoading && opportunity == null) {
                  return const LoadingView();
                }
                if (opportunity == null) {
                  return ErrorView(
                    body: viewModel.failure?.message ?? l10n.commonErrorBody,
                    onRetry: _load,
                  );
                }
                return _DetailBody(viewModel: viewModel, opportunity: opportunity);
              },
            ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.viewModel, required this.opportunity});

  final OpportunityDetailViewModel viewModel;
  final Opportunity opportunity;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;
    final colors = AppThemeColors.of(context);
    final eligibility = viewModel.eligibility;
    final profile = context.read<SessionController>().profile;
    final now = DateTime.now();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          opportunity.title.resolve(languageCode),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            InfoChip(label: opportunityKindText(l10n, opportunity.kind)),
            if (eligibility != null)
              InfoChip(
                label: eligibilityStatusText(l10n, eligibility.status),
                color: colors.status(eligibility.status),
              ),
            InfoChip(
              label: l10n.commonVerified,
              icon: Icons.verified_outlined,
              color: colors.verified,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(opportunity.summary.resolve(languageCode)),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                opportunity.officialSourceName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(
                '${l10n.commonLastVerified}: '
                '${l10n.oppLastVerifiedOn(formatDate(opportunity.lastVerifiedAt, languageCode))}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: l10n.commonOpenLink,
                icon: Icons.open_in_new,
                onPressed: () =>
                    openOfficialSource(context, opportunity.officialSourceUrl),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.howToApplyTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 6),
              for (var index = 0; index < opportunity.applySteps.length; index++)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${index + 1}. '),
                      Expanded(
                        child: Text(
                          opportunity
                              .applySteps[index]
                              .resolve(languageCode),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              PrimaryButton(
                label: l10n.applyNow,
                icon: Icons.task_alt,
                onPressed: () => openOfficialSource(
                  context,
                  opportunity.applyUrl ?? opportunity.officialSourceUrl,
                ),
              ),
            ],
          ),
        ),
        if (opportunity.applicationClosesAt != null) ...[
          const SizedBox(height: 12),
          AppCard(
            child: Row(
              children: [
                const Icon(Icons.event),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${l10n.oppDeadline}: '
                    '${l10n.oppLastVerifiedOn(formatDate(opportunity.applicationClosesAt!, languageCode))}',
                  ),
                ),
                if (opportunity.isOpenOn(now))
                  InfoChip(label: l10n.oppOpenNow),
              ],
            ),
          ),
        ],
        if (eligibility != null) ...[
          const SizedBox(height: 16),
          SectionHeader(title: l10n.oppRulesTitle),
          AppCard(
            child: Column(
              children: eligibility.outcomes.map((outcome) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        _iconFor(outcome),
                        size: 20,
                        color: outcome.passed ? colors.eligible : colors.needsInfo,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          reasonText(l10n, outcome.reasonKey),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(growable: false),
            ),
          ),
        ],
        const SizedBox(height: 16),
        SectionHeader(title: l10n.oppDocumentChecklist),
        if (viewModel.documents.isEmpty)
          AppCard(child: Text(l10n.oppNoDocuments))
        else
          AppCard(
            child: Column(
              children: viewModel.documents.map((document) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        document.isMandatory
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              document.label.resolve(languageCode),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              document.whereToGet.resolve(languageCode),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(growable: false),
            ),
          ),
        const SizedBox(height: 16),
        SectionHeader(title: l10n.oppExplainTitle),
        if (profile != null)
          PrimaryButton(
            label: l10n.oppExplainButton,
            icon: Icons.auto_awesome,
            busy: viewModel.isExplaining,
            onPressed: () => viewModel.explain(profile, context.languageCode),
          ),
        if (viewModel.explanation != null) ...[
          const SizedBox(height: 12),
          _ExplanationCard(viewModel: viewModel),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  static IconData _iconFor(RuleOutcome outcome) {
    if (outcome.passed) return Icons.check_circle_outline;
    if (outcome.actualValue == null) return Icons.help_outline;
    return Icons.cancel_outlined;
  }
}

class _ExplanationCard extends StatelessWidget {
  const _ExplanationCard({required this.viewModel});

  final OpportunityDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final explanation = viewModel.explanation!;

    if (!explanation.hasVerifiedMatch) {
      return AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.oppExplainNoMatch,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(l10n.oppExplainNoMatchBody),
          ],
        ),
      );
    }

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(explanation.text),
          if (explanation.nextSteps.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              l10n.oppExplainNextSteps,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            ...explanation.nextSteps.map((step) => Text('• $step')),
          ],
          const SizedBox(height: 12),
          Text(
            l10n.oppExplainCited,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            l10n.oppExplainOffline,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
