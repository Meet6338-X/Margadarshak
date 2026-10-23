/// The screen where a student finds careers worth considering.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/career_match.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../../domain/models/opportunity_recommendation.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/discover_view_model.dart';

/// Shows the career suggestions and the opportunities that fit the student.
class DiscoverView extends StatefulWidget {
  /// Creates the screen.
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  DiscoverViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final session = context.read<SessionController>();
    final profile = session.profile;
    if (profile == null) return;

    final dependencies = context.read<AppDependencies>();
    final viewModel = DiscoverViewModel(
      discoverCareers: dependencies.discoverCareers,
      careerRepository: dependencies.careerRepository,
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
      appBar: AppBar(title: Text(l10n.discoverTitle)),
      body: RefreshIndicator(
        onRefresh: _load,
        child: viewModel == null
            ? const LoadingView()
            : ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  if (viewModel.isLoading && viewModel.matches.isEmpty) {
                    return const LoadingView();
                  }
                  if (viewModel.failure != null && viewModel.matches.isEmpty) {
                    return ErrorView(
                      body: viewModel.failure!.message,
                      onRetry: _load,
                    );
                  }
                  return _DiscoverBody(
                    viewModel: viewModel,
                    profile: context.read<SessionController>().profile,
                  );
                },
              ),
      ),
    );
  }
}

class _DiscoverBody extends StatelessWidget {
  const _DiscoverBody({required this.viewModel, required this.profile});

  final DiscoverViewModel viewModel;
  final StudentProfile? profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l10n.discoverSubtitle),
        const SizedBox(height: 16),
        SectionHeader(title: l10n.discoverTopMatches),
        if (viewModel.topMatches.isEmpty)
          AppCard(
            child: Text(l10n.discoverNoMatchesBody),
          )
        else
          ...viewModel.topMatches.map(
            (match) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _CareerCard(match: match, languageCode: languageCode),
            ),
          ),
        if (viewModel.recommendations.isNotEmpty) ...[
          const SizedBox(height: 8),
          SectionHeader(title: l10n.oppTitle),
          ...viewModel.recommendations.take(3).map(
                (recommendation) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _OpportunityCard(
                    recommendation: recommendation,
                    languageCode: languageCode,
                  ),
                ),
              ),
        ],
        if (viewModel.exploreMore.isNotEmpty) ...[
          const SizedBox(height: 8),
          SectionHeader(title: l10n.discoverExploreMore),
          ...viewModel.exploreMore.map(
            (match) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _CareerCard(match: match, languageCode: languageCode),
            ),
          ),
        ],
        const SizedBox(height: 8),
        if (profile != null)
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.discoverEditProfile,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  '${stageText(l10n, profile!.stage)} · '
                  'Class ${profile!.currentClass} · '
                  '${socialCategoryText(l10n, profile!.category)}',
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _CareerCard extends StatelessWidget {
  const _CareerCard({required this.match, required this.languageCode});

  final CareerMatch match;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final career = match.career;

    return AppCard(
      onTap: () => context.push('/career/${career.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  career.title.resolve(languageCode),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              InfoChip(label: careerCategoryText(l10n, career.category)),
            ],
          ),
          const SizedBox(height: 6),
          Text(career.summary.resolve(languageCode)),
          if (match.matchedTags.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: match.matchedTags
                  .map((tag) => InfoChip(label: interestText(l10n, tag)))
                  .toList(growable: false),
            ),
          ],
        ],
      ),
    );
  }
}

class _OpportunityCard extends StatelessWidget {
  const _OpportunityCard({required this.recommendation, required this.languageCode});

  final OpportunityRecommendation recommendation;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final opportunity = recommendation.opportunity;

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
                label: eligibilityStatusText(l10n, recommendation.eligibility.status),
                color: AppThemeColors.of(context).status(
                  recommendation.eligibility.status,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(opportunity.summary.resolve(languageCode)),
        ],
      ),
    );
  }
}
