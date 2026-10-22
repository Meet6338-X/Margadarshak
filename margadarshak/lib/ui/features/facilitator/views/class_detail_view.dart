/// The class roster of one facilitator class.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/enums.dart';
import '../../../../domain/models/facilitator.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/facilitator_view_model.dart';

/// Shows the students of one class and the actions a facilitator can take.
class ClassDetailView extends StatefulWidget {
  /// Creates the page.
  const ClassDetailView({super.key, required this.classId});

  /// The identifier of the class to show.
  final String classId;

  @override
  State<ClassDetailView> createState() => _ClassDetailViewState();
}

class _ClassDetailViewState extends State<ClassDetailView> {
  FacilitatorViewModel? _viewModel;

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
    final viewModel = FacilitatorViewModel(
      classRepository: dependencies.classRepository,
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
      appBar: AppBar(title: Text(l10n.facStudentsTitle)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final record = viewModel.classById(widget.classId);
                if (viewModel.isLoading && record == null) {
                  return const LoadingView();
                }
                if (record == null) {
                  return ErrorView(
                    body: l10n.commonErrorBody,
                    onRetry: _load,
                  );
                }
                return _ClassBody(viewModel: viewModel, record: record);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddStudentSheet(context, viewModel!),
        icon: const Icon(Icons.person_add_alt),
        label: Text(l10n.facAddStudent),
      ),
    );
  }

  Future<void> _showAddStudentSheet(
    BuildContext context,
    FacilitatorViewModel viewModel,
  ) async {
    final l10n = context.l10n;
    final nameController = TextEditingController();
    final classController = TextEditingController(text: '9');

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.facAddStudent,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: l10n.facStudentNameLabel),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: classController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: l10n.facStudentClassLabel),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: l10n.facAddStudent,
                busy: viewModel.isSaving,
                onPressed: () async {
                  final currentClass = int.tryParse(classController.text.trim());
                  if (currentClass == null || currentClass <= 0) return;
                  final added = await viewModel.addStudent(
                    widget.classId,
                    RosterStudent(
                      studentId:
                          'stu_${DateTime.now().microsecondsSinceEpoch}',
                      displayName: nameController.text.trim(),
                      stage: currentClass >= 13
                          ? EducationStage.graduation
                          : currentClass >= 11
                              ? EducationStage.higherSecondary
                              : EducationStage.secondary,
                      currentClass: currentClass,
                      category: SocialCategory.general,
                      incomeBand: IncomeBand.belowOneLakh,
                      gender: Gender.female,
                      firstGenerationLearner: true,
                      isFlagged: false,
                      joinedOn: DateTime.now(),
                    ),
                  );
                  if (added && sheetContext.mounted) {
                    Navigator.of(sheetContext).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ClassBody extends StatelessWidget {
  const _ClassBody({required this.viewModel, required this.record});

  final FacilitatorViewModel viewModel;
  final FacilitatorClass record;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(record.name, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(record.schoolName),
        const SizedBox(height: 16),
        SectionHeader(title: l10n.facStudentsTitle),
        if (record.students.isEmpty)
          AppCard(child: Text(l10n.facNoStudents))
        else
          ...record.students.map(
            (student) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _StudentCard(
                student: student,
                languageCode: languageCode,
                onToggleFlag: () => viewModel.toggleFlag(
                  record.classId,
                  student.studentId,
                  !student.isFlagged,
                ),
                onRecommend: () => _showRecommendSheet(context, student),
              ),
            ),
          ),
        const SizedBox(height: 24),
      ],
    );
  }

  Future<void> _showRecommendSheet(
    BuildContext context,
    RosterStudent student,
  ) async {
    final l10n = context.l10n;
    final languageCode = context.languageCode;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          builder: (context, controller) {
            return ListView(
              controller: controller,
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  l10n.facRecommend,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                ...viewModel.opportunities.map(
                  (opportunity) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AppCard(
                      onTap: () async {
                        await viewModel.recommend(
                          classId: record.classId,
                          studentId: student.studentId,
                          opportunityId: opportunity.id,
                        );
                        if (sheetContext.mounted) {
                          Navigator.of(sheetContext).pop();
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            opportunity.title.resolve(languageCode),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(opportunity.officialSourceName),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _StudentCard extends StatelessWidget {
  const _StudentCard({
    required this.student,
    required this.languageCode,
    required this.onToggleFlag,
    required this.onRecommend,
  });

  final RosterStudent student;
  final String languageCode;
  final VoidCallback onToggleFlag;
  final VoidCallback onRecommend;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = AppThemeColors.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  student.displayName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (student.isFlagged)
                Icon(Icons.star, color: colors.needsInfo, size: 20),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${l10n.profileClass} ${student.currentClass} · '
            '${socialCategoryText(l10n, student.category)} · '
            '${incomeBandText(l10n, student.incomeBand)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (student.recommendedOpportunityIds.isNotEmpty) ...[
            const SizedBox(height: 8),
            InfoChip(
              label: l10n.facRecommended(student.recommendedOpportunityIds.length),
              icon: Icons.recommend_outlined,
            ),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onToggleFlag,
                  icon: const Icon(Icons.star_outline),
                  label: Text(l10n.facFlagTalent),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onRecommend,
                  icon: const Icon(Icons.recommend_outlined),
                  label: Text(l10n.facRecommend),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
