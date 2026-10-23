/// The form a facilitator uses to publish a module.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/dependency_injection.dart';
import '../../../../app/session_controller.dart';
import '../../../../domain/models/clip.dart';
import '../../../../domain/models/enums.dart';
import '../../../../domain/models/facilitator.dart';
import '../../../../domain/models/localized_text.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_widgets.dart';
import '../view_models/facilitator_view_model.dart';

/// Lets a facilitator publish a short module.
class ModuleEditorView extends StatefulWidget {
  /// Creates the page.
  const ModuleEditorView({super.key});

  @override
  State<ModuleEditorView> createState() => _ModuleEditorViewState();
}

class _ModuleEditorViewState extends State<ModuleEditorView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController(text: '10');

  ModulePricing _pricing = ModulePricing.free;
  final Set<String> _selectedClipIds = <String>{};
  FacilitatorViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final user = context.read<SessionController>().user;
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
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final dependencies = context.read<AppDependencies>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.facPublishModule)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: l10n.facModuleTitleLabel),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _descriptionController,
            maxLines: 3,
            decoration: InputDecoration(labelText: l10n.facModuleBodyLabel),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.facPricingLabel,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: ModulePricing.values.map((pricing) {
              return InfoChip(
                label: switch (pricing) {
                  ModulePricing.free => l10n.facPricingFree,
                  ModulePricing.payPerModule => l10n.facPricingPayPerModule,
                  ModulePricing.subscription => l10n.facPricingSubscription,
                },
                selected: _pricing == pricing,
                onTap: () => setState(() => _pricing = pricing),
              );
            }).toList(growable: false),
          ),
          if (_pricing != ModulePricing.free) ...[
            const SizedBox(height: 12),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.facPriceLabel),
            ),
          ],
          const SizedBox(height: 12),
          TextField(
            controller: _durationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: l10n.learnDuration(600)),
          ),
          const SizedBox(height: 20),
          SectionHeader(title: l10n.learnTitle),
          FutureBuilder<List<Clip>>(
            future: dependencies.clipRepository.getAll().then(
                  (result) => result.valueOrNull ?? const <Clip>[],
                ),
            builder: (context, snapshot) {
              final clips = snapshot.data ?? const <Clip>[];
              if (clips.isEmpty) return const SizedBox.shrink();
              return Column(
                children: clips.map((clip) {
                  return CheckboxListTile(
                    value: _selectedClipIds.contains(clip.id),
                    title: Text(clip.title.resolve(context.languageCode)),
                    subtitle: Text(clip.formattedDuration),
                    onChanged: (checked) {
                      setState(() {
                        if (checked ?? false) {
                          _selectedClipIds.add(clip.id);
                        } else {
                          _selectedClipIds.remove(clip.id);
                        }
                      });
                    },
                  );
                }).toList(growable: false),
              );
            },
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: l10n.facPublish,
            icon: Icons.publish_outlined,
            onPressed: _publish,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Future<void> _publish() async {
    final session = context.read<SessionController>();
    final user = session.user;
    if (user == null) return;

    final viewModel = _viewModel;
    if (viewModel == null) return;
    final price = int.tryParse(_priceController.text.trim()) ?? 0;
    final duration = int.tryParse(_durationController.text.trim()) ?? 10;

    final published = await viewModel.publishModule(
      PublishedModule(
        moduleId: 'module_${DateTime.now().millisecondsSinceEpoch}',
        title: _titleController.text.trim(),
        description: LocalizedText(
          en: _descriptionController.text.trim(),
          hi: _descriptionController.text.trim(),
          mr: _descriptionController.text.trim(),
        ),
        pricing: _pricing,
        priceInRupees: _pricing == ModulePricing.free ? 0 : price,
        durationMinutes: duration,
        clipIds: _selectedClipIds.toList(growable: false),
        ownerFacilitatorId: user.userId,
        publishedOn: DateTime.now(),
      ),
    );

    if (published && mounted) {
      Navigator.of(context).pop();
    }
  }
}
