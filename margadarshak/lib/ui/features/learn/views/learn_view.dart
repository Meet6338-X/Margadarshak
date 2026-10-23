/// The screen with the five short clips of the day and the streak.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/clip.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/url_opener.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/learn_view_model.dart';

/// Shows the daily queue, the streak and the one-question check-in.
class LearnView extends StatefulWidget {
  /// Creates the screen.
  const LearnView({super.key});

  @override
  State<LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView> {
  LearnViewModel? _viewModel;

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
    final viewModel = LearnViewModel(
      clipRepository: dependencies.clipRepository,
      studentRepository: dependencies.studentRepository,
      buildDailyQueue: dependencies.buildDailyQueue,
      computeStreak: dependencies.computeStreak,
    );
    setState(() => _viewModel = viewModel);
    await viewModel.load(user.userId, context.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.learnTitle)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.queue.isEmpty) {
                  return const LoadingView();
                }
                if (viewModel.failure != null && viewModel.queue.isEmpty) {
                  return ErrorView(
                    body: viewModel.failure!.message,
                    onRetry: _load,
                  );
                }
                return _LearnBody(viewModel: viewModel);
              },
            ),
    );
  }
}

class _LearnBody extends StatelessWidget {
  const _LearnBody({required this.viewModel});

  final LearnViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;
    final streak = viewModel.streak;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l10n.learnSubtitle),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: StatTile(
                value: '${streak.currentDays}',
                label: l10n.learnStreak,
                icon: Icons.local_fire_department_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatTile(
                value: '${streak.freezesAvailable}',
                label: l10n.learnFreezes,
                icon: Icons.ac_unit,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatTile(
                value: '${viewModel.progress.points}',
                label: l10n.learnPoints,
                icon: Icons.star_outline,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SectionHeader(title: l10n.learnTodayTitle),
        if (viewModel.queue.isEmpty)
          AppCard(child: Text(l10n.learnQueueDone))
        else
          ...viewModel.queue.map(
            (clip) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ClipCard(
                clip: clip,
                languageCode: languageCode,
                viewModel: viewModel,
              ),
            ),
          ),
        const SizedBox(height: 8),
        SectionHeader(title: l10n.learnCheckinQuestion),
        AppCard(
          child: Row(
            children: [
              Expanded(child: Text(l10n.learnCheckinQuestion)),
              const SizedBox(width: 12),
              if (viewModel.hasCheckedIn)
                InfoChip(
                  label: l10n.learnCheckinDone,
                  icon: Icons.check,
                  color: AppThemeColors.of(context).eligible,
                )
              else
                PrimaryButton(
                  label: l10n.learnCheckinSend,
                  onPressed: viewModel.checkIn,
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SectionHeader(title: l10n.learnBadges),
        if (viewModel.progress.badges.isEmpty)
          AppCard(child: Text(l10n.learnNoBadges))
        else
          AppCard(
            child: Column(
              children: viewModel.progress.badges.map((badge) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.workspace_premium_outlined),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(badge.label.resolve(languageCode)),
                      ),
                    ],
                  ),
                );
              }).toList(growable: false),
            ),
          ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _ClipCard extends StatelessWidget {
  const _ClipCard({
    required this.clip,
    required this.languageCode,
    required this.viewModel,
  });

  final Clip clip;
  final String languageCode;
  final LearnViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppCard(
      onTap: () async {
        final fresh =
            await context.read<AppDependencies>().clipRepository.getById(clip.id);
        final current = fresh.valueOrNull ?? clip;
        if (!context.mounted) return;
        await showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) => _ClipSheet(clip: current, viewModel: viewModel),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            clip.title.resolve(languageCode),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(clip.summary.resolve(languageCode)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              InfoChip(
                label: l10n.learnDuration(clip.durationSeconds),
                icon: Icons.play_circle_outline,
              ),
              InfoChip(label: clip.language.toUpperCase()),
              if ((clip.videoUrl ?? '').isNotEmpty)
                InfoChip(
                  label: l10n.commonVideoChip,
                  icon: Icons.ondemand_video_outlined,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ClipSheet extends StatelessWidget {
  const _ClipSheet({required this.clip, required this.viewModel});

  final Clip clip;
  final LearnViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clip.title.resolve(languageCode),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            ...clip.slides.map(
              (slide) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('• $slide'),
              ),
            ),
            if ((clip.videoUrl ?? '').isNotEmpty) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => openOfficialSource(context, clip.videoUrl!),
                  icon: const Icon(Icons.ondemand_video_outlined),
                  label: Text(l10n.commonWatchVideo),
                ),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context
                        .read<AppDependencies>()
                        .speechService
                        .speak(text: clip.summary.resolve(languageCode), languageCode: languageCode),
                    icon: const Icon(Icons.volume_up_outlined),
                    label: Text(l10n.learnClipOfDay),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await viewModel.completeClip(clip);
                    },
                    icon: const Icon(Icons.check),
                    label: Text(l10n.learnCompleteClip),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
