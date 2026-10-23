/// The admin console entry screen.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/state_views.dart';
import '../view_models/admin_view_model.dart';

/// Shows the counts, the editors and the reset control.
class AdminDashboardView extends StatefulWidget {
  /// Creates the screen.
  const AdminDashboardView({super.key});

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
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

  Future<void> _confirmReset(AdminViewModel viewModel) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.adminResetAll),
        content: Text(l10n.adminResetAllBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.adminResetAll),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    final cleared = await viewModel.resetAllOverrides();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          cleared
              ? l10n.adminResetDone
              : (viewModel.failure?.message ?? l10n.commonErrorBody),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final viewModel = _viewModel;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminTitle)),
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
                return RefreshIndicator(
                  onRefresh: viewModel.load,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        l10n.adminSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: StatTile(
                              value: '${viewModel.students.length}',
                              label: l10n.adminStudents,
                              icon: Icons.people_outline,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatTile(
                              value: '${viewModel.clips.length}',
                              label: l10n.adminClips,
                              icon: Icons.play_circle_outline,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatTile(
                              value: '${viewModel.opportunities.length}',
                              label: l10n.adminOpportunities,
                              icon: Icons.workspace_premium_outlined,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SectionHeader(title: l10n.adminManage),
                      _AdminEntryCard(
                        icon: Icons.people_outline,
                        title: l10n.adminStudents,
                        onTap: () => context.push('/admin/students'),
                      ),
                      const SizedBox(height: 10),
                      _AdminEntryCard(
                        icon: Icons.play_circle_outline,
                        title: l10n.adminClips,
                        onTap: () => context.push('/admin/clips'),
                      ),
                      const SizedBox(height: 10),
                      _AdminEntryCard(
                        icon: Icons.workspace_premium_outlined,
                        title: l10n.adminOpportunities,
                        onTap: () => context.push('/admin/opportunities'),
                      ),
                      const SizedBox(height: 20),
                      SectionHeader(title: l10n.adminControls),
                      AppCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.tune),
                                const SizedBox(width: 12),
                                Expanded(child: Text(l10n.adminDataPack)),
                                Text(
                                  viewModel.dataPackVersion,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${l10n.adminEdited}: ${viewModel.editedCount}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: viewModel.isSaving
                                    ? null
                                    : () => _confirmReset(viewModel),
                                icon: const Icon(Icons.restart_alt),
                                label: Text(l10n.adminResetAll),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class _AdminEntryCard extends StatelessWidget {
  const _AdminEntryCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.titleSmall),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
