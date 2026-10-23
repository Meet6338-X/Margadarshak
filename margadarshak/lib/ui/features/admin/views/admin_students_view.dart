/// The admin list of the student profiles stored on this device.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/enums.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/admin_view_model.dart';
import 'admin_shared.dart';

/// Lists the profiles and opens the editor for one of them.
class AdminStudentsView extends StatefulWidget {
  /// Creates the screen.
  const AdminStudentsView({super.key});

  @override
  State<AdminStudentsView> createState() => _AdminStudentsViewState();
}

class _AdminStudentsViewState extends State<AdminStudentsView> {
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

  Future<void> _openEditor(AdminViewModel viewModel, StudentProfile profile) async {
    final currentUserId = context.read<SessionController>().user?.userId;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _StudentEditor(
        profile: profile,
        canDelete: profile.studentId != currentUserId,
        onSave: viewModel.saveStudent,
        onDelete: viewModel.deleteStudent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminStudents)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.students.isEmpty) {
                  return const LoadingView();
                }
                if (viewModel.failure != null && viewModel.students.isEmpty) {
                  return ErrorView(
                    body: viewModel.failure!.message,
                    onRetry: _load,
                  );
                }
                if (viewModel.students.isEmpty) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [AppCard(child: Text(l10n.adminNoStudents))],
                  );
                }
                return RefreshIndicator(
                  onRefresh: viewModel.load,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.students.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final student = viewModel.students[index];
                      return AppCard(
                        onTap: () => _openEditor(viewModel, student),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: Text(
                                student.displayName.isEmpty
                                    ? '?'
                                    : student.displayName.characters.first.toUpperCase(),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    student.displayName,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${stageText(l10n, student.stage)}'
                                    ' · ${student.currentClass}'
                                    ' · ${student.district}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              student.studentId,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              Icons.edit_outlined,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
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

class _StudentEditor extends StatefulWidget {
  const _StudentEditor({
    required this.profile,
    required this.canDelete,
    required this.onSave,
    required this.onDelete,
  });

  final StudentProfile profile;
  final bool canDelete;
  final Future<bool> Function(StudentProfile profile) onSave;
  final Future<bool> Function(String studentId) onDelete;

  @override
  State<_StudentEditor> createState() => _StudentEditorState();
}

class _StudentEditorState extends State<_StudentEditor> {
  late final TextEditingController _nameController;
  late final TextEditingController _classController;
  late final TextEditingController _districtController;
  late EducationStage _stage;
  late SocialCategory _category;
  late IncomeBand _incomeBand;
  late Gender _gender;
  late bool _firstGeneration;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final profile = widget.profile;
    _nameController = TextEditingController(text: profile.displayName);
    _classController = TextEditingController(text: '${profile.currentClass}');
    _districtController = TextEditingController(text: profile.district);
    _stage = profile.stage;
    _category = profile.category;
    _incomeBand = profile.incomeBand;
    _gender = profile.gender;
    _firstGeneration = profile.firstGenerationLearner;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    _districtController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final profile = widget.profile;
    final parsedClass = int.tryParse(_classController.text.trim()) ?? profile.currentClass;
    final updated = profile.copyWith(
      displayName: adminTextOr(_nameController, profile.displayName),
      stage: _stage,
      currentClass: parsedClass.clamp(1, 12).toInt(),
      district: adminTextOr(_districtController, profile.district),
      category: _category,
      incomeBand: _incomeBand,
      gender: _gender,
      firstGenerationLearner: _firstGeneration,
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

  Future<void> _delete() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.adminDeleteStudentTitle),
        content: Text(l10n.adminDeleteStudentBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.adminDelete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    setState(() => _saving = true);
    final deleted = await widget.onDelete(widget.profile.studentId);
    if (!mounted) return;
    setState(() => _saving = false);
    if (!deleted) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.commonErrorBody)));
      return;
    }
    navigator.pop();
    messenger.showSnackBar(SnackBar(content: Text(l10n.adminDeletedDone)));
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
            Text(l10n.adminStudentEditor, style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              '${l10n.profileStudentId}: ${widget.profile.studentId}',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: l10n.adminDisplayName),
            ),
            const SizedBox(height: 14),
            AdminChipGroup(
              label: l10n.profileStage,
              children: EducationStage.values
                  .map(
                    (stage) => InfoChip(
                      label: stageText(l10n, stage),
                      selected: _stage == stage,
                      onTap: () => setState(() => _stage = stage),
                    ),
                  )
                  .toList(growable: false),
            ),
            TextField(
              controller: _classController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.profileClass),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _districtController,
              decoration: InputDecoration(labelText: l10n.profileDistrict),
            ),
            const SizedBox(height: 14),
            AdminChipGroup(
              label: l10n.profileCategory,
              children: SocialCategory.values
                  .map(
                    (category) => InfoChip(
                      label: socialCategoryText(l10n, category),
                      selected: _category == category,
                      onTap: () => setState(() => _category = category),
                    ),
                  )
                  .toList(growable: false),
            ),
            AdminChipGroup(
              label: l10n.profileIncome,
              children: IncomeBand.values
                  .map(
                    (band) => InfoChip(
                      label: incomeBandText(l10n, band),
                      selected: _incomeBand == band,
                      onTap: () => setState(() => _incomeBand = band),
                    ),
                  )
                  .toList(growable: false),
            ),
            AdminChipGroup(
              label: l10n.profileGender,
              children: Gender.values
                  .map(
                    (gender) => InfoChip(
                      label: genderText(l10n, gender),
                      selected: _gender == gender,
                      onTap: () => setState(() => _gender = gender),
                    ),
                  )
                  .toList(growable: false),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.profileFirstGeneration),
              value: _firstGeneration,
              onChanged: (value) => setState(() => _firstGeneration = value),
            ),
            const SizedBox(height: 8),
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
            if (widget.canDelete) ...[
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _saving ? null : _delete,
                icon: const Icon(Icons.delete_outline),
                label: Text(l10n.adminDelete),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
