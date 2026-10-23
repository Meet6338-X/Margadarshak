/// The screen that shows what the app knows about the signed-in person.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/locale_controller.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/state_names.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/profile_view_model.dart';

/// Shows the profile, the progress and the privacy note.
class ProfileView extends StatefulWidget {
  /// Creates the screen.
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final session = context.read<SessionController>();
    final user = session.user;
    if (user == null) return;

    final dependencies = context.read<AppDependencies>();
    final viewModel = ProfileViewModel(
      studentRepository: dependencies.studentRepository,
      opportunityRepository: dependencies.opportunityRepository,
    );
    setState(() => _viewModel = viewModel);
    await viewModel.load(user.userId);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.profile == null) {
                  return const LoadingView();
                }
                if (viewModel.profile == null) {
                  return ErrorView(
                    body: viewModel.failure?.message ?? l10n.commonErrorBody,
                    onRetry: _load,
                  );
                }
                return _ProfileBody(viewModel: viewModel);
              },
            ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.viewModel});

  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;
    final profile = viewModel.profile!;
    final session = context.watch<SessionController>();
    final localeController = context.watch<LocaleController>();
    final progress = viewModel.progress;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.displayName.isEmpty ? l10n.profileIdentity : profile.displayName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '${l10n.profileStudentId}: ${profile.studentId}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(
                session.isFacilitator ? l10n.profileFacilitator : l10n.profileStudent,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SectionHeader(title: l10n.profileAbout),
        AppCard(
          child: Column(
            children: [
              _Row(label: l10n.profileStage, value: stageText(l10n, profile.stage)),
              _Row(label: l10n.profileClass, value: '${profile.currentClass}'),
              _Row(
                label: l10n.profileState,
                value: _stateName(profile.stateCode, languageCode),
              ),
              _Row(label: l10n.profileDistrict, value: profile.district),
              _Row(
                label: l10n.profileCategory,
                value: socialCategoryText(l10n, profile.category),
              ),
              _Row(
                label: l10n.profileIncome,
                value: incomeBandText(l10n, profile.incomeBand),
              ),
              _Row(label: l10n.profileGender, value: genderText(l10n, profile.gender)),
              _Row(
                label: l10n.profileFirstGeneration,
                value: profile.firstGenerationLearner
                    ? l10n.commonYes
                    : l10n.commonNo,
              ),
            ],
          ),
        ),
        if (profile.interests.isNotEmpty) ...[
          const SizedBox(height: 16),
          SectionHeader(title: l10n.profileInterests),
          AppCard(
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: profile.interests
                  .map((tag) => InfoChip(label: interestText(l10n, tag)))
                  .toList(growable: false),
            ),
          ),
        ],
        if (progress != null) ...[
          const SizedBox(height: 16),
          SectionHeader(title: l10n.learnPoints),
          Row(
            children: [
              Expanded(
                child: StatTile(
                  value: '${progress.points}',
                  label: l10n.learnPoints,
                  icon: Icons.star_outline,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatTile(
                  value: '${progress.streak.currentDays}',
                  label: l10n.learnStreak,
                  icon: Icons.local_fire_department_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatTile(
                  value: '${progress.badges.length}',
                  label: l10n.learnBadges,
                  icon: Icons.workspace_premium_outlined,
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 16),
        SectionHeader(title: l10n.profileLanguage),
        AppCard(
          child: Wrap(
            spacing: 8,
            children: LocaleController.supported.map((locale) {
              return InfoChip(
                label: locale.languageCode.toUpperCase(),
                selected: locale.languageCode == localeController.locale.languageCode,
                onTap: () => localeController.setLocale(locale),
              );
            }).toList(growable: false),
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.profilePrivacyNote,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '${l10n.profileDataPackVersion}: ${viewModel.dataPackVersion}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SecondaryButton(
          label: l10n.authSignOut,
          icon: Icons.logout,
          onPressed: () => context.read<SessionController>().signOut(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  static String _stateName(String code, String languageCode) {
    for (final state in appStates) {
      if (state.code == code) return state.name(languageCode);
    }
    return code;
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
