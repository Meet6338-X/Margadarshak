/// The screen that lists every opportunity the student can act on.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../../domain/models/opportunity.dart';
import '../../../../domain/models/opportunity_recommendation.dart';
import '../../../../domain/use_cases/collect_deadline_alerts.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/opportunities_view_model.dart';

/// Shows the searchable list of opportunities.
class OpportunitiesView extends StatefulWidget {
  /// Creates the screen.
  const OpportunitiesView({super.key});

  @override
  State<OpportunitiesView> createState() => _OpportunitiesViewState();
}

class _OpportunitiesViewState extends State<OpportunitiesView> {
  OpportunitiesViewModel? _viewModel;

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
    final viewModel = OpportunitiesViewModel(
      opportunityRepository: dependencies.opportunityRepository,
      recommendOpportunities: dependencies.recommendOpportunities,
    );
    setState(() => _viewModel = viewModel);
    await viewModel.load(profile);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.oppTitle)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.visible.isEmpty) {
                  return const LoadingView();
                }
                if (viewModel.failure != null && viewModel.visible.isEmpty) {
                  return ErrorView(
                    body: viewModel.failure!.message,
                    onRetry: _load,
                  );
                }
                return _OpportunitiesBody(viewModel: viewModel);
              },
            ),
    );
  }
}

class _OpportunitiesBody extends StatelessWidget {
  const _OpportunitiesBody({required this.viewModel});

  final OpportunitiesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            onChanged: viewModel.setQuery,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: l10n.oppSearchHint,
              isDense: true,
            ),
          ),
        ),
        SizedBox(
          height: 48,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              InfoChip(
                label: l10n.oppAllScopes,
                selected: viewModel.scope == OpportunityScope.all,
                onTap: () => viewModel.setScope(OpportunityScope.all),
              ),
              const SizedBox(width: 8),
              InfoChip(
                label: l10n.oppNationalSchemes,
                selected: viewModel.scope == OpportunityScope.national,
                onTap: () => viewModel.setScope(OpportunityScope.national),
              ),
              const SizedBox(width: 8),
              InfoChip(
                label: l10n.oppStateSchemes,
                selected: viewModel.scope == OpportunityScope.state,
                onTap: () => viewModel.setScope(OpportunityScope.state),
              ),
              const SizedBox(width: 8),
              InfoChip(
                label: l10n.oppOnlyEligible,
                selected: viewModel.onlyEligible,
                onTap: () => viewModel.toggleOnlyEligible(!viewModel.onlyEligible),
              ),
            ],
          ),
        ),
        if (viewModel.urgentDeadlines.isNotEmpty)
          _DeadlineStrip(
            alerts: viewModel.urgentDeadlines,
            languageCode: languageCode,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              l10n.oppCountResults(viewModel.visibleCount),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        Expanded(
          child: viewModel.visible.isEmpty
              ? EmptyView(
                  title: l10n.oppNoResults,
                  body: l10n.oppNoResultsBody,
                  icon: Icons.search_off,
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  itemCount: viewModel.visible.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.visible[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _OpportunityTile(item: item, languageCode: languageCode),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _DeadlineStrip extends StatelessWidget {
  const _DeadlineStrip({required this.alerts, required this.languageCode});

  final List<DeadlineAlert> alerts;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: Row(
            children: [
              const Icon(Icons.alarm, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  l10n.deadlineSoonTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              for (final alert in alerts)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppCard(
                    onTap: () =>
                        context.push('/opportunity/${alert.opportunity.id}'),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            alert.opportunity.title.resolve(languageCode),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InfoChip(
                          label: l10n.commonDaysLeft(alert.daysLeft),
                          icon: Icons.schedule,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OpportunityTile extends StatelessWidget {
  const _OpportunityTile({required this.item, required this.languageCode});

  final OpportunityRecommendation item;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final opportunity = item.opportunity;
    final daysLeft = opportunity.daysLeftToClose(DateTime.now());

    return AppCard(
      onTap: () => context.push('/opportunity/${opportunity.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  opportunity.title.resolve(languageCode),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              InfoChip(
                label: eligibilityStatusText(l10n, item.eligibility.status),
                color: AppThemeColors.of(context).status(item.eligibility.status),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(opportunity.summary.resolve(languageCode)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              InfoChip(label: opportunityKindText(l10n, opportunity.kind)),
              InfoChip(
                label: l10n.commonVerified,
                icon: Icons.verified_outlined,
                color: AppThemeColors.of(context).verified,
              ),
              if (daysLeft != null && daysLeft >= 0)
                InfoChip(
                  label: l10n.commonDaysLeft(daysLeft),
                  icon: Icons.schedule,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
