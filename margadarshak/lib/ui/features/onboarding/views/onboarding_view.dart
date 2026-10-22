/// The onboarding form.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/enums.dart';
import '../../../../domain/models/interest_taxonomy.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/state_names.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/widgets/app_widgets.dart';
import '../view_models/onboarding_view_model.dart';

/// Collects the facts the rules engine needs.
class OnboardingView extends StatefulWidget {
  /// Creates the view.
  const OnboardingView({super.key, required this.studentId, required this.onSaved});

  /// The identifier the profile is stored under.
  final String studentId;

  /// Called once the profile was saved, so the session can reload it.
  final Future<void> Function() onSaved;

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final TextEditingController _districtController;

  @override
  void initState() {
    super.initState();
    _districtController = TextEditingController(
      text: context.read<OnboardingViewModel>().district,
    );
  }

  @override
  void dispose() {
    _districtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = context.watch<OnboardingViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.onbTitle),
        leading: viewModel.step > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: viewModel.back,
              )
            : null,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: <Widget>[
            Text(
              context.l10n.onbSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.onbStepOf(viewModel.step + 1, kOnboardingStepCount),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: (viewModel.step + 1) / kOnboardingStepCount),
            const SizedBox(height: 24),
            switch (viewModel.step) {
              0 => _ClassStep(viewModel: viewModel),
              1 => _InterestStep(viewModel: viewModel),
              2 => _PlaceStep(viewModel: viewModel, controller: _districtController),
              _ => _BackgroundStep(viewModel: viewModel),
            },
            if (viewModel.failure != null) ...<Widget>[
              const SizedBox(height: 16),
              Text(
                viewModel.failure!.message,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
              ),
            ],
            const SizedBox(height: 28),
            PrimaryButton(
              label: viewModel.step == kOnboardingStepCount - 1
                  ? context.l10n.onbSaveProfile
                  : context.l10n.commonNext,
              busy: viewModel.isBusy,
              onPressed: viewModel.canContinue
                  ? () async {
                      if (viewModel.step == kOnboardingStepCount - 1) {
                        final saved = await viewModel.save(widget.studentId);
                        if (saved && context.mounted) {
                          await widget.onSaved();
                        }
                      } else {
                        viewModel.next();
                      }
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassStep extends StatelessWidget {
  const _ClassStep({required this.viewModel});

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(l10n.onbClassQuestion, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: <Widget>[
            InfoChip(
              label: l10n.onbStageSecondary,
              selected: viewModel.stage == EducationStage.secondary,
              onTap: () => viewModel.setStage(EducationStage.secondary),
            ),
            InfoChip(
              label: l10n.onbStageHigher,
              selected: viewModel.stage == EducationStage.higherSecondary,
              onTap: () => viewModel.setStage(EducationStage.higherSecondary),
            ),
            InfoChip(
              label: l10n.onbStageGraduation,
              selected: viewModel.stage == EducationStage.graduation,
              onTap: () => viewModel.setStage(EducationStage.graduation),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: viewModel.availableClasses
              .map(
                (value) => InfoChip(
                  label: '$value',
                  selected: viewModel.currentClass == value,
                  onTap: () => viewModel.setClass(value),
                ),
              )
              .toList(growable: false),
        ),
      ],
    );
  }
}

class _InterestStep extends StatelessWidget {
  const _InterestStep({required this.viewModel});

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(l10n.onbInterestsQuestion, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          l10n.onbInterestsHint,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: InterestTaxonomy.allTags
              .map(
                (tag) => InfoChip(
                  label: interestText(l10n, tag),
                  selected: viewModel.interests.contains(tag),
                  onTap: () => viewModel.toggleInterest(tag),
                ),
              )
              .toList(growable: false),
        ),
      ],
    );
  }
}

class _PlaceStep extends StatelessWidget {
  const _PlaceStep({required this.viewModel, required this.controller});

  final OnboardingViewModel viewModel;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(l10n.onbDistrictQuestion, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          onChanged: viewModel.setDistrict,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(hintText: l10n.onbDistrictHint),
        ),
        const SizedBox(height: 24),
        Text(l10n.label_state, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: appStates
              .map(
                (state) => InfoChip(
                  label: state.name(context.languageCode),
                  selected: viewModel.state == state.code,
                  onTap: () => viewModel.setState(state.code),
                ),
              )
              .toList(growable: false),
        ),
      ],
    );
  }
}

class _BackgroundStep extends StatelessWidget {
  const _BackgroundStep({required this.viewModel});

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(l10n.onbCategoryQuestion, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: SocialCategory.values
              .map(
                (value) => InfoChip(
                  label: socialCategoryText(l10n, value),
                  selected: viewModel.category == value,
                  onTap: () => viewModel.setCategory(value),
                ),
              )
              .toList(growable: false),
        ),
        const SizedBox(height: 24),
        Text(l10n.onbIncomeQuestion, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: IncomeBand.values
              .map(
                (value) => InfoChip(
                  label: incomeBandText(l10n, value),
                  selected: viewModel.incomeBand == value,
                  onTap: () => viewModel.setIncomeBand(value),
                ),
              )
              .toList(growable: false),
        ),
        const SizedBox(height: 24),
        Text(l10n.onbGenderQuestion, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: Gender.values
              .map(
                (value) => InfoChip(
                  label: genderText(l10n, value),
                  selected: viewModel.gender == value,
                  onTap: () => viewModel.setGender(value),
                ),
              )
              .toList(growable: false),
        ),
        const SizedBox(height: 24),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.onbFirstGenQuestion),
          value: viewModel.firstGenerationLearner,
          onChanged: viewModel.setFirstGenerationLearner,
        ),
      ],
    );
  }
}
