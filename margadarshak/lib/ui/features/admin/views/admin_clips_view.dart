/// The admin list of the learning clips, with the editor for one clip.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../domain/models/clip.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/admin_view_model.dart';
import 'admin_shared.dart';

/// Lists the clips and opens the editor for one of them.
class AdminClipsView extends StatefulWidget {
  /// Creates the screen.
  const AdminClipsView({super.key});

  @override
  State<AdminClipsView> createState() => _AdminClipsViewState();
}

class _AdminClipsViewState extends State<AdminClipsView> {
  AdminViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final dependencies = context.read<AppDependencies>();
    final viewModel = AdminViewModel(
      adminRepository: dependencies.adminRepository,
      clipRepository: dependencies.clipRepository,
      opportunityRepository: dependencies.opportunityRepository,
      studentRepository: dependencies.studentRepository,
    );
    setState(() => _viewModel = viewModel);
    await viewModel.load();
  }

  Future<void> _openEditor(AdminViewModel viewModel, Clip clip, bool edited) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _ClipEditor(
        clip: clip,
        edited: edited,
        onSave: viewModel.saveClip,
        onReset: viewModel.resetClip,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminClips)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.clips.isEmpty) {
                  return const LoadingView();
                }
                if (viewModel.failure != null && viewModel.clips.isEmpty) {
                  return ErrorView(
                    body: viewModel.failure!.message,
                    onRetry: _load,
                  );
                }
                if (viewModel.clips.isEmpty) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [AppCard(child: Text(l10n.adminNoClips))],
                  );
                }
                return RefreshIndicator(
                  onRefresh: viewModel.load,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.clips.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final clip = viewModel.clips[index];
                      final hasVideo = (clip.videoUrl ?? '').isNotEmpty;
                      return AppCard(
                        onTap: () => _openEditor(
                          viewModel,
                          clip,
                          viewModel.isClipEdited(clip.id),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              clip.title.resolve(languageCode),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              clip.summary.resolve(languageCode),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              children: [
                                InfoChip(
                                  label: clip.formattedDuration,
                                  icon: Icons.play_circle_outline,
                                ),
                                InfoChip(label: clip.language.toUpperCase()),
                                if (hasVideo)
                                  InfoChip(
                                    label: l10n.commonVideoChip,
                                    icon: Icons.ondemand_video_outlined,
                                  ),
                                if (viewModel.isClipEdited(clip.id))
                                  InfoChip(
                                    label: l10n.adminEdited,
                                    icon: Icons.edit_outlined,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

class _ClipEditor extends StatefulWidget {
  const _ClipEditor({
    required this.clip,
    required this.edited,
    required this.onSave,
    required this.onReset,
  });

  final Clip clip;
  final bool edited;
  final Future<bool> Function(Clip clip) onSave;
  final Future<bool> Function(String clipId) onReset;

  @override
  State<_ClipEditor> createState() => _ClipEditorState();
}

class _ClipEditorState extends State<_ClipEditor> {
  late final TextEditingController _titleEn;
  late final TextEditingController _titleHi;
  late final TextEditingController _titleMr;
  late final TextEditingController _summaryEn;
  late final TextEditingController _summaryHi;
  late final TextEditingController _summaryMr;
  late final TextEditingController _duration;
  late final TextEditingController _videoUrl;
  late final TextEditingController _slides;
  late String _language;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final clip = widget.clip;
    _titleEn = TextEditingController(text: clip.title.en);
    _titleHi = TextEditingController(text: clip.title.hi);
    _titleMr = TextEditingController(text: clip.title.mr);
    _summaryEn = TextEditingController(text: clip.summary.en);
    _summaryHi = TextEditingController(text: clip.summary.hi);
    _summaryMr = TextEditingController(text: clip.summary.mr);
    _duration = TextEditingController(text: '${clip.durationSeconds}');
    _videoUrl = TextEditingController(text: clip.videoUrl ?? '');
    _slides = TextEditingController(text: clip.slides.join('\n'));
    _language = clip.language;
  }

  @override
  void dispose() {
    _titleEn.dispose();
    _titleHi.dispose();
    _titleMr.dispose();
    _summaryEn.dispose();
    _summaryHi.dispose();
    _summaryMr.dispose();
    _duration.dispose();
    _videoUrl.dispose();
    _slides.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final clip = widget.clip;
    final videoUrl = _videoUrl.text.trim();
    final updated = clip.copyWith(
      title: LocalizedText(
        en: adminTextOr(_titleEn, clip.title.en),
        hi: adminTextOr(_titleHi, clip.title.hi),
        mr: adminTextOr(_titleMr, clip.title.mr),
      ),
      summary: LocalizedText(
        en: adminTextOr(_summaryEn, clip.summary.en),
        hi: adminTextOr(_summaryHi, clip.summary.hi),
        mr: adminTextOr(_summaryMr, clip.summary.mr),
      ),
      durationSeconds: int.tryParse(_duration.text.trim()) ?? clip.durationSeconds,
      language: _language,
      videoUrl: videoUrl.isEmpty ? null : videoUrl,
      slides: _slides.text
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList(growable: false),
    );

    setState(() => _saving = true);
    final saved = await widget.onSave(updated);
    if (!mounted) return;
    setState(() => _saving = false);
    if (!saved) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.commonErrorBody)));
      return;
    }
    navigator.pop();
    messenger.showSnackBar(SnackBar(content: Text(l10n.adminSaveDone)));
  }

  Future<void> _reset() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    setState(() => _saving = true);
    final cleared = await widget.onReset(widget.clip.id);
    if (!mounted) return;
    setState(() => _saving = false);
    if (!cleared) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.commonErrorBody)));
      return;
    }
    navigator.pop();
    messenger.showSnackBar(SnackBar(content: Text(l10n.adminResetDone)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, adminKeyboardInset(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminClipEditor, style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(widget.clip.id, style: theme.textTheme.bodySmall),
            const SizedBox(height: 16),
            TextField(
              controller: _titleEn,
              decoration: InputDecoration(labelText: l10n.adminTitleEn),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _titleHi,
              decoration: InputDecoration(labelText: l10n.adminTitleHi),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _titleMr,
              decoration: InputDecoration(labelText: l10n.adminTitleMr),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _summaryEn,
              maxLines: 2,
              decoration: InputDecoration(labelText: l10n.adminSummaryEn),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _summaryHi,
              maxLines: 2,
              decoration: InputDecoration(labelText: l10n.adminSummaryHi),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _summaryMr,
              maxLines: 2,
              decoration: InputDecoration(labelText: l10n.adminSummaryMr),
            ),
            const SizedBox(height: 16),
            AdminChipGroup(
              label: l10n.profileLanguage,
              children: const ['en', 'hi', 'mr']
                  .map(
                    (code) => InfoChip(
                      label: code.toUpperCase(),
                      selected: _language == code,
                      onTap: () => setState(() => _language = code),
                    ),
                  )
                  .toList(growable: false),
            ),
            TextField(
              controller: _duration,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.adminDurationSeconds),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _videoUrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(labelText: l10n.adminVideoUrl),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _slides,
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(labelText: l10n.adminSlides),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    label: l10n.commonCancel,
                    onPressed: _saving ? null : () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryButton(
                    label: l10n.commonSave,
                    icon: Icons.check,
                    busy: _saving,
                    onPressed: _saving ? null : _save,
                  ),
                ),
              ],
            ),
            if (widget.edited) ...[
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _saving ? null : _reset,
                icon: const Icon(Icons.restart_alt),
                label: Text(l10n.adminRestoreFromPack),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
