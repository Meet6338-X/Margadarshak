/// The admin list of the opportunities, with the editor for one record.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../../domain/models/opportunity.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/admin_view_model.dart';
import 'admin_shared.dart';

/// Lists the opportunities and opens the editor for one of them.
class AdminOpportunitiesView extends StatefulWidget {
  /// Creates the screen.
  const AdminOpportunitiesView({super.key});

  @override
  State<AdminOpportunitiesView> createState() => _AdminOpportunitiesViewState();
}

class _AdminOpportunitiesViewState extends State<AdminOpportunitiesView> {
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

  Future<void> _openEditor(
    AdminViewModel viewModel,
    Opportunity opportunity,
    bool edited,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _OpportunityEditor(
        opportunity: opportunity,
        edited: edited,
        onSave: viewModel.saveOpportunity,
        onReset: viewModel.resetOpportunity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminOpportunities)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.opportunities.isEmpty) {
                  return const LoadingView();
                }
                if (viewModel.failure != null && viewModel.opportunities.isEmpty) {
                  return ErrorView(
                    body: viewModel.failure!.message,
                    onRetry: _load,
                  );
                }
                if (viewModel.opportunities.isEmpty) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [AppCard(child: Text(l10n.adminNoOpportunities))],
                  );
                }
                return RefreshIndicator(
                  onRefresh: viewModel.load,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.opportunities.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final opportunity = viewModel.opportunities[index];
                      return AppCard(
                        onTap: () => _openEditor(
                          viewModel,
                          opportunity,
                          viewModel.isOpportunityEdited(opportunity.id),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              opportunity.title.resolve(languageCode),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              opportunity.summary.resolve(languageCode),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              children: [
                                InfoChip(
                                  label: opportunityKindText(l10n, opportunity.kind),
                                ),
                                InfoChip(label: opportunity.scope),
                                InfoChip(
                                  label: formatDate(
                                    opportunity.lastVerifiedAt,
                                    languageCode,
                                  ),
                                  icon: Icons.verified_outlined,
                                ),
                                if (viewModel.isOpportunityEdited(opportunity.id))
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

class _OpportunityEditor extends StatefulWidget {
  const _OpportunityEditor({
    required this.opportunity,
    required this.edited,
    required this.onSave,
    required this.onReset,
  });

  final Opportunity opportunity;
  final bool edited;
  final Future<bool> Function(Opportunity opportunity) onSave;
  final Future<bool> Function(String opportunityId) onReset;

  @override
  State<_OpportunityEditor> createState() => _OpportunityEditorState();
}

class _OpportunityEditorState extends State<_OpportunityEditor> {
  late final TextEditingController _titleEn;
  late final TextEditingController _titleHi;
  late final TextEditingController _titleMr;
  late final TextEditingController _summaryEn;
  late final TextEditingController _summaryHi;
  late final TextEditingController _summaryMr;
  late final TextEditingController _sourceName;
  late final TextEditingController _sourceUrl;
  late final TextEditingController _applyUrl;
  late final TextEditingController _minClass;
  late final TextEditingController _maxClass;
  late DateTime _lastVerified;
  DateTime? _closesAt;
  late bool _amountDisclosed;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final opportunity = widget.opportunity;
    _titleEn = TextEditingController(text: opportunity.title.en);
    _titleHi = TextEditingController(text: opportunity.title.hi);
    _titleMr = TextEditingController(text: opportunity.title.mr);
    _summaryEn = TextEditingController(text: opportunity.summary.en);
    _summaryHi = TextEditingController(text: opportunity.summary.hi);
    _summaryMr = TextEditingController(text: opportunity.summary.mr);
    _sourceName = TextEditingController(text: opportunity.officialSourceName);
    _sourceUrl = TextEditingController(text: opportunity.officialSourceUrl);
    _applyUrl = TextEditingController(text: opportunity.applyUrl ?? '');
    _minClass = TextEditingController(text: opportunity.minClass?.toString() ?? '');
    _maxClass = TextEditingController(text: opportunity.maxClass?.toString() ?? '');
    _lastVerified = opportunity.lastVerifiedAt;
    _closesAt = opportunity.applicationClosesAt;
    _amountDisclosed = opportunity.amountDisclosed;
  }

  @override
  void dispose() {
    _titleEn.dispose();
    _titleHi.dispose();
    _titleMr.dispose();
    _summaryEn.dispose();
    _summaryHi.dispose();
    _summaryMr.dispose();
    _sourceName.dispose();
    _sourceUrl.dispose();
    _applyUrl.dispose();
    _minClass.dispose();
    _maxClass.dispose();
    super.dispose();
  }

  Future<void> _pickLastVerified() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _lastVerified,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) setState(() => _lastVerified = picked);
  }

  Future<void> _pickDeadline() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _closesAt ?? now.add(const Duration(days: 30)),
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(2035),
    );
    if (picked != null) setState(() => _closesAt = picked);
  }

  Future<void> _save() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final opportunity = widget.opportunity;
    final applyUrl = _applyUrl.text.trim();
    final updated = opportunity.copyWith(
      title: LocalizedText(
        en: adminTextOr(_titleEn, opportunity.title.en),
        hi: adminTextOr(_titleHi, opportunity.title.hi),
        mr: adminTextOr(_titleMr, opportunity.title.mr),
      ),
      summary: LocalizedText(
        en: adminTextOr(_summaryEn, opportunity.summary.en),
        hi: adminTextOr(_summaryHi, opportunity.summary.hi),
        mr: adminTextOr(_summaryMr, opportunity.summary.mr),
      ),
      officialSourceName: adminTextOr(_sourceName, opportunity.officialSourceName),
      officialSourceUrl: adminTextOr(_sourceUrl, opportunity.officialSourceUrl),
      lastVerifiedAt: _lastVerified,
      applicationClosesAt: _closesAt,
      applyUrl: applyUrl.isEmpty ? null : applyUrl,
      amountDisclosed: _amountDisclosed,
      minClass: int.tryParse(_minClass.text.trim()),
      maxClass: int.tryParse(_maxClass.text.trim()),
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
    final cleared = await widget.onReset(widget.opportunity.id);
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
    final languageCode = context.languageCode;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, adminKeyboardInset(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminOpportunityEditor, style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(widget.opportunity.id, style: theme.textTheme.bodySmall),
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
            TextField(
              controller: _sourceName,
              decoration: InputDecoration(labelText: l10n.adminSourceName),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _sourceUrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(labelText: l10n.adminSourceUrl),
            ),
            const SizedBox(height: 16),
            Text(
              '${l10n.commonLastVerified}: ${formatDate(_lastVerified, languageCode)}',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 6),
            OutlinedButton.icon(
              onPressed: _saving ? null : _pickLastVerified,
              icon: const Icon(Icons.event_available_outlined),
              label: Text(l10n.adminSetDate),
            ),
            const SizedBox(height: 16),
            Text(
              _closesAt == null
                  ? '${l10n.adminDeadline}: -'
                  : '${l10n.adminDeadline}: ${formatDate(_closesAt!, languageCode)}',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: _saving ? null : _pickDeadline,
                  icon: const Icon(Icons.event_outlined),
                  label: Text(l10n.adminSetDate),
                ),
                if (_closesAt != null)
                  TextButton.icon(
                    onPressed: _saving ? null : () => setState(() => _closesAt = null),
                    icon: const Icon(Icons.clear),
                    label: Text(l10n.adminClearDate),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _applyUrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(labelText: l10n.adminApplyUrl),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.adminAmountDisclosed),
              value: _amountDisclosed,
              onChanged: (value) => setState(() => _amountDisclosed = value),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minClass,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: l10n.adminMinClass),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _maxClass,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: l10n.adminMaxClass),
                  ),
                ),
              ],
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
