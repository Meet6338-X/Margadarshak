/// The facilitator console: the classes and the published modules.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/enums.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/text_maps.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/facilitator_view_model.dart';

/// Shows the classes, the roster entry point and the published modules.
class FacilitatorView extends StatefulWidget {
  /// Creates the screen.
  const FacilitatorView({super.key});

  @override
  State<FacilitatorView> createState() => _FacilitatorViewState();
}

class _FacilitatorViewState extends State<FacilitatorView> {
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
      appBar: AppBar(title: Text(l10n.facTitle)),
      body: viewModel == null
          ? const LoadingView()
          : ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isLoading && viewModel.classes.isEmpty) {
                  return const LoadingView();
                }
                if (viewModel.failure != null && viewModel.classes.isEmpty) {
                  return ErrorView(
                    body: viewModel.failure!.message,
                    onRetry: _load,
                  );
                }
                return _FacilitatorBody(viewModel: viewModel);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateClassSheet(context, viewModel!),
        icon: const Icon(Icons.group_add_outlined),
        label: Text(l10n.facNewClass),
      ),
    );
  }

  Future<void> _showCreateClassSheet(
    BuildContext context,
    FacilitatorViewModel viewModel,
  ) async {
    final l10n = context.l10n;
    final nameController = TextEditingController();
    final schoolController = TextEditingController();

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
                l10n.facNewClass,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: l10n.facClassNameLabel),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: schoolController,
                decoration: InputDecoration(labelText: l10n.facSchoolLabel),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: l10n.facNewClass,
                busy: viewModel.isSaving,
                onPressed: () async {
                  final created = await viewModel.createClass(
                    name: nameController.text,
                    schoolName: schoolController.text,
                    state: 'mh',
                    district: '',
                  );
                  if (created && sheetContext.mounted) {
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

class _FacilitatorBody extends StatelessWidget {
  const _FacilitatorBody({required this.viewModel});

  final FacilitatorViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final languageCode = context.languageCode;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l10n.facSubtitle),
        const SizedBox(height: 16),
        SectionHeader(title: l10n.facClassesTitle),
        if (viewModel.classes.isEmpty)
          EmptyView(
            title: l10n.facClassEmpty,
            body: l10n.facSubtitle,
            icon: Icons.groups_outlined,
          )
        else
          ...viewModel.classes.map(
            (record) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                onTap: () => context.push('/facilitator/class/${record.classId}'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(record.schoolName),
                    const SizedBox(height: 8),
                    InfoChip(
                      label: l10n.facStudentCount(record.students.length),
                      icon: Icons.people_outline,
                    ),
                  ],
                ),
              ),
            ),
          ),
        const SizedBox(height: 12),
        SectionHeader(title: l10n.facModulesTitle),
        if (viewModel.modules.isEmpty)
          AppCard(child: Text(l10n.facNoModules))
        else
          ...viewModel.modules.map(
            (module) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(module.description.resolve(languageCode)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        InfoChip(label: modulePricingText(l10n, module.pricing)),
                        if (module.pricing != ModulePricing.free)
                          InfoChip(label: '₹${module.priceInRupees}'),
                        InfoChip(label: '${module.durationMinutes} min'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        const SizedBox(height: 8),
        AppCard(child: Text(l10n.facVisibilityNote)),
        const SizedBox(height: 12),
        PrimaryButton(
          label: l10n.facPublishModule,
          icon: Icons.upload_outlined,
          onPressed: () => context.push('/facilitator/module/new'),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
